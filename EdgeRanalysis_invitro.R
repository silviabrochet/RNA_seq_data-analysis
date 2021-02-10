library(edgeR)

# The .count files of the MIX samples are split into the four different strains 
# (6 files per strain are obtained). Then the .count files for each strain are 
# merged obtaining:
  
# RNAseqcount_183.txt
# RNAseqcount_184.txt
# RNAseqcount_185.txt
# RNAseqcount_186.txt


RNacounts <- read.table("RNAseqcount_strain.txt")

head(RNacounts)

# Read a table which contains spefication which of your samples belongs to which condition 

samples <- read.table("Samples.txt")

# Create a group in which your conditions (sampletypes are specified)

group2 <- factor(paste0(samples$Sampletyp))

# Create a DGEList file for EdgeR 

y <- DGEList(counts=RNacounts, group = group2)
head(y$counts)

# Filter data

keep <- rowSums(cpm(y)>2) >= 3
table(keep)
y <- y[keep, , keep.lib.sizes=FALSE]

# Calculate normalization factors

y <- calcNormFactors(y)
y$samples
write.table(y$samples,"calcNormFactors_strain.txt")

# MDS plot to check if your samples cluster together

#pdf(file = "MDS_plot.pdf", width = 8, height = 8)
par(mar=c(5,5,5,10))
plotMDS(y, col=rep(1:5, each=5), pch = 21, cex = log10(y$samples$lib.size/1000))
par(xpd=TRUE)
# Modify legend coordinates for each strain
#legend(2,2, legend=c("1", "2", "3", "4"),
#col="black", pch=21, pt.cex=c(1, 2, 3, 4), cex = 1, text.width = 0.5, 
#y.intersp = 1.6, x.intersp= 1.6, title = "log library size")
#dev.off()


#plotMDS(y, col=rep(1:3, each=3))

# Create a experimental design matrix 

design2 <- model.matrix(~ 0 + group2)
colnames(design2) <- levels(group2)
design2

library(statmod)

# Estimating the dispersion of the data
y <- estimateDisp(y, design2, robust = TRUE)

# Fit the negative binomialGLM 

fit <- glmQLFit(y, design2, robust = TRUE)
head(fit$coefficients)
plotQLDisp(fit)

# Define a contrast what should be tested against what: 
# example: MIX_PE vs ind_PE you will obtain the genes upregulated in 
# MIX_PE vs ind PE = log2FC>0 and viceversa genes downregulated in MIX_PE vs ind_PE = log2FC<0

MIX_ind_PE <- makeContrasts(MIX_PE - ind_PE, levels=design2) 

qlfind_MIX_ind_PE <- glmQLFTest(fit, contrast=MIX_ind_PE)
topTags(qlfind_MIX_ind_PE)
toptags_MIX_ind_PE <- topTags(qlfind_MIX_ind_PE, n = nrow(y))

deg.list_MIX_ind_PE <- toptags_MIX_ind_PE$table
head(deg.list_MIX_ind_PE)
write.csv(deg.list_MIX_ind_PE, file = "toptags_DGE_MIX_ind_PE_strain.csv")

# Annotate

MIX_ind_PE <-read.csv("toptags_DGE_MIX_ind_PE_183.csv")
GeneCart <- read.csv("Gene_cart_COG.csv")
Gene_cart_COG <- GeneCart[,c(2,1,3,25,28,29,43,44,45,46,47,48,49,50)]

for (i in 1:nrow(SW_PG_SW)){    # Loop through DGEtable 
  for (j in 1:nrow(Gene_cart_COG)){  # "within" Loop through Gene_cart_COG 
    if(MIX_ind_PE[i,1]==as.character(Gene_cart_COG[j,1])){  # if id match
      MIX_ind_PE[i,7]<-Gene_cart_COG[j,3]
      MIX_ind_PE[i,8]<-Gene_cart_COG[j,5]
      MIX_ind_PE[i,9]<-Gene_cart_COG[j,6]
      MIX_ind_PE[i,10]<-Gene_cart_COG[j,8]
      MIX_ind_PE[i,11]<-Gene_cart_COG[j,9]
      MIX_ind_PE[i,12]<-Gene_cart_COG[j,10]
      MIX_ind_PE[i,13]<-Gene_cart_COG[j,11]
      MIX_ind_PE[i,14]<-Gene_cart_COG[j,12]
      MIX_ind_PE[i,15]<-Gene_cart_COG[j,13]
      MIX_ind_PE[i,16]<-Gene_cart_COG[j,14]}
    print(i)
    #break
  }
}

colnames(MIX_ind_PE)[1] <- "locus_tag"
colnames(MIX_ind_PE)[7] <- "ann"
colnames(MIX_ind_PE)[8] <- "EC_numb"
colnames(MIX_ind_PE)[9] <- "KO_numb"
colnames(MIX_ind_PE)[10] <- "cazyme_cat"
colnames(MIX_ind_PE)[11] <- "cazyme_type"
colnames(MIX_ind_PE)[12] <- "gene_family"
colnames(MIX_ind_PE)[13] <- "conservation"
colnames(MIX_ind_PE)[14] <- "COG"
colnames(MIX_ind_PE)[15] <- "COG_ann"
colnames(MIX_ind_PE)[16] <- "COG_cat"


write.csv(MIX_ind_PE, "strain_MIX_ind_PE.csv")

