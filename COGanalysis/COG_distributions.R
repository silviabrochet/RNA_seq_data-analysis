library(ggplot2) 
library(xlsx)
library(plyr)
library(dplyr)
library(reshape)
library(gplots)
library(gtools)
library(limma)

### Script created by Prof. Philipp Engel (philipp.engel@unil.ch)

mydata <- read.table("183_down.txt", sep="\t", header=TRUE)

# Make subset of gene counts with COG annotation

COGsubset <- subset(mydata, COGcategory != "other")

# Get total counts per group

COGs <- COGsubset %>%
  group_by(Group) %>%
  summarize(total = sum(Counts))

# Convert counts into proportional data

COGsubset_rel<-group_by(COGsubset, Group) %>% transmute(COGcode, percent = Counts/sum(Counts))
COGsubset_rel['COG'] <- COGsubset$COG

# Convert counts into proportional data

mydata_rel<-group_by(mydata, Group) %>% transmute(COGcode, percent = Counts/sum(Counts))
mydata_rel['COG'] <- mydata$COG

colourCount = length(unique(mydata$COGcategory))
getPalette = colorRampPalette(brewer.pal(9, "Set1"))

pdf("differentially_regulated_genes.pdf")

ggplot(data=COGsubset_rel, aes(x=Group, y=percent, fill=COGcode)) + geom_bar(stat="identity")+ 
  ylab("Percent") + xlab("") +
  ggtitle("differentially_regulated_genes") +
  theme_bw() +
  theme(axis.text.x = element_text(face = "bold", size = 12)) +
  theme(axis.title.y = element_text(face = "bold", size = 13)) +
  theme(axis.text.y = element_text(face = "bold", size = 12)) +
  theme(legend.text = element_text(colour="black", size = 6), axis.text.x = element_text(angle = 45, hjust = 1) ) +
  theme(legend.position="right") +
  scale_fill_manual(values = rev(getPalette(colourCount))) 
  #geom_text(aes(Group, c(1.1), label = Counts, fill = NULL), data = totalCOGs)+
  #geom_text(aes(Group, c(1.2), label = total, fill = NULL), data = COGs)

dev.off()

# Make plot with same data but propotional, no cog vs total cog
# Convert counts into proportional data

TotalPanCounts <- subset(mydata, COGcategory == "other")

# Get total counts per group

totals <- TotalPanCounts %>%
  group_by(Group) %>%
  summarize(total = sum(Counts))

# Subset total counts of annotated genes per group

totalCOGs <- subset(TotalPanCounts, COG == "Total COG")

colourCount = length(unique(TotalPanCounts$COG))
getPalette = colorRampPalette(brewer.pal(9, "Set1"))

# Plot total number of core genes divided into COG annotated and non-annotated genes

pdf("differentially_regulated_genes.pdf")

ggplot(data=TotalPanCounts, aes(x=Group, y=Counts, fill=COG)) + geom_bar(stat="identity")+ 
  ylab("Counts") + xlab("") +
  ylab("Percent") + xlab("") +
  ggtitle("differentially_regulated_genes") +
  theme_bw() +
  theme(axis.text.x = element_text(face = "bold", size = 12)) +
  theme(axis.title.y = element_text(face = "bold", size = 13)) +
  theme(axis.text.y = element_text(face = "bold", size = 12)) +
  theme(legend.text = element_text(colour="black", size = 6), axis.text.x = element_text(angle = 45, hjust = 1) ) +
  theme(legend.position="right") +
  scale_fill_manual(values = rev(getPalette(colourCount))) +
  geom_text(aes(Group, total+3, label = total, fill = NULL), data = totals)
dev.off()
mydata_rel<-group_by(TotalPanCounts, Group) %>% transmute(COG, percent = Counts/sum(Counts))

pdf("differentially_regulated_genes.pdf")

ggplot(data=mydata_rel, aes(x=Group, y=percent, fill=COG)) + geom_bar(stat="identity")+ 
  ylab("Counts") + xlab("") +
  ylab("Percent") + xlab("") +
  ggtitle("differentially_regulated_genes") +
  theme_bw() +
  theme(axis.text.x = element_text(face = "bold", size = 12)) +
  theme(axis.title.y = element_text(face = "bold", size = 13)) +
  theme(axis.text.y = element_text(face = "bold", size = 12)) +
  theme(legend.text = element_text(colour="black", size = 6), axis.text.x = element_text(angle = 45, hjust = 1) ) +
  theme(legend.position="right") +
  scale_fill_manual(values = rev(getPalette(colourCount))) +
  geom_text(aes(Group, c(1.1), label = total, fill = NULL), data = totals)

dev.off()
