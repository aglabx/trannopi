rule transdecoder_LongOrfs:
    input:
        "./data/td_input.fasta"
    conda:
        "./envs/transdecoder.yaml"
    output:
        blast_input1 = "./transdecoder_output/longest_orfs.cds",
        blast_input2 = "./transdecoder_output/longest_orfs.gff3"
    params:
        dir = directory("./transdecoder_output/")
    shell:
        """
           TransDecoder.LongOrfs -t {input} --output_dir {params.dir}
        """

rule transdecoder_Predict:
    input:
        "./data/td_input.fasta"
    conda:
        "./envs/transdecoder.yaml"
    output:
        blast_input1 = "./transdecoder_output/td_input.fasta.transdecoder.pep",
        blast_input2 = "./transdecoder_output/td_input.fasta.transdecoder.cds"
    params:
        dir = directory("./transdecoder_output/")
    shell:
        """
           TransDecoder.Predict -t {input} --output_dir {params.dir}
           mv td_input.fasta.transdecoder.bed td_input.fasta.transdecoder.pep td_input.fasta.transdecoder.cds td_input.fasta.transdecoder.gff3 {params.dir}
        """
