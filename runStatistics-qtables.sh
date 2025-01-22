#!/bin/bash

#SBATCH -c 1
#SBATCH --time=01:00:00
#SBATCH --job-name=newexp-trial

#SBATCH -p short
#SBATCH --mem=30G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu

python explaining_behaviour.py $1