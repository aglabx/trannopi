rule clean up optical duplicates:
    input:
        forward_reads = "/home/nsorokina/snakemake/output/8.trim_1.fastq",
        reverse_reads = "/home/nsorokina/snakemake/output/8.trim_2.fastq",
    conda:
        "/home/nsorokina/snakemake/rmdub/envs/rmdub.yaml"
    threads: 20
    output:
        trimming_forward = "/home/nsorokina/snakemake/rmdub/output/8.rm_1.fastq",
        trimming_reverse = "/home/nsorokina/snakemake/rmdub/output/8.rm_2.fastq",
        statistics = "/home/nsorokina/snakemake/rmdub/output/8.rm.stats",
    params:
        dir = "/home/nsorokina/snakemake/rmdub/output"
    shell:
        """rmdup -1 {input.forward_reads} \
                 -2 {input.reverse_reads} \
                 -o {params.dir} \
                 -t {threads} \
                 -u"""

