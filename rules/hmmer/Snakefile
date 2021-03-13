rule hmmer:
    input:
        pep_file = "/media/eternus1/nfs/projects/shared/transcriptome_pipeline/data/hmmer/Trinity.fasta.transdecoder.pep"
    conda:
        "/home/sryaxovsky/transcriptomics_pipeline/envs/hmmer.yaml"
    output:
        out = "/media/eternus1/nfs/projects/shared/transcriptome_pipeline/data/hmmer/pfam.domtblout"
    params:
        db = "/mnt/data/ncbi/pfam/pfam_33.1/Pfam-A.hmm"     
    threads: 32
    shell:
        """ hmmscan --cpu {threads} --domtblout {output} {params.db} {input} """
