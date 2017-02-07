inputdir="../../data/variant_files/"
for alpha in inputdir*; do
	bgzip
	tabix -hp vcf ${alpha}.gz
done

joinx vcf-merge $(ls -1 ../../data/*.vcf.gz | perl -pe 's/\n/ /g')  > cambodia_vivax_merged.vcf