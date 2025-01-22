
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=100
n_training_steps=10
n_testing_steps=10
max_record=1000
min_record=1000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=1000
epochs=1000
agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="pong"
#500-learnability2agents_BoltzmannAgent_Boltzmann_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 369
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
