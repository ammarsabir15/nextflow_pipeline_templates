# this is a basic nextflow pipeline which takes in input a file and saves the contents in the directory `results`
params.in_file = "/home/acheema/iris.csv"


process INDEX {
    publishDir "results", mode:'copy'
    input:
    path params.in_file

    output:
    path "output.txt"

    script:
    """
    cat $params.in_file > output.txt
    """
}



workflow {
    index_ch = INDEX(params.in_file)
}
