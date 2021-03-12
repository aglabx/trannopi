rule clean up optical duplicates:
    input:
        v2trim_out_forward = config["v2trim_out_file1"] ,
        v2trim_out_reverse = config["v2trim_out_file2"],
    conda:
        "/home/nsorokina/snakemake/rmdub/envs/rmdub.yaml"
    threads: 20
    output:
        rmdup_out_forward = config["rmdup_out_file1"] ,
        rmdup_out_reverse = config["rmdup_out_file2"],
        rmdup_out_statistics = config["rmdup_out_statistics"] ,
    params:
        rmdup_dir = config["rmdup_dir"] 
    shell:
        """rmdup -1 {input.v2trim_out_forward} \
                 -2 {input.v2trim_out_reverse} \
                 -o {params.rmdup_dir} \
                 -t {threads} \
                 -u"""

