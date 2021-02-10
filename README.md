# RNA_seq_data-analysis

Code to analyse bacterial transcriptome data

This code is used to analyse data from an 1) an in vivo RNA sequencing experiment and 2) an in vitro RNA sequencing experiment with slight changes between the two procedures.

Reads are trimmed with trimmomatic settings (for single-end reads):

        LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
  
For the in vivo experiment only, reads are splitted into rRNA reads and non-rRNA reads using sortmerna.

        bash sortmerna_invivo.sh
        

     
