../apps/MAGMA_v1.08/magma \
	--bfile ../Data/g1000_eur synonyms=../Data/g1000_eur.synonyms \
	--gene-annot ../Data/${3} \
	--pval ../Data/meta_${1}_allchrs.withrsid.txt N=${2} use=RSID,pvalue \
	--out ../Data/${4}/${1}
