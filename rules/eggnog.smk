rule eggnog:
    conda:
        envs.eggnog
    threads:
        20
    input:
        transdec_pep_file = rules.transdecoder_Predict.output.td_out_pep
    output:
        eggnog_out_annotation = config["eggnog_out_annotation"], 
        eggnog_out_orthologs = config["eggnog_out_orthologs"],
    params:
        eggnog_db = config["eggnog_db"],
        eggnog_prefix = config["eggnog_prefix"],
    shell:
        """
        emapper.py \
                    -i {input.transdec_pep_file} \
                    --data_dir {params.eggnog_db} \
                    --output {params.eggnog_prefix} \ 
                    -m diamond \
                    --cpu {threads}
        """
