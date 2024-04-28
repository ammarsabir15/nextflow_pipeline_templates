params.input_data_path = "/home/acheema/iris.txt"  
params.script_path = "/home/acheema/pca_analysis.py"

process PCA {


    // Publish the output file using the defined name
    publishDir "results_py", mode:'copy'

    input:
    path input_data
    path script_path

    output:
    path '*.png'


    script:

    """
    python3 ${script_path} ${input_data}
    """
}

workflow {
             PCA(params.input_data_path, params.script_path)
         }
