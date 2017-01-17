geneofinterest=$1

java -jar /home/vdp5/source_code/snpEff/SnpSift.jar filter "(ANN[*].GENE = '${1}')" ../data/merged_vcf_snp/ef_pass_merge_sorted.vcf.ann > ../data/merged_vcf_snp/extracted_vcf/${1}_extracted.vcf.ann
plink --vcf ../data/merged_vcf_snp/extracted_vcf/${1}_extracted.vcf.ann --out ../data/plink_output/${1}_plink --double-id --allow-extra-chr

python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 2 --cv 2
python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 3 --cv 2
python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 4 --cv 2
python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 5 --cv 2
python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 6 --cv 2
python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 7 --cv	2
python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 8 --cv 2
python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 9 --cv 2
python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 10 --cv	2
python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 11 --cv	2
python /home/vdp5/source_code/fastStructure/structure.py --output=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1} --input=/home/vdp5/projects/vivax_cambodia/data/plink_output/${1}_plink -K 12 --cv	2

cd /home/vdp5/source_code/fastStructure
python chooseK.py --input=/home/vdp5/projects/vivax_cambodia/data/structure_out/${1}
