dirsnp="../data/nyu_pipeline_recacl_all/snps/"
dirindel="../data/nyu_pipeline_recacl_all/indels/"
staging="../data/merged_vcf_snp/snp_indel_indiv/tmp/"
outdir="../data/merged_vcf_snp/snp_indel_indiv/"
gatk="/home/vdp5/source_code/GenomeAnalysisTK.jar"
snpeff="/home/vdp5/source_code/snpEff/snpEff.jar"
picard="/home/vdp5/source_code/picard.jar"
for alpha in ${dirindel}*; do
	if [[ $alpha == *"vcf.gz"* ]]; then
	
	zeta=$(basename $alpha)
	IFS='_' read -ra ADDR <<< $zeta
	base=${ADDR[0]}
	vcf-merge $alpha ${dirsnp}${base}_snps.vcf.gz > ${staging}${base}_merged.vcf
	java -jar ${picard} SortVcf I=${staging}${base}_merged.vcf O=$${staging}${base}_merged_s.vcf SEQUENCE_DICTIONARY=/home/vdp5/data/reference_genomes/PVP01_dot.dict -U ALLOW_SEQ_DICT_INCOMPATIBILITY
	java -jar $gatk -T SelectVariants -R /home/vdp5/data/reference_genomes/PVP01_dot.fasta -V ${staging}${base}_merged_s.vcf -o ${outdir}${base}_pass.vcf	 -U ALLOW_SEQ_DICT_INCOMPATIBILITY	
	java -jar ${snpeff} ann PVP01 -noStats ${outdir}${base}_pass.vcf > ${outdir}${base}_pass_snpeff.vcf
	java -jar ${picard} SortVcf I=${outdir}${base}_pass_snpeff.vcf O=${outdir}${base}_pass_snpeff_sorted.vcf
	rm -rf ${staging}${base}_merged.vcf ${outdir}${base}_pass.vcf ${outdir}${base}_pass_snpeff.vcf ${staging}${base}_merged_s.vcf
	fi

done
