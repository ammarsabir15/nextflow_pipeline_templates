# this is a basic nextflow pipeline which takes as input a file and applies PCA on it and stores the result of PCA in the folder named results


params.input_data_path = "/home/acheema/iris.txt"
params.script_path = "/home/acheema/pca_analysis.R"

process PCA {


    // Publish the output file using the defined name       
    publishDir "results", mode:'copy'

    input:
    path input_data
    path script_path

    output:
    path '*.png'


    script:

    """
    Rscript ${script_path} ${input_data}
    """
}

workflow {
             PCA(params.input_data_path, params.script_path)
         }
