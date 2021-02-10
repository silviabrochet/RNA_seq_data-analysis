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
