library(edgeR)
library(statmod)
library(stringr)
library(tidyverse)

# Load count files

files <- dir(pattern=".count$") 

# Create a list of .count files 

counts <- readDGE(files)$counts

# Calculate counts per million

cpms <- cpm(counts)

# Filter the noninformative ones if there is any

noint <- rownames(counts) %in% c("__no_feature","__ambiguous","__too_low_aQual","__not_aligned","__alignment_not_unique")

# Throw weakly expressed ones - keep the features above the 1 count per million, have to be 
# expressed in at all samples and remove noninformative features

keep <- rowSums(cpms > 1) >= 6 & !noint
counts.clean <- counts[keep,]

# Define in which condition your samples fit = SW+PG or SW

conditions <- c(rep("SW", 5), rep("SW_PG", 5))
conditions <- as.factor(conditions)
conditions <- data.frame(conditions)
conditions <- factor(paste0(conditions$conditions))

d <- DGEList(counts = counts.clean, group = conditions)

# Estimate normalizing factors

d <- calcNormFactors(d)

# Save normalised counts table

write.table(d$counts, "strain_normalised_counts.txt")

# Inspect the relationships between samples using MDS plots 

#pdf(file = "MDS_plot.pdf", width = 8, height = 8)
par(mar=c(5,5,5,10))
plotMDS(d, col=rep(1:5, each=5), pch = 21, cex = log10(d$samples$lib.size/1000))
par(xpd=TRUE)
# Modify legend coordinates for each strain
#legend(4,2, legend=c("1", "2", "3", "4"),
       #col="black", pch=21, pt.cex=c(1, 2, 3, 4), cex = 1, text.width = 0.5, 
       #y.intersp = 1.6, x.intersp= 1.6, title = "log library size")
#dev.off()


# Create an experimental design matrix

design <- model.matrix(~ 0 + conditions)
colnames(design) <- levels(conditions)

# Dispersion estimations and negative binomial fitting

d <- estimateDisp(d, design, robust = TRUE)
fit <- glmQLFit(d, design, robust = TRUE)
head(fit$coefficients)
plotQLDisp(fit)

# Define a contrast what should be tested against what: SW+PG vs SW

SW_PG_SW <- makeContrasts(SW_PG - SW, levels=design) 

# Test for differentially expressed genes in the defined contrast
# Here, a positive logfold change represents genes that are up in SWPG over SW.

qlfind_SW_PG_SW <- glmQLFTest(fit, contrast=SW_PG_SW)
topTags(qlfind_SW_PG_SW)
toptags_SW_PG_SW <- topTags(qlfind_SW_PG_SW, n = nrow(d))

deg.list_SW_PG_SW <- toptags_SW_PG_SW$table
head(deg.list_SW_PG_SW)
write.csv(deg.list_SW_PG_SW, file = "186_toptags_SW_PG_SW.csv")

# Annotate files

SW_PG_SW <-read.csv("strain_toptags_SW_PG_SW.csv")
GeneCart <- read.csv("Gene_cart_COG.csv")
Gene_cart_COG <- GeneCart[,c(2,1,3,25,28,29,43,44,45,46,47,48,49,50)]

for (i in 1:nrow(SW_PG_SW)){    # Loop through DGEtable 
  for (j in 1:nrow(Gene_cart_COG)){  # "within" Loop through Gene_cart_COG 
    if(SW_PG_SW[i,1]==as.character(Gene_cart_COG[j,1])){  # if id match
      SW_PG_SW[i,7]<-Gene_cart_COG[j,3]
      SW_PG_SW[i,8]<-Gene_cart_COG[j,5]
      SW_PG_SW[i,9]<-Gene_cart_COG[j,6]
      SW_PG_SW[i,10]<-Gene_cart_COG[j,8]
      SW_PG_SW[i,11]<-Gene_cart_COG[j,9]
      SW_PG_SW[i,12]<-Gene_cart_COG[j,10]
      SW_PG_SW[i,13]<-Gene_cart_COG[j,11]
      SW_PG_SW[i,14]<-Gene_cart_COG[j,12]
      SW_PG_SW[i,15]<-Gene_cart_COG[j,13]
      SW_PG_SW[i,16]<-Gene_cart_COG[j,14]}
    print(i)
    #break
  }
}

colnames(SW_PG_SW)[1] <- "locus_tag"
colnames(SW_PG_SW)[7] <- "ann"
colnames(SW_PG_SW)[8] <- "EC_numb"
colnames(SW_PG_SW)[9] <- "KO_numb"
colnames(SW_PG_SW)[10] <- "cazyme_cat"
colnames(SW_PG_SW)[11] <- "cazyme_type"
colnames(SW_PG_SW)[12] <- "gene_family"
colnames(SW_PG_SW)[13] <- "conservation"
colnames(SW_PG_SW)[14] <- "COG"
colnames(SW_PG_SW)[15] <- "COG_ann"
colnames(SW_PG_SW)[16] <- "COG_cat"


write.csv(SW_PG_SW, "strain_SW_PG_SW.csv")

