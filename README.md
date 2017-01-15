###2016-12-05T23:06:26
Initating git repository for this project

###2016-12-05T23:20:16
Running script samtools_pileup.sh with commented out section that was originally run. This should put output in data/sequences_pileup_edited/, based on the recommendations here: http://samtools.sourceforge.net/mpileup.shtml, http://seqanswers.com/forums/showthread.php?t=8509. Note that these recommendations are also based on this document relevant_docs/NIHMS49873-supplement-supp_material.docx, which is based on the following paper: http://www.nature.com/nature/journal/v487/n7407/full/nature11174.html.

On second thought, it might make more sense to use a more modern pipeline, composed of several different steps that can do the quality filtering for me based on GATK. A good outline is found here https://gencore.bio.nyu.edu/variant-calling-pipeline/ Will write script.

###2016-12-06T11:46:05
Edited the samtools_pileup script for a bug. 

###2016-12-06T14:16:08
Created script NYU_pipeline.sh, which is currently testing its ability to work in a loop with only the CollectInsertSizeMetrics option. Will see how this goes and then add more functions that can run the entire pipeline.

###2016-12-06T23:34:25
Created script nyu_pipeline_prepare.py, which creates an automated pipeline nyu_pipeline_launch.sh to run 8 BAM snp calls at a time. Again, using NYU_pipeline as the general script, which essentially runs the entire pipeline on the BAM file provided as input.

Results are being aggregated in nyu_pipeline_results under the data directory.

###2016-12-09T17:14:03

Directory w/ snp_calls (nyu_pipeline) is still being processed, so need to wait some more. Now is the time to begin thinking about what initial analyses I want to do. Furthermore, what kind of quality control measures can I do?

###2016-12-11T19:26:54
Moved snp and indel calls all to nyu_pipeline_recalc, which contains the appropriate directories. I am rm'ing the nyu_pipeline_results directory for the purposes of saving space.

###2016-12-15T17:09:20
Looking at options for extra variant filtering. We used the NYU pipeline, which had certain options (QC) that may not be appropriate given that this is Vivax, not human. Double checking the NYU protocol to see if anything outlandish exists.

Checked the variant filtering options used by NYU, seems as though they're supported by NYU. Wil email collaborator from UNC to double check variants are appropriate quality.

###2016-12-26T14:27:20
The Kissinger 2016 letter makes reference to a study where vivax genes under selection were identified using an outgroup of P. cylomonigi. This stategy could als be employed using an outgroup sample of vivax from Korea, for instance.

###2016-12-26T14:30:11
How might we accomplish a copy number variation study with this project?

###2016-12-26T16:21:50
I manually went through the genes.gbk file for snpEff and edited the chromosome sections to instead have the chromsoome version number, which should help with matching. I'm still conecerned with the scaffold segments, but that'll have to wait for now. Let's see if there's a signficant difference going forward.

###2016-12-28T11:11:46
Created a new genome file for PVP01, it's on my desktop, can be used for IGV viewer. I will upload onto server soon. Now I'm going to try to use snpEff with this dataset, hopefully the chromosome errors won't be an issue

###2016-12-28T11:39:12
SnpEff was successful, have now got the annotations. Am downloading them onto my machine so I can view them

###2017-01-01T16:34:22
Simple test, looking at phylogenetic history of pvmdr1. Let's attempt structure analysis first.

###2017-01-02T23:07:06
Used the command snpsiftrun filter " (ANN[*].GENE = PVP01_1447300)" ../ef_pass_merge_sorted.vcf.ann > PVP01_1447300_extracted.vcf.an to filter out the SNPs for that gene in question. Then, I faststructured the file using the program, and used chooseK to find that 5 populations are most appropriate for dividing. The figrue for this can be found here: /home/vdp5/projects/vivax_cambodia/data/distrust/pvdmr1_5k.png. I wonder if we can recapture this relationship using another gene of interest. Is this simply a random result or is it significant?

###2017-01-03T12:14:43
PVP01_1447300 is actually multidrug resistance 2, not 1 (the primary gene for chloroquine resistance). Renamed figures and data appropriately. Running similar analysis using PVP01_0203000, which is gene 1. Will try to generate a generic script to capture all of this pipeline.

###2017-01-03T14:01:37
Script run using input as the gene name, script called annotated_faststructure_run.sh. Appropriat figure generated, looks very similar to the figure generated when looking at PVP01_1447300. I wonder if these structural relationships are maintained when we look at other genes.

###2017-01-03T14:12:59
I'm also interested in seeing how copy number variants look with this data. Pindel looks like a strong way to look intothis.

###2017-01-03T21:55:33
Pindel analysis was not that successful, instead shifted to CNVnator, installling now. There's also promise with PlasmoCNVScan (https://malariajournal.biomedcentral.com/articles/10.1186/s12936-016-1258-x), link included. Emailed author for info. I like how they take into account common issues with P. falc, wonder if it is still as useful with Vivax? 

###2017-01-08T11:10:41
Ran PCVScan  w/ OM339, output is in cnv_data/pcnv_om339.txt. Concerned about the relative decimal value system, makes it very hard to interpret.

Also running the annotated_faststructure_run.sh with another gene of interest to see if its genetic structure output is similar to those seen before, this will reveal whether or not fastStructure is even a good idea in the first place.

###2017-01-11T15:51:40
Also ran fastStructure uisng PVP01_1259000 as the gene of interest, its variants divided into five different zones but did so differently. Figures are in the distruct folder

###2017-01-14T19:00:23
Downloaded sequences for PVT01 and PVC01. One limiting factor is that there are not contigs for these. I will try searching.

Found them by looking at all nucleotides. I have put FASTA and GB files for all in reference_genomes general data folder