#!/bin/bash

#SBATCH -c 1
#SBATCH --time=10:00:00
#SBATCH --job-name=pong-newexp-learnability2agents

#SBATCH -p short
#SBATCH --mem=30G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu

DATE=$(date '+%d:%m:%Y-%H:%M:%S')

agent=$1
layout=$2
agentprop=$3
epochs=$4
training_agents=$5
n_training_steps=$6
n_testing_steps=$7
outputname=$8

python pong-statistics.py -q -m e -b $agent -a $agentprop -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname
