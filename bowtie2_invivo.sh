#!/bin/bash

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_01_L7_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_01_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_02_L7_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_02_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_03_L7_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_03_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_04_L7_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_04_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_05_L7_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_05_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_06_L7_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_06_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_07_L7_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_07_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_08_L7_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_08_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_09_L7_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_09_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_10_L7_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_10_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_01_r2_L3_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_01_r2_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_03_r2_L3_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_03_r2_mapp.sam

bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q SB_04_r2_L3_R1_001_non-rRNA.fastq -x MIX_GENOME > mappings/SB_04_r2_mapp.sam

