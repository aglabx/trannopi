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
    
    prefix = os.path.basename(forward_read).split(".")[0]
    
    config = f"""

# main parameters


#v2trim
v2trim_dir = "{outdir}/v2trim/"

v2trim_in_file1: "{forward_read}"
v2trim_in_file2: "{reverse_read}"
v2trim_prefix: "{prefix}"

v2trim_out_file1: "{outdir}/v2trim/{prefix}.trim_1.fastq"
v2trim_out_file2: "{outdir}/v2trim/{prefix}.trim_2.fastq"


#rmdup

#trininty

#trasdecoder

#blast

#eggnog


    """

    with open(config_file, "w") as fw:
        fw.write(config)


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Program description.')
    parser.add_argument('-1', '--forward_read', help='sample directory', required=True)
    parser.add_argument('-2', '--reverse_read', help='sample directory', required=True)
    parser.add_argument('-o', '--outdir', help='sample directory', required=True)
    args = vars(parser.parse_args())
    
    
    forward_read = args["forward_read"]
    reverse_read = args["reverse_read"]
    outdir = args["workdir"]

    main(forward_read, reverse_read, outdir)