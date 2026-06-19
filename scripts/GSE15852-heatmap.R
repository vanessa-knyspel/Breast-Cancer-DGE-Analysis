library(tidyverse)
expression_matrix <- read.delim(
  "GSE15852_series_matrix.txt.gz",
  comment.char = "!",
  check.names = FALSE
)

library(GEOquery)
# Load GEO dataset
gse <- getGEO("GSE15852", GSEMatrix = TRUE)

pheno <- pData(gse[[1]])

sample_annotation <- data.frame(
  Group = ifelse(
    grepl("Normal", pheno$title),
    "Normal",
    "Tumour"
  )
)

rownames(sample_annotation) <- rownames(pheno)

gse15852_results <- read_tsv("GSE15852.top.table.tsv")

# Identify top differentially expressed genes
top_genes <- gse15852_results %>%
  filter(!is.na(Gene.symbol)) %>%
  distinct(Gene.symbol, .keep_all = TRUE) %>%
  arrange(adj.P.Val) %>%
  slice_head(n = 25)

# Extract expression values for top DEGs
heatmap_data <- expression_matrix %>%
  filter(ID_REF %in% top_genes$ID)

rownames(heatmap_data) <- heatmap_data$ID_REF

heatmap_data <- heatmap_data[, -1]
heatmap_matrix <- as.matrix(heatmap_data)

# Z-score normalisation across genes
heatmap_matrix <- t(
  scale(
    t(heatmap_matrix)
  )
)

library(pheatmap)

sample_annotation <- sample_annotation[
  colnames(heatmap_matrix),
  ,
  drop = FALSE
]

gene_names <- make.unique(top_genes$Gene.symbol)

rownames(heatmap_matrix) <- gene_names

# Generate clustered heatmap
pheatmap(
  heatmap_matrix,
  annotation_col = sample_annotation,
  cluster_rows = TRUE,
  cluster_cols = TRUE,
  show_rownames = TRUE,
  show_colnames = FALSE,
  fontsize_row = 10,
  filename = "heatmap.png",
  width = 12,
  height = 14
)
