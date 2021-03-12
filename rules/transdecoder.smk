rule transdecoder_LongOrfs:
    input:
        rules.trinity.output.trinity_assembly_fasta
    conda:
        envs.transdecoder
    output:
        td_out_cds = config["transdecoder_out_cds"],
        td_out_gff3 = config["transdecoder_out_gff3"]
    params:
        dir = config["transdecoder_dir"]
    shell:
        """
           TransDecoder.LongOrfs -t {input} --output_dir {params.dir}
        """

rule transdecoder_Predict:
    input:
        rules.trinity.output.trinity_assembly_fasta
    conda:
        envs.transdecoder
    output:
        td_out_pep = config["transdecoder_out_pep"],
        td_out_bed = config["transdecoder_out_bed"]
    params:
        dir = config["transdecoder_dir"]
    shell:
        """
           TransDecoder.Predict -t {input} --output_dir {params.dir}
           mv td_input.fasta.transdecoder.bed td_input.fasta.transdecoder.pep td_input.fasta.transdecoder.cds td_input.fasta.transdecoder.gff3 {params.dir}
        """