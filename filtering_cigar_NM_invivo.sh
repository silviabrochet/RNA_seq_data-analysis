#!/bin/bash
declare -a names=(SB_01 SB_02 SB_03 SB_04 SB_05 SB_06 SB_07 SB_08 SB_09 SB_10 SB_01_r2 SB_03_r2 SB_04_r2)

for i in ${names[@]};do
    BAMFILE=$i"mapp.bam"
    samtools view -F4 -h $BAMFILE | grep -E "NM:i:[0-1]|^\@" > $i"_edit_dist.sam"
    perl filtering_cigar_NM1.pl $i"_edit_dist.sam" > $i"_NM_CG_filt.sam"
    samtools view -bh $i"_NM_CG_filt.sam" > $i"_NM_CG_filt.bam"
    samtools sort -@8 $i"_NM_CG_filt.bam" > $i"_sorted_NM_CG_filt.bam"
done