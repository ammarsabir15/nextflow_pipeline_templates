# Load required libraries
library(ggplot2)

# Read input data
input_data <- read.csv(commandArgs(TRUE)[1],sep = "\t",row.names = 1)

# Perform PCA
pca_result <- prcomp(input_data)


pca_plot <- ggplot(data = as.data.frame(pca_result$x), aes(x = PC1, y = PC2)) +
                    geom_point() +
                                labs(x = "PC1", y = "PC2", title = "PCA Plot")


#output_file <- commandArgs(TRUE)[2]
# Save plot as PNG image file
png("PCA_result.png", width = 800, height = 600)
print(pca_plot)
dev.off()
