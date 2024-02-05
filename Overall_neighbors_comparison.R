# Description:
# This script aims to be interactive. It is built using the LSAfun package,
# allowing to compute neighbors representation for chosen target words in pre-built semantic spaces.

# Note: 
# Adjust the script parameters, such as directories and functions parameters, as needed for your specific use case.

#############################

# Import necessary libraries
# The package can be downloaded from Günther et al. (2015) https://sites.google.com/site/fritzgntr/software-resources/r_packages 
install.packages("LSAfun") 
library(LSAfun)

# The semantic spaces can be downloaded from https://sites.google.com/site/fritzgntr/software-resources/semantic_spaces
# English cbow space, 400 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/baroni.rda")

# Italian cbow space, 400 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/itwac_cbow.rda")

# French HAL space, 300 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/frwak100k.rda")

# German cbow space, 400 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/dewac_cbow.rda")

# Spanish cbow space, 400 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/es_cbow.rda")

# Croatian cbow space, 300 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/hr_cbow.rda")

#############################

# Function to compute neighbors over the entire semantic spaces.
# The parameters which you can modify are: 
# target words, number of neighbors, vectorial representation sources.

# English
neighbors("woman", n=20, tvectors = baroni) 

# Italian
neighbors("donna", n=20, tvectors = itwac) 

# French
neighbors("femme", n=20, tvectors = frwak100k) 

# German
neighbors("weiblich", n=20, tvectors = dewac) 

# Spanish
neighbors("mujer", n=20, tvectors = es_cbow) 

# Croatian
neighbors("zena", n=20, tvectors = hr_cbow) 


# Function to graphically plots the neighbors. 
# This can be done with PCA or MDS, in 3 or 2-dimensional representations.
# Target words, number of neighbors and vectorial representation sources can be modified.
plot_neighbors('woman', n = 10, tvectors = baroni, method = "PCA", dims = 3)