#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#@created: <data>
#@author: <name>
#@contact: <email>

import sys
import argparse
import os
import os.path


def main(forward_read, reverse_read, outdir):
    ''' Function description.
    '''
    pass
    
    config_file = "./config/config.yaml"
    
    prefix = os.path.basename(forward_read).split(".")[0].split("_")[0]
    
    config = f"""

# main parameters

# databases
eggnog_db: "/mnt/projects/databases/eggnog_db/"

#v2trim
v2trim_dir: "{outdir}/v2trim/"

v2trim_in_file1: "{forward_read}"
v2trim_in_file2: "{reverse_read}"
v2trim_prefix: "{prefix}"

v2trim_out_file1: "{outdir}/v2trim/{prefix}.trim_1.fastq"
v2trim_out_file2: "{outdir}/v2trim/{prefix}.trim_2.fastq"
v2trim_out_statistics: "{outdir}/v2trim/{prefix}.stats"


#rmdup
rmdup_dir: "{outdir}/rmdup/"

rmdup_out_file1: "{outdir}/rmdup/{prefix}.rm_1.fastq"
rmdup_out_file2: "{outdir}/rmdup/{prefix}.rm_2.fastq"
rmdup_out_statistics: "{outdir}/rmdup/{prefix}.rm.stats"

#trinity
trinity_dir: "{outdir}/trinity"
trinity_output_assembly: "{outdir}/trinity.Trinity.fasta"
trinity_output_genemap: "{outdir}/trinity.Trinity.fasta.gene_trans_map"
trinity_assembly_fasta: "{outdir}/trinity/{prefix}.Trinity.fasta"
#trasdecoder
transdecoder_dir: "{outdir}/transdecoder"

transdecoder_out_cds: "{outdir}/transdecoder/{prefix}_longest_orfs.cds"
transdecoder_out_gff3: "{outdir}/transdecoder/{prefix}_longest_orfs.gff3"

transdecoder_out_pep: "{outdir}/transdecoder/{prefix}_td_input.fasta.transdecoder.pep"
transdecoder_out_bed: "{outdir}/transdecoder/{prefix}_td_input.fasta.transdecoder.bed"

#bwa_index
bwa_dir = "{outdir}/bwa_samtools/"
bwa_index_output: "{outdir}/trinity/{prefix}.amb"

#bwa_map
bwa_dir = "{outdir}/bwa_samtools/"
bwa_map_sam: "{outdir}/bwa_samtools/{prefix}.sam"

#samtools
samtools_dir = "{outdir}/bwa_samtools/"
samtools_bam: "{outdir}/bwa_samtools/{prefix}.bam"

#blast

#eggnog
eggnog_dir: "{outdir}/eggnog/"
eggnog_prefix: "{prefix}"

eggnog_out_annotation: "{outdir}/eggnog/{prefix}.emapper.annotations"
eggnog_out_orthologs: "{outdir}/eggnog/{prefix}.emapper.seed_orthologs"

    """

    with open(config_file, "w") as fw:
        fw.write(config)


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Program description.')
    parser.add_argument('-1', '--forward_read', help='sample directory', required=True)
    parser.add_argument('-2', '--reverse_read', help='sample directory', required=True)
    parser.add_argument('-o', '--outdir', help='sample directory', required=True)
    args = vars(parser.parse_args())
    
    
    forward_read = os.path.abspath(args["forward_read"])
    reverse_read = os.path.abspath(args["reverse_read"])
    outdir = os.path.abspath(args["outdir"])

    main(forward_read, reverse_read, outdir)
