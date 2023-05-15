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

epochs=1000
agent="BoltzmannAgent"

testingenv_mean=0
testingenv_std=0.9
testingenv_computer_bar_name="MoveMostlyWestComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.8}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'
echo $testingenv_computer_bararg


agentprop='{"test":{"bar":{},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'


run_untill=1000

folder="generalization_${layout}_${agent}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''

python pong-statistics.py -q -m g -b $agent -a $agentprop -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname
