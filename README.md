# RNA_seq_data-analysis

Code to analyse bacterial transcriptome data

This code is used to analyse data (fastq files) from 1) an in vivo RNA sequencing experiment and 2) an in vitro RNA sequencing experiment with slight changes between the two procedures.

Reads are trimmed with trimmomatic:

        bash trimmomatic_invivo.sh
        bash trimmomatic_invitro.sh

For the in vivo experiment only, reads are splitted into rRNA reads and non-rRNA reads using sortmerna.

        bash sortmerna_invivo.sh
        
Only non-rRNA reads were used for the following steps of the analysis. The results are found in the .log files. The reads passing the threshold are the ones which correspond to the rRNA, the others are non-RNA.

Reads are then mapped (for both 1 and 2) to a reference genome using bowtie2.

First the reference genome is indexed:

        bowtie2-build mega_genome.fa MIX_GENOME

Then the mapping done on the indexed genome reference:

        bash bowtie2_invivo.sh
        bash bowtie2_invitro.sh
        
The resulting .sam files are sorted and converted to .bam:

        bash bam_convert_invivo.sh
        bash bam_convert_invitro.sh

Reads are filtered for quality of mapping using stringent CIGAR (= alignment length) and NM (= allowed mismatches number) parameters:
(The script filtering_cigar_NM1.pl is also needed)

        bash filtering_cigar_NM_invivo.sh
        bash filtering_cigar_NM_invitro.sh
        
Count files are generated using HtSeq:

        bash htseq_invivo.sh
        bash htseq_invitro.sh
        
For samples that were resequenced (for 1) sample 1, 3 and 4 and for 2) samples 5, 10, 15, 20, 25, 30) at this point the counts files are merged for the two sequencing runs:

        bash merge_counts_invivo.sh
        bash merge_counts_invitro.sh
        
Finally, differential gene expression analysis is performed using EdgeR: 

EdgeRanalysis_invivo.R EdgeRanalysis_invivo.R

Annotations as done using 

Gene_cart_COG.csv
