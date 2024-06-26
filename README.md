## An exploration of gender biases through a distributional semantics lens
[Montecchiari_Project_Report.pdf](https://github.com/memonji/gender-biases-exploration/files/14270670/Montecchiari_Project_Report.pdf)

[Project Presentation.pdf](https://github.com/memonji/gender-biases-exploration/files/15165398/An.exploration.of.gender.biases.through.a.distributional.semantics.lens.pdf)

**Author:** Emma Angela Montecchiari

**Course:** Università di Trento - Human Language Technologies 2022/23

**Date:** February 9, 2024

## Project Proposal 
###  Abstract

This study addresses the need to mitigate biases in language models, focusing on the often-overlooked experiences of non-binary individuals. While existing research has primarily tackled biases related to binary gender stereotypes, this study explores the broader spectrum of gender identities. Through an exploratory analysis of embedded contextual representations within distributional language models, the aim is to observe and identify biases in a multi-language set of semantic spaces.

## Contents

In this repository, you will find:

- **Overall_neighbors_comparison:** The script used to extract relevant target words neighbors from pre-built semantic spaces.
  This script has been used to investigate specific words representation in the spaces between diverse languages.
- **Subspaces_creation:** The script used to select specific words lists from the different spaces and extract cosine similarity comparison matrices within them.
  The matrices files are stored as CSV files in the matrices folder.
- **Main:** User interactive script to compute different metrics over the built matrices. Those are:
  - top similarity pairs,
  - most similar words to target ones,
  - heatmaps (stored in /matrices/heatmaps/ folder).
 
### Requirements
The code has been implemented over a Python 3.11.3 and a R 3.6.2 (2019-12-12) version and with a Conda (23.5.2) environment.

### Paper Review
Second part of the exam:

[Paper_review.pdf](https://github.com/memonji/gender-biases-exploration/files/15165403/Montecchiari_Paper_review.pdf)

[PaperReview_Presentation.pdf](https://github.com/memonji/gender-biases-exploration/files/15165404/Montecchiari_PaperReview_Presentation.pdf)
