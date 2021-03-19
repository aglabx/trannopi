rule trinity:
    input:
        trinity_in_forward = rules.rmdup.output.rmdup_out_forward,
        trinity_in_reverse = rules.rmdup.output.rmdup_out_reverse,
    conda:
        envs.trinity
    threads: workflow.cores
    output:
        trinity_fasta = config["trinity_output_assembly"],
        trinity_genemap = config["trinity_output_genemap"],
    params:
        memory = "99G",
        trinity_dir = directory(config["trinity_dir"]), 
    shell:
        """Trinity \
             --seqType fq \
             --max_memory {params.memory} \
             --left {input.trinity_in_forward} \
             --right  {input.trinity_in_reverse} \
             --CPU {threads} \
             --output {params.trinity_dir} \
             --full_cleanup \
             --verbose
             """
rule trinity_cleanup:
    input:
        trinity_fasta = rules.trinity.output.trinity_fasta,
        trinity_genemap = rules.trinity.output.trinity_genemap,
    output:
        trinity_assembly_fasta = config["trinity_assembly_fasta"]
    params:
        trinity_dir = directory(config["trinity_dir"]),
    shell:
        """
        rm {input.trinity_genemap}
        mv {input.trinity_fasta} {output.trinity_assembly_fasta}
        """
    