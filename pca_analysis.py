import sys
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

# Check if the command-line argument for the file name is provided
if len(sys.argv) < 2:
        print("Please provide the file name as a command-line argument.")
        sys.exit(1)
 # Get the file name from the command-line argument
file_name = sys.argv[1]

 # Load the iris dataset
iris_df = pd.read_csv(file_name,sep = "\t")

# Separate features (first four columns) and labels (species names in the last column)
X = iris_df.iloc[:, :-1]  # Features (first four columns)
y = iris_df.iloc[:, -1]   # Labels (species names in the last column)

# Standardize the features
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Apply PCA
pca = PCA(n_components=2)  # We choose 2 principal components for visualization
X_pca = pca.fit_transform(X_scaled)

# Create a DataFrame for the transformed features
pca_df = pd.DataFrame(data=X_pca, columns=['PC1', 'PC2'])

# Concatenate the transformed features with the species names
pca_df = pd.concat([pca_df, y], axis=1)

# Print the explained variance ratio
print("Explained variance ratio:", pca.explained_variance_ratio_)

# Plot the PCA results
plt.figure(figsize=(10, 6))
sns.scatterplot(x='PC1', y='PC2', hue='Species', data=pca_df, palette='Set1', s=100)
plt.title('PCA of Iris Dataset')
plt.xlabel('Principal Component 1')
plt.ylabel('Principal Component 2')
plt.legend(loc='upper right')
plt.grid(True)

# Save the plot as a PNG image
output_file_name = file_name.split('.')[0] + '_pca_plot.png'
plt.savefig(output_file_name)

# Show the plot
plt.show()
