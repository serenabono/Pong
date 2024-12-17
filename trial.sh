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

layout="pong-thick"

testingenv_mean=0
testingenv_std=0
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'
folder="_trial_generalization_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$testingenv_computer_bar_name'_'$testingenv_computer_bar_args'_'$testingenv_noise_args'_'$testing_agents'-'$RANDOM'-'$DATE'-test'''
bash pong-runStatistics-geralization.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname $record_range $run_untill
