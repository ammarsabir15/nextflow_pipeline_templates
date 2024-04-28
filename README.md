# nextflow_pipeline_templates
This repository contains the nextflow pipelines templates
I have added threes basic pipelines here.

**basic_io.nf**: A basic pipline which prints the output to screen for an input file

`nextflow run basic_io.nf`

Or 

`nextflow run basic_io.nf --in_file "<file_path>"`


**pca_pipeline_R.nf**: A basic pipeline to apply PCA using Rscript on an input file 

`nextflow run pca_pipeline_R.nf`

Or

`nextflow run pca_pipeline_R.nf --input_data_path "<file_path>" --script_path "<Rscript_path>"`


**pca_pipeline_python.nf**: A basic pipeline to apply PCA using python script on an input file 

`nextflow run pca_pipeline_python.nf`

Or

`nextflow run pca_pipeline_python.nf --input_data_path "<file_path>" --script_path "<python_script_path>"`
