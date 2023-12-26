#!/bin/bash

#SBATCH -c 1
#SBATCH --time=10:00:00
#SBATCH --job-name=generalization

#SBATCH -p short
#SBATCH --mem=10G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu

DATE=$(date '+%d:%m:%Y-%H:%M:%S')
layout="pong-thick"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=500
n_training_steps=10
n_testing_steps=10
max_record=1000
min_record=1000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=1000
epochs=1000
agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"

testingenv_mean=0
testingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'
echo $testingenv_computer_bararg


agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

echo '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}'''

folder="generalization_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$testingenv_noise_args'_'$testing_agents'-'$RANDOM'-'$DATE'-test'''

python pong-statistics.py -q -m g -b $agent -a $agentprop -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname
