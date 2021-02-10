#!/bin/bash

for f in *.fastq; do java -jar trimmomatic-0.38.jar SE -threads 15 -phred33 ${f/.fastq} ${f/.fastq/trim.fastq} LEADING:30 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:20; done