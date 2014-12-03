#!/bin/bash

#$ -cwd 
#$ -S /bin/bash
#$ -e logs
#$ -o logs
#$ -N or-1l
#$ -t 1-13

str=$( awk -v s="${SGE_TASK_ID}" 'NR==s' run.txt )

export ROSETTA_DB3=/share/archive2/siegellab/Rosetta/main/database
export PATH=$PATH:/share/archive2/siegellab/Rosetta/main/source/bin

rosetta_scripts.linuxgccrelease @ design.flags -in:file:s $str -out:path:all out
