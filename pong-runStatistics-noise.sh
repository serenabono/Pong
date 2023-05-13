#!/bin/bash

#SBATCH -c 1
#SBATCH --time=10:00:00
#SBATCH --job-name=ensemble

#SBATCH -p short
#SBATCH --mem=15G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu

DATE=$(date '+%d:%m:%Y-%H:%M:%S')
layout="pong"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=500
n_training_steps=10
n_testing_steps=10

mean=0
std=0

epochs=1000
agent="BoltzmannAgent"
noise_args='{"mean":'$mean',"std":'$std'}'
min_range=0
max_range=0
record_range='{"min_range":'$min_range',"max_range":'$max_range'}'

computer_bar_name="MoveMostlyWestComputerBar" 
computer_bar_args='{"index":1,"prob":0.8}'
computer_bararg='{"name":"'$computer_bar_name'","args":'$computer_bar_args'}'
agentprop='{"bar":{},"computer_bar":'$computer_bararg'}'

run_untill=1000

folder="ensemble_${computer_bar}_${computer_bararg}_${layout}_${noise_args}_${agent}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''

python pong-statistics.py -q -m e -b $agent -a $agentprop -n $noise_args -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname
