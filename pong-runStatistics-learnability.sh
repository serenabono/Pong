#!/bin/bash

#SBATCH -c 1
#SBATCH --time=5:00:00
#SBATCH --job-name=ensemble

#SBATCH -p short
#SBATCH --mem=10G
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
max_record=1000
min_record=1000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=100
epochs=1000
agent="BoltzmannAgent"

testingenv_mean=0
testingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.9}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'
echo $testingenv_computer_bararg


agentprop='{"test":{"bar":{},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'


folder="learnability_${layout}_${agent}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-test'''

python pong-statistics.py -q -m l -b $agent -a $agentprop -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname
