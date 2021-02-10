#!/bin/bash

for f in *trim.fastq; do bowtie2 -p 15 -D 50 -R 6 -N 0 -L 5 -i S,1,0.10 -q ${f/trim.fastq}  -x MIX_GENOME > ${f/trim.fastq/mapp.fastq} ; done

