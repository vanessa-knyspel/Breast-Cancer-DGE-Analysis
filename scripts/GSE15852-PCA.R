# --------------------------------------------------
# Breast Cancer Differential Gene Expression Analysis
# Dataset: GSE15852
#
# Script: Principal Component Analysis
#
# Purpose:
# Perform PCA on gene expression data and
# visualise transcriptomic differences between
# tumour and normal samples.
#
# Author: Vanessa Knyspel
# --------------------------------------------------

library(tidyverse)
library(GEOquery)

# Load GEO dataset
gse <- getGEO("GSE15852", GSEMatrix = TRUE)

# Extract sample metadata
pheno <- pData(gse[[1]])

# Load expression matrix
expression_matrix <- read.delim(
  "GSE15852_series_matrix.txt.gz",
  comment.char = "!",
  check.names = FALSE
)

table(grepl("Cancer", pheno$title))

# Define tumour and normal sample groups
sample_group <- ifelse(
  grepl("Cancer", pheno$title),
  "Tumour",
  "Normal"
)

# Prepare expression matrix for PCA
pca_matrix <- expression_matrix

rownames(pca_matrix) <- pca_matrix$ID_REF
pca_matrix$ID_REF <- NULL

pca_matrix <- as.matrix(pca_matrix)

pca_matrix <- t(pca_matrix)

# Perform Principal Component Analysis
pca_results <- prcomp(
  pca_matrix,
  scale. = TRUE
)

# Calculate variance explained by principal components
percent_var <- round(
  100 * (pca_results$sdev^2 / sum(pca_results$sdev^2)),
  1
)

# Create PCA results dataframe
pca_df <- data.frame(
  PC1 = pca_results$x[,1],
  PC2 = pca_results$x[,2],
  Group = sample_group
)

# Generate PCA visualisation

ggplot(
  pca_df,
  aes(
    x = PC1,
    y = PC2,
    colour = Group
  )
) +
  geom_point(size = 3, alpha = 0.8) +
  theme_minimal(base_size = 12) +
  labs(
    title = "Principal Component Analysis of Breast Cancer Samples",
    subtitle = "GSE15852",
    x = paste0("PC1 (", percent_var[1], "% variance)"),
    y = paste0("PC2 (", percent_var[2], "% variance)")
  )

ggsave(
  "figures/pca_plot.png",
  width = 8,
  height = 6,
  dpi = 300
)

# Generate PC1 vs PC3 visualisation
pca_df$PC3 <- pca_results$x[,3]

ggplot(
  pca_df,
  aes(
    x = PC1,
    y = PC3,
    colour = Group
  )
) +
  geom_point(size = 4) +
  theme_minimal() +
  labs(
    title = "PCA of Breast Cancer Samples",
    subtitle = "PC1 vs PC3",
    x = paste0("PC1 (", percent_var[1], "%)"),
    y = paste0("PC3 (", percent_var[3], "%)")
  )

ggsave(
  "figures/pca3_plot.png",
  width = 8,
  height = 6,
  dpi = 300
)
