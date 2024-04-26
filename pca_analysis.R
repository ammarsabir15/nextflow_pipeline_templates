# Load required libraries
library(ggplot2)

# Read input data
input_data <- read.csv(commandArgs(TRUE)[1],sep = "\t",row.names = 1)

# Perform PCA
pca_result <- prcomp(input_data)

pcaData <- as.data.frame(pca_result$x[, 1:2]) # extract first two columns and convert to data frame
pcaData <- cbind(pcaData, iris$Species) # bind by columns
colnames(pcaData) <- c("PC1", "PC2", "Species")

pca_plot <- ggplot(data = pcaData, aes(x = PC1, y = PC2,color = Species, shape = Species)) +
                    geom_point() +
                              labs(x = "PC1", y = "PC2", title = "PCA Plot")


#output_file <- commandArgs(TRUE)[2]
# Save plot as PNG image file
png(paste(basename(input_data),sep="","PCA_result.png"), width = 800, height = 600)
print(pca_plot)
dev.off()
