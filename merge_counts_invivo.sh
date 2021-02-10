#!/bin/bash

paste SW1_1.count SW1_2.count | awk -v OFS='\t' '{print $1, ($2 + $4)}' > SW1.count
paste SW3_1.count SW3_2.count | awk -v OFS='\t' '{print $1, ($2 + $4)}' > SW3.count
paste SW4_1.count SW4_2.count | awk -v OFS='\t' '{print $1, ($2 + $4)}' > SW4.count


