# chromMAGMA Part 1 - Processing 

## Introduction
Map to the Processing Directory. Everything pertaining to processing is in this directory.

```
cd /path-to-your-folder/chromMAGMA/Processing
```
MAGMA v1.08 was used and downloaded from the MAGMA website:

https://ctg.cncr.nl/software/magma

Broad GSEA Preranked for the command line was used and downloaded from the Broad GSEA website.

http://www.gsea-msigdb.org/gsea/downloads.jsp

Please ensure these are downloaded to the apps folder of chromMAGMA.

## Description of each file

* **magma_preparation_and_execution.Rmd**
    * This Rmd file lays out the key steps to run chromMAGMA (and conventional MAGMA using gene-body windows with NCBI RefSeq) and genreates the key file final_gene_results_v1.08.rds. After the generation of this rds file, users may go on to Step 2. 
* **magma_execution_script.sh**
    * Shell Script to run MAGMA

* **gsea_geneset_preparation.Rmd** 
    * This Rmd file generates.gmt files used for BROAD gene-set enrichment analysis used in step 7 within /Analysis
* ** gsea_execution_script.sh **
    * shell script to execute BROAD GSEA analysis.


