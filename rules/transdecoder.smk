rule transdecoder_LongOrfs:
    input:
        input = "./data/td_input.fasta"
    conda:
        "./envs/transdecoder.yaml"
    output:
        blast_input1 = "",
        blast_input2 = ""
    params:
        dir = directory("./output/")
    shell:
        """
           TransDecoder.LongOrfs -t {input} --output_dir {params.dir}
        """
