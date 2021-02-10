#!/bin/bash

for f in *mapp.sam; do 
samtools view -bS ${f/mapp.sam} -o ${f/mapp.bam}
samtools sort -@ 8 ${f/mapp.bam} -o ${f/sorted_mapp.bam}
samtools index ${f/sorted_mapp.bam} ; 
done



