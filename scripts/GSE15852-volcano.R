# --------------------------------------------------
# Differential Gene Expression Volcano Plot
# Dataset: GSE15852
# Author: Vanessa Knyspel
#
# Visualises significantly upregulated and
# downregulated genes between breast cancer and
# normal breast tissue samples.
# --------------------------------------------------

library(tidyverse)

# Load differential expression results
gse15852_results <- read_tsv("GSE15852.top.table.tsv")

library(EnhancedVolcano)

# Select genes for volcano plot labelling

gene_labels <- ifelse(is.na(gse15852_results$Gene.symbol),
                      "",
                      gse15852_results$Gene.symbol
)


top_genes <- gse15852_results %>%
  arrange(adj.P.Val) %>%
  slice_head(n = 20)

top_gene_names <- top_genes$Gene.symbol

gene_labels[gse15852_results$Gene.symbol %in% top_gene_names] <-
  gse15852_results$Gene.symbol[gse15852_results$Gene.symbol %in% top_gene_names]

# Open graphics device
png("figures/volcano_plot.png",
    width = 2400,
    height = 1800,
    res = 300)

# Generate volcano plot
EnhancedVolcano(
  gse15852_results,
  lab = gene_labels,
  x = "logFC",
  y = "adj.P.Val",
  ylab = expression(-Log[10]~adjusted~P),
  title = "Differential Gene Expression in Breast Cancer",
  subtitle = "GSE15852",
  pCutoff = 0.05,
  FCcutoff = 1,
  drawConnectors = TRUE,
  max.overlaps = 20
)

dev.off()