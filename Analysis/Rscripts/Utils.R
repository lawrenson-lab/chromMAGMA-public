library(biomaRt)
library(valr)



#getting ensembl gene id data
useEnsembl_GRCh37 <- function(){
  .ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl", GRCh = 37)
  return (.ensembl)
}

#getting final_gene_results_v1.08.rds
read_final_gene_results <- function(){
  x <- readRDS(file = 'Data/final_gene_results_v1.08.rds')
  return(x)
}

#getting final_gene_results_v1.08_wEnsemblGeneId.4.2.21.rds
read_final_gene_results_wEnsembl <- function(){
  x <- readRDS(file = 'Data/final_gene_results_v1.08_wEnsemblGeneId.4.2.21.rds')
  return(x)
}

#getting Gene_Level.4.9.21.rds
read_gene_level <- function(){
  x <- readRDS(file = 'Data/Gene_Level.4.9.21.rds')
  return(x)
}

#getting ld_bins
read_ld_bins <- function(){
  x <- read_bed('Data/ld_bins.txt', skip = 1)
  return(x)
}

#getting ene-level data with LD bins and chromosomal locations
read_wBin <- function(){
  x <- readRDS(file = 'Data/Gene_Level_Bin.4.9.21.rds')
  return(x)
}

#getting TWAS/cisQTL/GWAS positive control genes
read_PosGenes <- function() { 
  x <- read.table('Data/Positive_Control_Genes.5.25.21.txt', sep = '\t', header = TRUE) 
  return(x)
}

#getting mullerian primary RNA-seq values
read_corona2020_FTSEC <- function(){
  x <- readRDS(file = 'Data/Corona_2020_expression_vstnorm.4.4.21.rds')
  return(x)
}

#getting Gene_Level_Weighted.4.9.21.rds
read_gene_level_weighted <- function(){
  x <- readRDS(file = 'Data/Gene_Level_Weighted_4.9.21.rds')
  return(x)
}

#getting HLA genes
read_HLA_genes <- function(){
  x <- read.table(file = 'Data/hla.alleles.org.genes.index.html.txt', sep = '\t', header = TRUE)
  return(x)
}

#getting MsigDB_TF 
getting_MsigDB_TF <- function(){
  x <- read.table(file = 'Data/msigdb_tfs_legacy.weighted_pval.190421.txt', sep = '\t', header = TRUE)
  return(x)
}

#getting MsigDB BROAD GSEA Results
getting_legacy_tf_MsigDBGSEA <- function(){
  x <-  read.table(file = 'Data/legacy_tf_results.6.15.21.txt', sep = '\t', header = TRUE)
  return(x)
}

#LE list
getting_LE_list <- function(){
  x <-  read.table(file = 'Data/se_tf_le_list.txt', sep = '\t', header = TRUE)
  return(x)
}

#fx to get promoter
get.promoter.gr <-function(txdb,up=1000,down=100){
  p <- promoters(txdb, upstream=up, downstream=down, columns=c("tx_id", "tx_name"))
  p <- trim(p)
  return(p)}


