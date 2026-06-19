```markdown
# Differential Gene Expression Analysis of Breast Cancer Transcriptomic Data

## Project Overview

This project investigated differential gene expression patterns between breast cancer and normal breast tissue using publicly available transcriptomic datasets from the Gene Expression Omnibus (GEO).

The aim was to identify genes and biological pathways associated with breast cancer progression and demonstrate a standard bioinformatics workflow for transcriptomic data analysis.

## Methods

### Data Acquisition

Gene expression data were obtained from the NCBI Gene Expression Omnibus (GEO) database.

### Differential Gene Expression Analysis

Differential expression analysis was performed using GEO2R to compare breast cancer samples with normal breast tissue controls.

Genes were assessed using:

- Log2 Fold Change (logFC)
- Adjusted p-values (Benjamini-Hochberg correction)

Significantly differentially expressed genes (DEGs) were identified using predefined statistical thresholds.

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

PPCA demonstrated distinct transcriptomic differences between tumour and normal samples. The first principal component (PC1) explained 33.8% of total variance, while PC2 explained 7.5% and PC3 explained 3.9%. The separation of samples along PC1 indicated that gene expression profiles differed substantially between tumour and normal tissues, suggesting that disease status was a major contributor to transcriptomic variation.

Gene Ontology (GO) analysis identified several significantly overrepresented biological processes among differentially expressed genes. The most enriched terms included:

- Lipid localisation
- Response to peptide hormone
- Response to xenobiotic stimulus
- Response to oxygen levels
- Response to decreased oxygen levels
- Response to hypoxia
- Cell-substrate adhesion
- Alcohol metabolic process

The enrichment of hypoxia-related pathways suggests adaptation to oxygen-limited tumour microenvironments, while enrichment of cell-substrate adhesion pathways may reflect changes associated with tumour invasion and metastasis.

KEGG Pathway Enrichment Analysis

KEGG analysis identified multiple significantly enriched pathways, including:

- PPAR signalling pathway
- ECM-receptor interaction
- Focal adhesion
- Proteoglycans in cancer
- PI3K-Akt signalling pathway
- Integrin signalling
- cAMP signalling pathway
- Cytoskeleton in muscle cells

Several enriched pathways are directly involved in cancer progression, cell migration, extracellular matrix interactions, and signal transduction. The enrichment of focal adhesion and ECM-receptor interaction pathways suggests substantial alterations in cell adhesion and communication with the extracellular environment during tumour development.

Pathway Network Analysis

Network visualisation revealed extensive overlap between enriched pathways. ECM-receptor interaction, focal adhesion, proteoglycans in cancer, and cytoskeletal pathways shared multiple genes, suggesting coordinated regulation of cellular adhesion, motility, and tumour-associated signalling networks. The prominence of PPAR signalling pathways additionally suggests altered metabolic regulation within breast cancer samples.

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
