#!/bin/bash

DATE=$(date '+%d:%m:%Y-%H:%M:%S')
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=300
n_training_steps=100
n_testing_steps=100
max_record=10000
min_record=10000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=10000
epochs=10000

agent="pongDQN"
exploration="E_GREEDY"
exploration_name="Egreedy"

layout="v3"

trainingenv_mean=0
trainingenv_std=0
trainingenv_ghost_name="RandomGhost"
trainingenv_ghost_args='{"index":1,"prob":{}}'
trainingenv_ghostarg='[{"name":"'${trainingenv_ghost_name}'","args":'${trainingenv_ghost_args}'}]'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"pong":{"exploration_strategy":"'$exploration'"},"ghosts":'$trainingenv_ghostarg',"perturb":'$trainingenv_perturb'}}'
folder="learnability_${agent}_${exploration_name}_${layout}_${trainingenv_ghost_name}_${trainingenv_ghost_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



trainingenv_mean=0
trainingenv_std=0.1
trainingenv_ghost_name="RandomGhost"
trainingenv_ghost_args='{"index":1,"prob":{}}'
trainingenv_ghostarg='[{"name":"'${trainingenv_ghost_name}'","args":'${trainingenv_ghost_args}'}]'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"pong":{"exploration_strategy":"'$exploration'"},"ghosts":'$trainingenv_ghostarg',"perturb":'$trainingenv_perturb'}}'
folder="learnability_${agent}_${exploration_name}_${layout}_${trainingenv_ghost_name}_${trainingenv_ghost_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


layout="v2"

trainingenv_mean=0
trainingenv_std=0
trainingenv_ghost_name="RandomGhost"
trainingenv_ghost_args='{"index":1,"prob":{}}'
trainingenv_ghostarg='[{"name":"'${trainingenv_ghost_name}'","args":'${trainingenv_ghost_args}'}]'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"pong":{"exploration_strategy":"'$exploration'"},"ghosts":'$trainingenv_ghostarg',"perturb":'$trainingenv_perturb'}}'
folder="learnability_${agent}_${exploration_name}_${layout}_${trainingenv_ghost_name}_${trainingenv_ghost_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



trainingenv_mean=0
trainingenv_std=0.1
trainingenv_ghost_name="RandomGhost"
trainingenv_ghost_args='{"index":1,"prob":{}}'
trainingenv_ghostarg='[{"name":"'${trainingenv_ghost_name}'","args":'${trainingenv_ghost_args}'}]'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"pong":{"exploration_strategy":"'$exploration'"},"ghosts":'$trainingenv_ghostarg',"perturb":'$trainingenv_perturb'}}'
folder="learnability_${agent}_${exploration_name}_${layout}_${trainingenv_ghost_name}_${trainingenv_ghost_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


layout="v4"

trainingenv_mean=0
trainingenv_std=0
trainingenv_ghost_name="RandomGhost"
trainingenv_ghost_args='{"index":1,"prob":{}}'
trainingenv_ghostarg='[{"name":"'${trainingenv_ghost_name}'","args":'${trainingenv_ghost_args}'}]'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"pong":{"exploration_strategy":"'$exploration'"},"ghosts":'$trainingenv_ghostarg',"perturb":'$trainingenv_perturb'}}'
folder="learnability_${agent}_${exploration_name}_${layout}_${trainingenv_ghost_name}_${trainingenv_ghost_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



trainingenv_mean=0
trainingenv_std=0.1
trainingenv_ghost_name="RandomGhost"
trainingenv_ghost_args='{"index":1,"prob":{}}'
trainingenv_ghostarg='[{"name":"'${trainingenv_ghost_name}'","args":'${trainingenv_ghost_args}'}]'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"pong":{"exploration_strategy":"'$exploration'"},"ghosts":'$trainingenv_ghostarg',"perturb":'$trainingenv_perturb'}}'
folder="learnability_${agent}_${exploration_name}_${layout}_${trainingenv_ghost_name}_${trainingenv_ghost_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$trainingenv_ghost_name'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-learnability.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
