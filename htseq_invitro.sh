#!/bin/bash

for f in *_sorted_NM_CG_filt.bam; do htseq-count -t CDS -i gene_id -s reverse -f bam ${f/_sorted_NM_CG_filt.bam} MIX_GENOME.gtf > ${f/_sorted_NM_CG_filt.bam/.count}; done


