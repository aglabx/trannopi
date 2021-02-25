rule trimming:
    input:
        forward_reads = "/mnt/projects/shared/transcriptome_pipeline/data/v2trim_reads/8_1.fastq",
        reverse_reads = "/mnt/projects/shared/transcriptome_pipeline/data/v2trim_reads/8_2.fastq",
    conda:
        "/home/nsorokina/snakemake/envs/v2trim.yaml"
    threads: 20
    output:
        trimming_forward = "/home/nsorokina/snakemake/output/8.trim_1.fastq",
        trimming_reverse = "/home/nsorokina/snakemake/output/8.trim_2.fastq",
        statistics = "/home/nsorokina/snakemake/output/8.stats",
    params:
        dir = "/home/nsorokina/snakemake/output" 
    shell:
        """v2trim -1 {input.forward_reads} \
                 -2 {input.reverse_reads} \
                 -o {params.dir} \
                 -t {threads} \
                 -u"""
