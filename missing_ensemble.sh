semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=300
n_training_steps=10
n_testing_steps=10
max_record=1000
min_record=1000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=1000
epochs=1000
agent="BoltzmannAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"
layout="pong"
#500-ensemble_BoltzmannAgent_Boltzmann_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 377
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Boltzmann_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 308
testingenv_mean=0
testingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Boltzmann_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 318
testingenv_mean=0
testingenv_std=0
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
layout="pong-thick"
#500-ensemble_BoltzmannAgent_Boltzmann_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.3}_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 379
testingenv_mean=0
testingenv_std=0.3
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
layout="pong"
agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
#500-ensemble_BoltzmannAgent_Egreedy_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.1}_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Egreedy_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.5}_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Egreedy_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.1}_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Egreedy_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.5}_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Egreedy_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.1}_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Egreedy_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.5}_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
layout="pong-thick"
#500-ensemble_BoltzmannAgent_Egreedy_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.1}_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Egreedy_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.5}_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Egreedy_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.1}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Egreedy_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.5}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Egreedy_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.1}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 170
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_BoltzmannAgent_Egreedy_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.5}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 201
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"
#500-ensemble_SarsaAgent_Boltzmann_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.1}_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 227
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Boltzmann_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.5}_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 265
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#500-ensemble_SarsaAgent_Boltzmann_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.1}_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 290
#500-ensemble_SarsaAgent_Boltzmann_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.5}_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 329
#500-ensemble_SarsaAgent_Boltzmann_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.1}_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 84
#500-ensemble_SarsaAgent_Boltzmann_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.5}_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 107
layout="pong-thick"
#500-ensemble_SarsaAgent_Boltzmann_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.1}_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 113
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Boltzmann_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.5}_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 123
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Boltzmann_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.1}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 258
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Boltzmann_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.5}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 297
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Boltzmann_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.1}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 59
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Boltzmann_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.5}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 74
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="pong"
#500-ensemble_SarsaAgent_Egreedy_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.1}_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 274
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Egreedy_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.5}_pong_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 285
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#500-ensemble_SarsaAgent_Egreedy_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.1}_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 250
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Egreedy_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.5}_pong_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 265
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Egreedy_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.1}_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 230
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Egreedy_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.5}_pong_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 239
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
layout="pong-thick"
#500-ensemble_SarsaAgent_Egreedy_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0.1}_pong-thick_ComputerBar_{"index":1,"prob":{}}_{"mean":0,"std":0}/: 237
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="ComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":{}}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="ComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":{}}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#500-ensemble_SarsaAgent_Egreedy_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.1}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 227
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Egreedy_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0.5}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.3}_{"mean":0,"std":0}/: 231
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.3}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.3}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Egreedy_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.1}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 195
testingenv_mean=0
testingenv_std=0.1
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
#500-ensemble_SarsaAgent_Egreedy_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0.5}_pong-thick_DirectionalComputerBar_{"index":1,"prob":0.6}_{"mean":0,"std":0}/: 226
testingenv_mean=0
testingenv_std=0.5
testingenv_computer_bar_name="DirectionalComputerBar" 
testingenv_computer_bar_args='{"index":1,"prob":0.6}'
testingenv_computer_bararg='{"name":"'$testingenv_computer_bar_name'","args":'$testingenv_computer_bar_args'}'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensembleenv_mean=0
ensembleenv_std=0
ensembleenv_computer_bar_name="DirectionalComputerBar" 
ensembleenv_computer_bar_args='{"index":1,"prob":0.6}'
ensembleenv_computer_bararg='{"name":"'$ensembleenv_computer_bar_name'","args":'$ensembleenv_computer_bar_args'}'
ensembleenv_noise_args='{"mean":'$ensembleenv_mean',"std":'$ensembleenv_std'}'
ensembleenv_perturb='{"noise":'$ensembleenv_noise_args',"perm":{}}'

agentprop='{"ensemble":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$ensembleenv_computer_bararg',"perturb":'$ensembleenv_perturb'},"test":{"bar":{"exploration_strategy":"'$exploration'"},"computer_bar":'$testingenv_computer_bararg',"perturb":'$testingenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_computer_bar_name}_${testingenv_computer_bar_args}_${testingenv_noise_args}_${layout}_${ensembleenv_computer_bar_name}_${ensembleenv_computer_bar_args}_${ensembleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
sbatch pong-runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
