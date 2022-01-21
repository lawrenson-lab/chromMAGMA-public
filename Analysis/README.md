# chromMAGMA Part 2 - Analysis

## Introduction
This is the Analysis portion of chromMAGMA, where the outputs from /Processing are further cleaned and analyzed to conduct gene-set enrichment analysis, generate tables, figures, and final descriptive statistics for the manuscript.

## Setup 
Map to the Analysis directory. 
```
cd /path-to-your-folder/chromMAGMA/Analysis
```
Corresponding Rmarkdowns and the Utility Source Code (Utils.R) are available in this directory.:

```
/Analysis/Rscripts
```
Intermediate files should be saved to:

```
/Analysis/Data
```
This part is also available as a step-by-step github pages at https://lawrenson-lab.github.io/chromMAGMA_private/.

## Libraries
The following are the libraries used in /Analysis.
```
R version 4.0.2 (2020-06-22)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows >= 8 x64 (build 9200)

Matrix products: default

locale:
[1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252    LC_MONETARY=English_United States.1252
[4] LC_NUMERIC=C                           LC_TIME=English_United States.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] UpSetR_1.4.0       ggpubr_0.4.0       biomaRt_2.44.4     RColorBrewer_1.1-2 ggridges_0.5.3     reshape2_1.4.4     valr_0.6.3        
 [8] forcats_0.5.0      stringr_1.4.0      dplyr_1.0.2        purrr_0.3.4        readr_1.4.0        tidyr_1.1.2        tibble_3.0.4      
[15] ggplot2_3.3.2      tidyverse_1.3.0   

loaded via a namespace (and not attached):
 [1] bitops_1.0-6                matrixStats_0.57.0          fs_1.5.0                    lubridate_1.7.9.2          
 [5] bit64_4.0.5                 progress_1.2.2              httr_1.4.2                  GenomeInfoDb_1.24.2        
 [9] tools_4.0.2                 backports_1.2.0             R6_2.5.0                    DBI_1.1.0                  
[13] BiocGenerics_0.34.0         colorspace_2.0-0            withr_2.3.0                 gridExtra_2.3              
[17] tidyselect_1.1.0            prettyunits_1.1.1           bit_4.0.4                   curl_4.3                   
[21] compiler_4.0.2              cli_2.2.0                   rvest_0.3.6                 Biobase_2.48.0             
[25] xml2_1.3.2                  DelayedArray_0.14.1         labeling_0.4.2              rtracklayer_1.48.0         
[29] scales_1.1.1                askpass_1.1                 rappdirs_0.3.1              digest_0.6.27              
[33] Rsamtools_2.4.0             foreign_0.8-80              rio_0.5.16                  XVector_0.28.0             
[37] pkgconfig_2.0.3             dbplyr_2.0.0                rlang_0.4.11                readxl_1.3.1               
[41] rstudioapi_0.13             RSQLite_2.2.1               farver_2.0.3                generics_0.1.0             
[45] jsonlite_1.7.2              BiocParallel_1.22.0         zip_2.1.1                   car_3.0-10                 
[49] RCurl_1.98-1.2              magrittr_2.0.1              GenomeInfoDbData_1.2.3      Matrix_1.2-18              
[53] Rcpp_1.0.7                  munsell_0.5.0               S4Vectors_0.26.1            fansi_0.4.1                
[57] abind_1.4-5                 lifecycle_0.2.0             stringi_1.5.3               yaml_2.2.1                 
[61] carData_3.0-4               SummarizedExperiment_1.18.2 zlibbioc_1.34.0             plyr_1.8.6                 
[65] BiocFileCache_1.12.1        grid_4.0.2                  blob_1.2.1                  parallel_4.0.2             
[69] crayon_1.3.4                lattice_0.20-41             Biostrings_2.56.0           haven_2.3.1                
[73] GenomicFeatures_1.40.1      hms_0.5.3                   pillar_1.4.7                GenomicRanges_1.40.0       
[77] ggsignif_0.6.0              stats4_4.0.2                reprex_0.3.0                XML_3.99-0.5               
[81] glue_1.4.2                  data.table_1.13.6           modelr_0.1.8                vctrs_0.3.6                
[85] cellranger_1.1.0            gtable_0.3.0                openssl_1.4.3               assertthat_0.2.1           
[89] openxlsx_4.2.3              broom_0.7.5                 rstatix_0.7.0               GenomicAlignments_1.24.0   
[93] AnnotationDbi_1.50.3        memoise_1.1.0               IRanges_2.22.2              ellipsis_0.3.1             
```

## Description of each analysis steps, inputs and outputs.
* **Step 1: Curating chromMAGMA and MAGMA outputs to the gene identifiers EnsemblgeneIDs available from biomaRt**
  * Input - final_gene_results_v1.08.rds
  * Output - final_gene_results_v1.08_wEnsemblGeneId.4.2.21.rds
* **Step 2: Assigns the enhancers to each gene**
  * Input - final_gene_results_v1.08_wEnsemblGeneId.4.2.21.rds
  * Output - Gene_Level.4.9.21.rds
* **Step 3: This checks which LD bins certain enhancers and genes are in**
  * Input - Gene_Level.4.9.21.rds
  * Output - Gene_Level_Bin.4.9.21.rds
* **Step 4: This gets the gene-level results and creates descriptive statistics, t-test of ZSTATs etc.**
  * Input - Gene_Level.4.9.21.rds
  * Output - None
  * Tables & Graphs - Table 3, Figures 1C, 2A, and 2C
* **Step 5: This takes the gene-level data and weights the -log10P by the average expression of the gene, in order to prevent ties forming.**
  * Input - Gene_Level.4.9.21.txt
  * Output - Gene_Level_Weighted_4.9.21.txt
* **Step 6: Conducts Gene set enrichment analysis of gene lists from Gene_Level_Weighted_4.9.21.txt and GO data base using clusterprofiler**
  * Input - Gene_Level_Weighted_4.9.21.txt
  * Output - chromMAGMA.CCOC.gse, chromMAGMA.EnOC.gse, chromMAGMA.HGSOC.gse, chromMAGMA.LGSOC.gse, chromMAGMA.MOC.gse, chromMAGMA.NMOC.gse
  * Tables and Graphs - Figure 2D
* **Step 7: Runs the super-enhancer associated TF and MsigDB GSEA analysis** 
  * Input - C3.tft.gtrd.v7.4.symbols.gmt, C3.tft.tft_legacy.v7.4.symbols.gmt,157_pax8_pathway_BJC_2017.gmt,robbin_superenancer.gmt
  *Note, these .gmt files are generated in /Processing/gsea_execution_script.sh* 
  * Output - .xls files that lists the genes on the leading-edge of the GSEA analysis
* **Step 8 - Making graphs related to super-enhancer associated TF analysis & making list of SE TFs on the leading edge of the gene-list**
  * Input - SuperEnhancer_TFs.txt, leading-edge .xls files
  * Output - se_tf_le_list.rds
  * Figures & Table - Figure 3A and 3B
* **Step 9 - Cleaning tft_legacy gene set names. This is necessary in order to make the gene identifiers the same across the analysis**
  * Input - merged-list-TFs.Rdata, msigdb_tfs_legacy.weighted_pval.190421.txt
  * Output - legacy_tf_results.6.15.21.txt
* **Step 10 - Identification of Nexus Transcription Factors**
  * Input - legacy_tf_results.6.15.21.txt
  * Output - nexus_tfs.6.15.21.txt



