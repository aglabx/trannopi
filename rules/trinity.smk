rule trinity:
    input:
        trinity_in_forward = rules.rmdup.output.rmdup_out_forward,
        trinity_in_reverse = rules.rmdup.output.rmdup_out_reverse,
    conda:
        envs.trinity
    threads: 20
    output:
        trinity_assembly_fasta = config["trinity_assembly_fasta"],
    params:
        prefix = config["v2trim_prefix"],
        memory = "99G",
        trinity_dir = directory(config["trinity_dir"]), 
    shell:
        """trinity \
             --seqType fq \
             --max_memory {params.memory} \
             --left {input.trinity_in_forward} \
             --right  {trinity_in_reverse} \
             --CPU {threads} \
             --output {params.prefix} \
             --full_cleanup \
             --verbose
             """