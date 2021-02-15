# Script created by Vincent de Bakker (vincent.debakker@unil.ch)

# Read data

cog_list <- read.table("183_invivo_up_COGs_summary.txt", sep="\t", header=FALSE)

# Read, but only used at the end for COG cat information in output file:

cog_genome <- read.table("183_all_COGs.txt", sep="\t", header=FALSE) 

# Specify output file here

output_file = "183_invivo_up_COGs_enriched_new.txt"


cog_list$V5 <- paste(cog_list$V1,cog_list$V2)

# Put COG category, significant genes (DEGs), and Subtotal in generic format with understandable names

input_data <- as.data.frame(cog_list[,5])
input_data <- cbind(input_data,cog_list[, 4])
input_data <- cbind(input_data,cog_genome[, 4])
colnames(input_data) <- c("Category", "DEG", "Subtotal")

# Pre-compute for clarity

total_genes <- sum(input_data$Subtotal[input_data$Category == "No COG " | input_data$Category == "Total COG "])
total_DEG <- sum(input_data$DEG[input_data$Category == "No COG " | input_data$Category == "Total COG "])
total_nonDEG <- total_genes - total_DEG

# Get count matrix for every row in data set

counts_ls <- lapply(1:nrow(input_data), function(x){
  matrix(c(input_data$DEG[x], 
           input_data$Subtotal[x] - input_data$DEG[x], 
           total_DEG - input_data$DEG[x], 
           total_nonDEG - (input_data$Subtotal[x] - input_data$DEG[x])), 
         ncol = 2,
         dimnames = list(DEG = c("yes", "no"),
                         Category = c("yes", "no")))
})
names(counts_ls) <- input_data$Category

# Perform test on each matrix

fisher_tests_ls <- lapply(counts_ls, fisher.test, alternative = "greater")

# Extract raw p-values

p_raw <- unlist(lapply(fisher_tests_ls, function(x){x$p.value}))

# Extract adjusted p-values

p_adj <- p.adjust(p_raw, method = "BH")

# Bind to data frame

output_data <- data.frame(input_data, 
                          "COG_cat_description" = cog_genome$V3, 
                          "p_raw" = p_raw, 
                          "p_adj"= p_adj, 
                          "Significant" = p_adj < 0.01)

# Write to file if you want
# write.table(output_data, file = output_file, sep = "\t", row.names = FALSE)

