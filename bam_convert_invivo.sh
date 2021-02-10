#!/bin/bash
echo "SB_01"
samtools view -bS mappings/SB_01_mapp.sam -o mappings/SB_01_mapp.bam
samtools sort -@ 8 mappings/SB_01_mapp.bam -o mappings/sorted_SB_01_mapp.bam
samtools index mappings/sorted_SB_01_mapp.bam
echo 'end_01'

echo "SB_02"
samtools view -bS mappings/SB_02_mapp.sam -o mappings/SB_02_mapp.bam
samtools sort -@ 8 mappings/SB_02_mapp.bam -o mappings/sorted_SB_02_mapp.bam
samtools index mappings/sorted_SB_02_mapp.bam
echo 'end_02'

echo "SB_03"
samtools view -bS mappings/SB_03_mapp.sam -o mappings/SB_03_mapp.bam
samtools sort -@ 8 mappings/SB_03_mapp.bam -o mappings/sorted_SB_03_mapp.bam
samtools index mappings/sorted_SB_03_mapp.bam
echo 'end_03'

echo "SB_04"
samtools view -bS mappings/SB_04_mapp.sam -o mappings/SB_04_mapp.bam
samtools sort -@ 8 mappings/SB_04_mapp.bam -o mappings/sorted_SB_04_mapp.bam
samtools index mappings/sorted_SB_04_mapp.bam
echo 'end_04'

echo "SB_05"
samtools view -bS mappings/SB_05_mapp.sam -o mappings/SB_05_mapp.bam
samtools sort -@ 8 mappings/SB_05_mapp.bam -o mappings/sorted_SB_05_mapp.bam
samtools index mappings/sorted_SB_05_mapp.bam
echo 'end_05'

echo "SB_06"
samtools view -bS mappings/SB_06_mapp.sam -o mappings/SB_06_mapp.bam
samtools sort -@ 8 mappings/SB_06_mapp.bam -o mappings/sorted_SB_06_mapp.bam
samtools index mappings/sorted_SB_06_mapp.bam
echo 'end_06'

echo "SB_07"
samtools view -bS mappings/SB_07_mapp.sam -o mappings/SB_07_mapp.bam
samtools sort -@ 8 mappings/SB_07_mapp.bam -o mappings/sorted_SB_07_mapp.bam
samtools index mappings/sorted_SB_07_mapp.bam
echo 'end_07'

echo "SB_08"
samtools view -bS mappings/SB_08_mapp.sam -o mappings/SB_08_mapp.bam
samtools sort -@ 8 mappings/SB_08_mapp.bam -o mappings/sorted_SB_08_mapp.bam
samtools index mappings/sorted_SB_08_mapp.bam
echo 'end_08'

echo "SB_09"
samtools view -bS mappings/SB_09_mapp.sam -o mappings/SB_09_mapp.bam
samtools sort -@ 8 mappings/SB_09_mapp.bam -o mappings/sorted_SB_09_mapp.bam
samtools index mappings/sorted_SB_09_mapp.bam
echo 'end_09'

echo "SB_10"
samtools view -bS mappings/SB_10_mapp.sam -o mappings/SB_10_mapp.bam
samtools sort -@ 8 mappings/SB_10_mapp.bam -o mappings/sorted_SB_10_mapp.bam
samtools index mappings/sorted_SB_10_mapp.bam
echo 'end_10'

echo "SB_01_r2"
samtools view -bS mappings/SB_01_r2_mapp.sam -o mappings/SB_01_r2_mapp.bam
samtools sort -@ 8 mappings/SB_01_r2_mapp.bam -o mappings/sorted_SB_01_r2_mapp.bam
samtools index mappings/sorted_SB_01_r2_mapp.bam
echo 'SB_01_r2'

echo "SB_03_r2"
samtools view -bS mappings/SB_03_r2_mapp.sam -o mappings/SB_03_r2_mapp.bam
samtools sort -@ 8 mappings/SB_03_r2_mapp.bam -o mappings/sorted_SB_03_r2_mapp.bam
samtools index mappings/sorted_SB_03_r2_mapp.bam	
echo 'SB_03_r2'

echo "SB_04_r2"
samtools view -bS mappings/SB_04_r2_mapp.sam -o mappings/SB_04_r2_mapp.bam
samtools sort -@ 8 mappings/SB_04_r2_mapp.bam -o mappings/sorted_SB_04_r2_mapp.bam
samtools index mappings/sorted_SB_04_r2_mapp.bam
echo 'SB_04_r2'



