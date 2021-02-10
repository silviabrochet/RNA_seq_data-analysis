#!/bin/bash

echo "SB_01"

java -jar trimmomatic-0.38.jar SE -phred33 SB_01_L7_R1_001.fastq SB_01_L7_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_02"

java -jar trimmomatic-0.38.jar SE -phred33 SB_02_L7_R1_001.fastq SB_02_L7_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_03"

java -jar trimmomatic-0.38.jar SE -phred33 SB_03_L7_R1_001.fastq SB_03_L7_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_04"

java -jar trimmomatic-0.38.jar SE -phred33 SB_04_L7_R1_001.fastq SB_04_L7_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_05"

java -jar trimmomatic-0.38.jar SE -phred33 SB_05_L7_R1_001.fastq SB_05_L7_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_06"

java -jar trimmomatic-0.38.jar SE -phred33 SB_06_L7_R1_001.fastq SB_06_L7_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_07"

java -jar trimmomatic-0.38.jar SE -phred33 SB_07_L7_R1_001.fastq SB_07_L7_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_08"

java -jar trimmomatic-0.38.jar SE -phred33 SB_08_L7_R1_001.fastq SB_08_L7_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_09"

java -jar trimmomatic-0.38.jar SE -phred33 SB_09_L7_R1_001.fastq SB_09_L7_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_10"

java -jar trimmomatic-0.38.jar SE -phred33 SB_10_L7_R1_001.fastq SB_10_L7_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_01_r2"

java -jar trimmomatic-0.38.jar SE -phred33 SB_01_r2_L3_R1_001.fastq SB_01_r2_L3_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_03_r2"

java -jar trimmomatic-0.38.jar SE -phred33 SB_03_r2_L3_R1_001.fastq SB_03_r2_L3_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "SB_04_r2"

java -jar trimmomatic-0.38.jar SE -phred33 SB_04_r2_L3_R1_001.fastq  SB_04_r2_L3_R1_001_trimmed.fastq LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36