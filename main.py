# Description:
# This script aims to be interactive. It allows to compute metrics within pre-built similarity matrices.
# The matrices have been built computing cosine similarities between words extracted from pre-built semantic spaces.
# These cover different languages: English, Italian, French, German, Spanish and Croatian.

# You can use it to
#       1) Extract and plot the most similar pairs words from a specific subspace/matrix;
#       2) Extract and plot the most similar words to a input target from a specific subspace/matrix;
#       3) Plot heatmaps of the pre-built matrices.

# Note:
# Adjust the script parameters, such as directories and functions parameters, as needed for your specific use case.

# Dependencies: 
# - Pandas: 2.0.3
# - Matplotlib: 3.7.1
# - Seaborn: 0.11.2

#############################

# Import necessary libraries

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#############################

# Dictionary mapping language codes to their respective similarity matrix file paths
file_mapping = {
    'eng': '/Users/francesca/PycharmProjects/HLT_project/matrices/eng_similarity_matrix.csv',
    'ger': '/Users/francesca/PycharmProjects/HLT_project/matrices/ger_similarity_matrix.csv',
    'ita': '/Users/francesca/PycharmProjects/HLT_project/matrices/ita_similarity_matrix.csv',
    'fr': '/Users/francesca/PycharmProjects/HLT_project/matrices/fr_similarity_matrix.csv',
    'spa': '/Users/francesca/PycharmProjects/HLT_project/matrices/esp_similarity_matrix.csv',
    'cro': '/Users/francesca/PycharmProjects/HLT_project/matrices/hr_similarity_matrix.csv',
}


# Function to print the top similarity pairs from a given matrix file.
# You can change the number of pairs that you want to print.
def print_top_similarity_pairs(csv_path, num_pairs_to_print=80):
    # Load the similarity matrix from the CSV file into a DataFrame
    df = pd.read_csv(csv_path, index_col=0)

    # List to store pairs with their similarity values
    max_similarity_pairs = []

    # Iterate through the upper triangle of the matrix to find pairs with highest similarity
    for i in range(len(df)):
        for j in range(i + 1, len(df)):
            similarity = df.iloc[i, j]
            if similarity < 1:  # Exclude pairs with similarity value equal to 1
                max_similarity_pairs.append(((df.index[i], df.columns[j]), similarity))

    # Sort the pairs based on similarity in descending order
    max_similarity_pairs.sort(key=lambda x: x[1], reverse=True)

    # Print the top similarity pairs up to the specified number
    for pair, similarity in max_similarity_pairs[:num_pairs_to_print]:
        print(f'Pair: {pair}, Similarity: {similarity}')


# Function to print the most similar words to a target input one from a given CSV file.
# You can change the number of items that you want to print.
def plot_most_similar_to_target(df, target_word, num_items_to_plot=40):
    # Extract similarity scores for the target word from the DataFrame
    target_similarity_scores = df.loc[target_word]

    # Sort similarity scores in descending order
    sorted_similarity_scores = target_similarity_scores.sort_values(ascending=False)

    # Extract the top N similar items (excluding the target word itself)
    top_similar_items = sorted_similarity_scores.iloc[1:num_items_to_plot + 1]

    # Print the most similar items and their similarity scores
    print(f"Most Similar Items to '{target_word}':")
    for neighbor, similarity in top_similar_items.items():
        print(f"{neighbor}: {similarity:.4f}")

    # Plot the top similar items in a bar chart
    plt.figure(figsize=(10, 6))
    top_similar_items.plot(kind='bar', color='skyblue', rot=75)
    plt.title(f'Most Similar Items to "{target_word}"')
    plt.xlabel('Similar Items')
    plt.ylabel('Cosine Similarity')
    plt.show()


# Path where you want to store the heatmaps
output_path = '/Users/francesca/PycharmProjects/HLT_project/matrices/heatmaps/'

# Function to plot heatmap from the bre-built similarity matrices
def save_clustered_heatmap(title, output_path):
    # Get the CSV file path corresponding to the specified title from the file_mapping dictionary
    csv_path = file_mapping[title]

    # Load the similarity matrix from the CSV file into a DataFrame
    df = pd.read_csv(csv_path, index_col=0)

    # Set the size of the heatmap figure
    plt.figure(figsize=(8, 6))

    # Define a custom color palette for the heatmap
    custom_palette = sns.color_palette("flare", as_cmap=True)

    # Create a clustered heatmap without dendrograms
    sns.clustermap(df, cmap=custom_palette, annot=False, fmt=".2f", cbar_kws={'label': 'Cosine Similarity'},
                   method='fastcluster', row_cluster=False, col_cluster=False)

    # Set the title for the heatmap
    plt.title(f'Clustered Cosine Similarity Heatmap - {title}')

    # Save the clustered heatmap as an image file
    plt.savefig(output_path + title + '_heatmap.png', bbox_inches='tight')


# User interaction function
def define_function(selected_function):
    # Validate user input for selected function
    while selected_function not in ['1', '2', '3']:
        print("Invalid option. Please choose 1, 2, or 3.")
        selected_function = input("Enter the function [1] top similarity pairs, [2] most similar to target, [3] clustered heatmap -> ")

    # Option 1: print_top_similarity_pairs function
    if selected_function == '1':
        # Prompt user for language short name
        short_name = input("Enter the language short name for the comparison file [eng, ger, ita, fr, spa, cro] -> ").lower()
        while short_name not in file_mapping:
            print(f"Error: Invalid short name '{short_name}'. Please choose from: [eng, ger, ita, fr, spa, or cro].")
            short_name = input("Enter the language short name for the comparison file -> ").lower()
        csv_file = file_mapping[short_name]
        print_top_similarity_pairs(csv_file)

    # Option 2: plot_most_similar_to_target function
    elif selected_function == '2':
        # Prompt user for language short name and target word
        short_name = input("Enter the language short name for the comparison file [eng, ger, ita, fr, spa, cro] -> ").lower()
        while short_name not in file_mapping:
            print(f"Error: Invalid short name '{short_name}'. Please choose from [eng, ger, ita, fr, spa, or cro].")
            short_name = input("Enter the language short name for the comparison file -> ").lower()
        target_word = input("Enter the target word: ")
        csv_file = file_mapping[short_name]

        # Load the matrix and validate the target word
        df = pd.read_csv(csv_file, index_col=0)
        available_target_words = df.columns.tolist()
        while target_word not in available_target_words:
            print(f"Error: '{target_word}' not found in the list of target words.")
            target_word = input("Please enter the target word from the list below:\n" + ", ".join(available_target_words) + "\n")
        plot_most_similar_to_target(df, target_word)

    # Option 3: save_clustered_heatmap function
    elif selected_function == '3':
        # Prompt user for language short name and save clustered heatmap
        selected_language = input("Enter the language short name for the comparison file [eng, ger, ita, fr, spa, cro] -> ")
        while selected_language not in file_mapping:
            print(f"Error: Invalid language '{selected_language}'. Please choose from [eng, ger, ita, fr, spa, or cro].")
            selected_language = input("Enter the language [eng, ger, ita, fr, spa, cro] -> ")
        save_clustered_heatmap(selected_language)
        print(f"Heatmap saved for {selected_language}.")

selected_function = input("Enter the function [1] top similarity pairs, [2] most similar to target, [3] clustered heatmap) ->  ")
define_function(selected_function)
