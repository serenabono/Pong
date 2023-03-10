#!/bin/bash

layout="ChloeTest"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
loadagent="saved_agent.pkl"
scale=1
mean=0.3
epochs=1000
training_agents=300

for std in 0.5 0.6:
do
    noiseArgs='{"mean":'$mean',"std":'$std',"scale":'$scale'}'
    python statistics.py -m s -p BoltzmannAgent -t $loadagent -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":10,"n_testing_steps":10,"timeout":30}''' -o '''results_agents/saved_agent_'$layout'_BoltzmannAgent_'$semanticDistribution'_'$noiseType'_'$noiseArgs'-'$training_agents'-'$epochs'.pkl''' -n '''{"semanticDistribution":"'$semanticDistribution'","noiseType":"'$noiseType'","noiseArgs":'$noiseArgs'}'''
done