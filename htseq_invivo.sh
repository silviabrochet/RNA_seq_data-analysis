#!/bin/bash

echo '1'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_01_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_01.count

echo '2'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_02_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_02.count

echo '3'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_03_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_03.count

echo '4'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_04_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_04.count

echo '5'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_05_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_05.count

echo '6'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_06_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_06.count

echo '7'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_07_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_07.count

echo '8'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_08_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_08.count

echo '9'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_09_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_09.count

echo '10'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_10_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_10.count

echo '1_r2'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_01_r2_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_01_r2.count

echo '3_r2'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_03_r2_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_03_r2.count

echo '4_r2'
htseq-count -t CDS -i gene_id -s reverse -f bam /home/silvia/invivo_RNAseq/fastq/mappings/SB_04_r2_sorted_NM_CG_filt.bam MIX_GENOME.gtf > counts/SB_04_r2.count
