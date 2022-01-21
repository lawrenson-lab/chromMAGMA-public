# chromMAGMA: epigenome-centric interrogation of risk variant interactions with chromatin landscapes

Robbin Nameki, Anamay Shetty, Eileen Dareng, Jonathan Tyrer, the Ovarian Cancer Research Consortium, Paul Pharoah, Rosario I. Corona, Siddhartha Kar, Kate Lawrenson

*R.N. & A.S. Equally contributed to the study*

*K.L. & S.K. Joint directed the study*

## Introduction
This is a step-by-step tutorial on how to conduct chromMAGMA, a bioinformatic pipeline that builds on MAGMA (Leeuw et al., 2015) by assigning genome-wide association (GWAS) statistics to epigenomic profiles, followed by assignment to genes. As proof-of-concept in this tutorial we will apply chromMAGMA to Epithelial Ovarian Cancer (EOC) datasets. 

There are two key parts to this tutorial. 

The first part includes running MAGMA with modified .annot files that assign SNPs to regulatory elements. In this case, we will use .annot files of EOC GWAS statistics from CITE MAIN PAPER assigned to genomic regions consisting of a union set of primary EOC  H3K27ac ChIP-seq data from Corona et al. 2020. The regulatory elements are then assigned back to genes using the Genehancer (Fishilevich et al., 2017) database in a Rscript. 

The second part includes the process of cleaning outputs and assigning the most significant regulatory element to a gene. This part of the tutorial will then delve into various annotations, descriptive statistics, and analysis to explore the gene-level outputs from chromMAGMA. This part is conveniently available as GitHub Pages https://lawrenson-lab.github.io/chromMAGMA_private/

## Setup
Create a chromMAGMA folder within directories 
```
cd /path-to-your-folder
mkdir chromMAGMA
```
Next, download MAGMA and the associated files from the MAGMA website:

https://ctg.cncr.nl/software/magma

GWAS statistics are to be released with our forthocoming paper:

[OCAC Paper Reference]

## Part 1 - Processing
Map to the Processing Directory. Everything pertaining to processing is in this directory.
```
cd /path-to-your-folder/chromMAGMA/Processing
```

The key processing steps are found in `magma_preparation_and_execution.Rmd` which lays out the key steps to run chromMAGMA. This will create a `.RDS` file which can then be used in the `Analysis` portion onwards. 

MAGMA v1.08 was used and downloaded from the MAGMA website:

https://ctg.cncr.nl/software/magma

Broad GSEA Preranked for the command line was used and downloaded from the Broad GSEA website. We used v3.0.

http://www.gsea-msigdb.org/gsea/downloads.jsp

Please ensure these are downloaded to the `apps` folder of chromMAGMA.

## Part 2 - Analysis 
Map to the Analysis directory. Corresponding Rmarkdowns and the Utility Source Code (Utils.R) are available in this directory.
```
cd /path-to-your-folder/chromMAGMA/Analysis
```
This part is also available as a step-by-step github pages at https://lawrenson-lab.github.io/chromMAGMA_public
.



