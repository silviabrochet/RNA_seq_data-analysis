#!/bin/bash

paste MIX_PE1_1.count MIX_PE1_2.count | awk -v OFS='\t' '{print $1, ($2 + $4)}' > MIX_PE1.count
paste MIX_PE2_1.count MIX_PE2_2.count | awk -v OFS='\t' '{print $1, ($2 + $4)}' > MIX_PE2.count
paste MIX_PE3_1.count MIX_PE3_2.count | awk -v OFS='\t' '{print $1, ($2 + $4)}' > MIX_PE3.count

paste MIX_G1.count MIX_G1_2.count | awk -v OFS='\t' '{print $1, ($2 + $4)}' > MIX_G1.count
paste MIX_G2.count MIX_G2_2.count | awk -v OFS='\t' '{print $1, ($2 + $4)}' > MIX_G2.count
paste MIX_G3.count MIX_G3_2.count | awk -v OFS='\t' '{print $1, ($2 + $4)}' > MIX_G3.count


