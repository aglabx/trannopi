configfile: "config/config.yaml"

rule all:
    input:
        outfile_1 = config["eggnog_out_annotation"],
        outfile_2 = config["eggnog_out_orthologs"],


rule locals:
    params:
        eggnog_db = "/mnt/projects/databases/eggnog_db/",
        blast_db = "/mnt/projects/shared/ncbi/blast/db/nt",

# set all locals s variable
locals = rules.locals.params


rule envs:
    params:
        #all_tools from envs folder
        v2trim = "../envs/v2trim.yaml",
        rmdup = "../envs/rmdup.yaml",
        trinity = "../envs/trinity.yaml",
        transdecoder = "../envs/transdecoder.yaml",
        eggnog = "../envs/eggnog.yaml",
        fastqc = "../envs/fastqc.yaml",
        prokka = "../envs/prokka.yaml",
        blast = "../envs/blast.yaml",

# set all tools envs as a variable        
envs = rules.envs.params
# to call it use envs.<tool_name>

# trimming reads
include: "rules/v2trim.smk"
# clean up reads from optical duplicates
include: "rules/rmdup.smk"
# trinity
include: "rules/trinity.smk"
#transdecoder
include: "rules/transdecoder.smk"
#eggnog
include: "rules/eggnog.smk"
#......
# last step
#include: "rules/last_step.smk"


