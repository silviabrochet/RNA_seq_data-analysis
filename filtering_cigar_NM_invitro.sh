#!/bin/bash
declare -a names=(bc1 bc2 bc3 ...)

for i in ${names[@]};do
    BAMFILE=$i"mapp.bam"
    samtools view -F4 -h $BAMFILE | grep -E "NM:i:[0-1]|^\@" > $i"_edit_dist.sam"
    perl filtering_cigar_NM1.pl $i"_edit_dist.sam" > $i"_NM_CG_filt.sam"
    samtools view -bh $i"_NM_CG_filt.sam" > $i"_NM_CG_filt.bam"
    samtools sort -@8 $i"_NM_CG_filt.bam" > $i"_sorted_NM_CG_filt.bam"
done