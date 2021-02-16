#Folder contains analysis to assign gene families to RNAseq genes

1. Determine Gene families
We used the Orthomcl output from Ellegaard et al 2019 Mol Ecol to determine the homologs across ESl0183,184,185, and 186

>perl Extract_group_homologs.pl mclOutput_GF_singletons.txt Firm5_list.txt 

Output: mclOutput_GF_singletons_RNAseq_genomes.txt

2. Output was opened in Textwrangler to remove all lines containing no gene families anymore 

In Textwrangler: Find and Replace: ".*Warning: Gene family does not contain any homolog in the selected genomes\r"


3. Assign categories to gene families (core, accessory, strain-specific)

perl Assign_homolog_category.pl mclOutput_GF_singletons_RNAseq_genomes.txt 


4.Change IMG_Ids_to Locus_tags

perl GeneIDs2LocusTags.pl mclOutput_GF_singletons_RNAseq_genomes_categories.txt GeneIds_Locus_tags_Firm5.txt

5. Assign gene families to differentially regulated genes (example file = MIX_PE_G_186_Locus_tags.txt)

perl GeneFamilies2Genes.pl mclOutput_GF_singletons_RNAseq_genomes_categories_locus_tags.txt MIX_PE_G_186_Locus_tags.txt 

6. Generate Table of all differentially regulated Gene families

perl GeneFamily_counts.pl strain_list_diff_reg_genes.txt

strain_list_diff_reg_genes.txt contains a list of the four strains of interest (183, 184, 185, 186)
The file names in the perl script need to be modified to run it on a different comparison (e.g. co-culture Glc vs PE)

The scripts parses all Gene families that are differentially regulated in more than one strain (second last column) and that are differentially regulated in the same direction in more than one strain (last column) 

The final results of this analysis have been copied into the Sheet 'Gene_Families' each DEG supplementary dataset. 

