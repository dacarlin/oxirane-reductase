#$ -N a1l-relax
#$ -cwd
#$ -S /bin/bash
#$ -e logs
#$ -o logs
#$ -t 1-25

export ROSETTA_DB3=/share/archive2/siegellab/Rosetta/main/database
export PATH=$PATH:/share/archive2/siegellab/Rosetta/main/source/bin

relax.linuxgccrelease -extra_res_fa nax.params -constrain_relax_to_start_coords -relax:coord_constrain_sidechains -relax:ramp_constraints false -s 1lc3.pdb -out:suffix "${SGE_TASK_ID}"
