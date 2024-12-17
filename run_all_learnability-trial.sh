#!/bin/bash
DATE=$(date '+%d:%m:%Y-%H:%M:%S')

semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=1
n_training_steps=10
n_testing_steps=10
max_record=2000
min_record=2000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=2000
epochs=2000

agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"

layout="pong"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"

layout="pong"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"

layout="pong"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#!/bin/bash
DATE=$(date '+%d:%m:%Y-%H:%M:%S')

semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=1
n_training_steps=10
n_testing_steps=10
max_record=2000
min_record=2000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=2000
epochs=2000

agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"

layout="pong"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"

layout="pong"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"

layout="pong"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#!/bin/bash
DATE=$(date '+%d:%m:%Y-%H:%M:%S')

semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=1
n_training_steps=10
n_testing_steps=10
max_record=2000
min_record=2000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=2000
epochs=2000

agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"

layout="pong"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"

layout="pong"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"

layout="pong"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname



layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


#!/bin/sbatch
DATE=$(date '+%d:%m:%Y-%H:%M:%S')

semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=1
n_training_steps=10
n_testing_steps=10
max_record=2000
min_record=2000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=2000
epochs=2000

agent="BoltzmannAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"

layout="pong"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill


layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill


layout="pong"

trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill


layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

layout="pong"

trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill


layout="pong-thick"

trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="ComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill

trainingenv_mean=0
trainingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar"
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${trainingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch pong-runStatistics-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill
