java -cp ../apps/gsea-3.0.jar -Xmx4G xtools.gsea.GseaPreranked \
	-gmx Analysis/Data/genesets/${3} \
	-rnk Processing/Data/weighted_ranked_gene_lists/${1}.${2}.stat.rnk \
	-create_svgs false \
	-zip_report false \
	-rpt_label ${1}.${2}.${3} \
	-plot_top_x 50 \
	-out Processing/Data/gsea_output_files \
	-gui false
