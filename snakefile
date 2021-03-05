configfile: "config/config.yaml"

rule all:
    input:
        results_file = config["results_file"]

rule locals:
    params:
        rmdub = "tools/rmdub/rmdup.exe",
        eggnog_db = "/mnt/projects/zilov/soft/eggnog-mapper-2.0.4-rf1/database",
        blast_db = "/mnt/projects/shared/ncbi/blast/db/nt",

# set all locals s variable
locals = rules.tools.params


rule envs:
    params:
	#all_tools from envs folder
	tool_name = "../envs/tool.yaml"
	v2trim = "../envs/v2trim.yaml",
	rmdub = "../envs/rmdub.yaml",
        fastqc = "../envs/fastqc.yaml",
        prokka = "../envs/prokka.yaml",
        blast = "../envs/blast.yaml",

# set all tools envs as a variable        
envs = rules.envs.params
# to call it use envs.<tool_name>

# trimming reads
include: "rules/v2trim.smk"
# clean up reads from optical duplicates
include: "rules/rmdub.smk"
#......
# last step
include: "rules/last_step.smk"


