# --------------------------------------------------
# Differential Gene Expression Enrichment Analysis
# Dataset: GSE15852
# Author: Vanessa Knyspel
#
# Performs:
# 1. GO Biological Process enrichment
# 2. KEGG pathway enrichment
# 3. GO and KEGG visualisation
# --------------------------------------------------

library(tidyverse)
library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)

# Load differential expression results
gse15852_results <- read_tsv(
  "GSE15852.top.table.tsv"
)

# Filter significantly differentially expressed genes
sig_genes <- gse15852_results %>%
  filter(adj.P.Val < 0.05, abs(logFC) > 1)

# Extract and clean gene symbols
gene_symbols <- sig_genes$Gene.symbol

gene_symbols <- gene_symbols[!is.na(gene_symbols)]

gene_symbols <- unique(gene_symbols)

# Convert gene symbols to Entrez IDs
gene_ids <- bitr(
  gene_symbols,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

# Gene Ontology enrichment analysis
go_results <- enrichGO(
  gene          = gene_ids$ENTREZID,
  OrgDb         = org.Hs.eg.db,
  keyType       = "ENTREZID",
  ont           = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff  = 0.05
)

write_tsv(
  as_tibble(go_results),
  "GO_results.tsv"
)

# Generate GO enrichment dotplot
png(
  "figures/go_dotplot.png",
  width = 2400,
  height = 1800,
  res = 300
)

dotplot(
  go_results,
  showCategory = 15
)

dev.off()

# KEGG pathway enrichment analysis
kegg_results <- enrichKEGG(
  gene = gene_ids$ENTREZID,
  organism = "hsa",
  pvalueCutoff = 0.05
)

write_tsv(
  as_tibble(kegg_results),
  "KEGG_results.tsv"
)

# Generate KEGG pathway dotplot
pdf(
  "KEGG_dotplot.pdf",
  width = 10,
  height = 8
)

dotplot(
  kegg_results,
  showCategory = 15
)

dev.off()

# Generate KEGG pathway-gene interaction network
pdf(
  "KEGG_cnetplot.pdf",
  width = 10,
  height = 8
)

cnetplot(
  kegg_results,
  showCategory = 5
)

dev.off()
