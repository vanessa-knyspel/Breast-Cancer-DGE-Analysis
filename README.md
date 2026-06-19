```markdown
# Differential Gene Expression Analysis of Breast Cancer Transcriptomic Data

## Project Overview

This project investigated differential gene expression patterns between breast cancer and normal breast tissue using publicly available transcriptomic datasets from the Gene Expression Omnibus (GEO).

The aim was to identify genes and biological pathways associated with breast cancer.

## Methods

### Data Acquisition

Gene expression data were obtained from the NCBI Gene Expression Omnibus (GEO) database (GSE15852).

### Differential Gene Expression Analysis

Differential expression analysis was performed using GEO2R to compare breast cancer samples with normal breast tissue controls.

Genes were assessed using:

- Log2 Fold Change (logFC)
- Adjusted p-values (Benjamini-Hochberg correction)

Significantly differentially expressed genes (DEGs) were identified using an adjusted p-value threshold of < 0.05 and an absolute log2 fold change > 1.

### Data Visualisation

R and Bioconductor packages were used to visualise gene expression patterns.

Visualisations included:

- Volcano plots
- Heatmaps
- Principal Component Analysis (PCA)

### Functional Interpretation

Differentially expressed genes were further investigated using pathway enrichment analysis to identify biological processes and signalling pathways associated with breast cancer.

## Results

Differential gene expression analysis identified multiple significantly upregulated and downregulated genes between breast cancer and normal tissue samples.

Volcano plot visualisation highlighted genes exhibiting both large fold changes and strong statistical significance. Notable differentially expressed genes included RBP4, PDE3B, PPP1R1A, GYG2, EPCAM, TACSTD2, CD24, KRT19, KRT18, GATA3, and MUC1.

Heatmap analysis demonstrated distinct expression patterns capable of separating tumour and normal samples. Several genes, including PDE3B, RBP4, FHL1, KRT19, PPP1R1A, CD24, and SDC1, exhibited strong differential expression across sample groups. The clustering pattern demonstrated that tumour and normal samples could be distinguished based on their expression profiles, indicating robust transcriptional differences associated with breast cancer.

PCA demonstrated distinct transcriptomic differences between tumour and normal samples. The first principal component (PC1) explained 33.8% of total variance, while PC2 explained 7.5% and PC3 explained 3.9%. The separation of samples along PC1 indicated that gene expression profiles differed substantially between tumour and normal tissues, suggesting that disease status was a major contributor to transcriptomic variation.

### Gene Ontology (GO) Enrichment Analysis

Gene Ontology (GO) enrichment analysis identified several significantly overrepresented biological processes among differentially expressed genes. The most enriched biological processes included:

* Response to peptide hormone
* Temperature homeostasis
* Response to metal ion
* Gliogenesis
* Response to oxygen levels
* Alcohol metabolic process
* Cellular response to peptide hormone stimulus
* Response to insulin
* Adaptive thermogenesis

Many enriched terms were associated with cellular metabolism, hormone signalling, and responses to environmental stimuli. The enrichment of oxygen-response pathways may be consistent with altered metabolic and environmental responses in tumour tissue, while insulin and peptide hormone signalling pathways suggest changes in cellular regulatory networks associated with breast cancer progression.

### KEGG Pathway Enrichment Analysis

KEGG pathway enrichment analysis identified several significantly enriched pathways, including:

* PPAR signalling pathway
* AMPK signalling pathway
* Adipocytokine signalling pathway
* Cytoskeleton in muscle cells

These pathways are involved in metabolic regulation, energy homeostasis, and cellular structure. The enrichment of PPAR and AMPK signalling pathways suggests altered metabolic processes between tumour and normal breast tissue samples and may contribute to the transcriptomic differences observed between these groups.

### Pathway Network Analysis

Network visualisation demonstrated overlap between enriched metabolic pathways, with several genes contributing to multiple signalling networks. Genes involved in PPAR signalling, AMPK signalling, and adipocytokine signalling formed interconnected functional modules, suggesting coordinated regulation of cellular metabolism and energy balance in breast cancer. These findings indicate that metabolic dysregulation may be an important feature of the transcriptomic differences observed between tumour and normal samples.

## Limitations

- Analysis was performed using publicly available datasets.
- Results depend on dataset quality and sample composition.
- Differential expression does not establish causation.
- Biological conclusions require experimental validation.

## Software and Tools
- R
- Bioconductor
- GEO2R
- Microsoft Excel

## Reproducibility

Required R packages:

- GEOquery
- tidyverse
- EnhancedVolcano
- pheatmap
- clusterProfiler
- org.Hs.eg.db
- enrichplot
```
