rule bwa_index:
    input:
        ref = rules.trinity.output.trinity_assembly_fasta
    conda:
        envs.bwa
    output:
        index_file = config["bwa_index_output"]
    shell:
        "bwa index {input.ref}"

rule bwa_map:
    input:
        ref = rules.bwa_index.input.ref,
        read_1 = rules.rmdup.output.rmdup_out_forward,
        read_2 = rules.rmdup.output.rmdup_out_reverse
    conda:
        envs.bwa
    output:
        sam = config["bwa_map_sam"]                                                                                                               shell:
        "bwa mem {input.ref} {input.read_1} {input.read_2} > {output.sam}"

rule samtools:
    input:
        sam_1 = rules.bwa_map.output.sam
    conda:
        envs.samtools
    output:
        bam = config["samtools_bam"]
    shell:
        "samtools view -S -b {input.sam_1} > {output.bam}"