#!/usr/bin/env python
# coding: utf-8

# In[2]:


import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import scipy.stats
import plotly
import plotly.io as pio
pio.renderers.default = 'iframe'
import plotly.express as px
plotly.offline.init_notebook_mode(connected=True)
import seaborn as sns
import matplotlib as mpl
import re
import json
import sys
import glob
import csv

if len(sys.argv) != 2:
    print("Usage: python script.py <file_path>")
    sys.exit(1)

# Extract the file path from the command-line arguments
file_path = sys.argv[1]


data = {}
name = {}
paths = glob.glob(f'_trial_*{file_path}*')


for path in paths:
    agent = path.split("_")[-6]
    exploration_strategy = path.split("_")[-5]
    grid = path.split("_")[-4]
    bar = "_".join(path.split("_")[-3:-1])
    noise = "".join(path.split("_")[-1])
    pkl_files = glob.glob(os.path.join(path, 'saved_agent*.pkl'))
    for file in pkl_files:        
        if "learnability" in path:
            otherbar = bar
            othernoise = noise
        else:
            repeat_grid = file.split("_")[3]
            path_file = f"_{repeat_grid}" + re.findall(r'-test.*?_end', file)[0]
            path_file = path_file.replace("'","\"").replace(" ", "").replace("-train","").replace("-test","").replace("_end", "")
            otherbar = "_".join(path_file.split("_")[2:4])
            othernoise = path_file.split("_")[4]
            
        if agent not in data:
            data[agent] = {}
            name[agent] = {}
        if exploration_strategy not in data[agent]:
            data[agent][exploration_strategy] = {}
            name[agent][exploration_strategy] = {}
        if grid not in data[agent][exploration_strategy]:
            data[agent][exploration_strategy][grid] = {}
            name[agent][exploration_strategy][grid] = {}
        if bar not in data[agent][exploration_strategy][grid]:
            data[agent][exploration_strategy][grid][bar] = {}
            name[agent][exploration_strategy][grid][bar] = {}
        if noise not in data[agent][exploration_strategy][grid][bar]:
            data[agent][exploration_strategy][grid][bar][noise] = {}
            name[agent][exploration_strategy][grid][bar][noise] = {}
        if otherbar not in data[agent][exploration_strategy][grid][bar][noise]:
            data[agent][exploration_strategy][grid][bar][noise][otherbar] = {}
            name[agent][exploration_strategy][grid][bar][noise][otherbar] = {}
        if othernoise not in data[agent][exploration_strategy][grid][bar][noise][otherbar]:
            name[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise] = []
            data[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise] = {}
            data[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise]["tables"] = []
    
        values = []
        print(file)
        with open(file, newline='') as csvfile:
            reader = csv.reader(csvfile, delimiter='\n', quotechar='|')
            for row in reader:
                values.append(float(row[0]))
        data[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise]["values"] = values
    
        json_files = glob.glob(os.path.join(path, '*.json'))
        for file in json_files:
            with open(file) as f:
                train_epoch = file.split("-")[-1].replace(rf"train0_","").replace(".json","")
                data[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise]["tables"].append(json.load(f))
                name[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise].append(f'{re.sub("./_trial_", "", path)}_{train_epoch}')



# for path in paths:
#     agent = path.split("_")[-6]
#     exploration_strategy = path.split("_")[-5]
#     grid = path.split("_")[-4]
#     bar = "_".join(path.split("_")[-3:-1])
#     noise = "".join(path.split("_")[-1])
    
#     pkl_files = glob.glob(os.path.join(path, '*.pkl'))
#     for file in pkl_files:
#         if "learnability" in path:
#             otherbar = bar
#             othernoise = noise
#             other_file = f"learnability/learnability_{agent}_{exploration_strategy}_{grid}_{bar}_{noise}.pkl"
#         else:
#             repeat_grid = file.split("_")[3]
#             path_file = f"_{repeat_grid}" + re.findall(r'-test.*?_end', file)[0]
#             path_file = path_file.replace("'","\"").replace(" ", "").replace("-train","").replace("-test","").replace("_end", "")
#             otherbar = "_".join(path_file.split("_")[2:4])
#             othernoise = path_file.split("_")[4]
#             other_file = f"generalization/generalization_{agent}_{exploration_strategy}_{grid}_{bar}_{noise}_{grid}_{otherbar}_{othernoise}.pkl"
        
#         if agent not in data:
#             data[agent] = {}
#             name[agent] = {}
#         if exploration_strategy not in data[agent]:
#             data[agent][exploration_strategy] = {}
#             name[agent][exploration_strategy] = {}
#         if grid not in data[agent][exploration_strategy]:
#             data[agent][exploration_strategy][grid] = {}
#             name[agent][exploration_strategy][grid] = {}
#         if bar not in data[agent][exploration_strategy][grid]:
#             data[agent][exploration_strategy][grid][bar] = {}
#             name[agent][exploration_strategy][grid][bar] = {}
#         if noise not in data[agent][exploration_strategy][grid][bar]:
#             data[agent][exploration_strategy][grid][bar][noise] = {}
#             name[agent][exploration_strategy][grid][bar][noise] = {}
#         if otherbar not in data[agent][exploration_strategy][grid][bar][noise]:
#             data[agent][exploration_strategy][grid][bar][noise][otherbar] = {}
#             name[agent][exploration_strategy][grid][bar][noise][otherbar] = {}
#         if othernoise not in data[agent][exploration_strategy][grid][bar][noise][otherbar]:
#             name[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise] = []
#             data[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise] = {}
#             data[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise]["tables"] = []
    
#         values = []
#         with open(other_file, newline='') as csvfile:
#             reader = csv.reader(csvfile, delimiter='\n', quotechar='|')
#             for row in reader:
#                 values.append(float(row[0]))
#         data[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise]["values"] = values
    
#         json_files = glob.glob(os.path.join(path, '*.json'))
#         for file in json_files:
#             with open(file) as f:
#                 train_epoch = file.split("-")[-1].replace(rf"train0_","").replace(".json","")
#                 data[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise]["tables"].append(json.load(f))
#                 name[agent][exploration_strategy][grid][bar][noise][otherbar][othernoise].append(f'{re.sub("./_trial_", "", path)}_{train_epoch}')


# In[17]:


from matplotlib.colors import LinearSegmentedColormap
from tqdm import tqdm
import os
import imageio

def generate_occupancy(folder,subfolder,agent, exploration_strategy, somegrid, somebar, somenoise, someotherbar, someothernoise, sortex_idx):
    
    states_distribution = {}
    if agent not in states_distribution:
        states_distribution[agent] = {}
    if exploration_strategy not in states_distribution[agent]:
        states_distribution[agent][exploration_strategy] = {}
    if somegrid not in states_distribution[agent][exploration_strategy]:
        states_distribution[agent][exploration_strategy][somegrid] = {}
    if somebar not in states_distribution[agent][exploration_strategy][somegrid]:
        states_distribution[agent][exploration_strategy][somegrid][somebar] = {}
    if somenoise not in states_distribution[agent][exploration_strategy][somegrid][somebar]:
        states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise] = {}
    if someotherbar not in states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise]:
        states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise][someotherbar] = {}
    if someothernoise not in states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise][someotherbar]:
        states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise][someotherbar][someothernoise] = {}
        
    idxs = sorted(range(len(name[agent][exploration_strategy][somegrid][somebar][somenoise][somebar][somenoise])), key=lambda x: int(name[agent][exploration_strategy][somegrid][somebar][somenoise][somebar][somenoise][x].split('_')[-2]))
    evolution_game = np.asarray(data[agent][exploration_strategy][somegrid][somebar][somenoise][somebar][somenoise]["tables"])[idxs]
    idxs_o = sorted(range(len(name[agent][exploration_strategy][somegrid][someotherbar][someothernoise][someotherbar][someothernoise])), key=lambda x: int(name[agent][exploration_strategy][somegrid][someotherbar][someothernoise][someotherbar][someothernoise][x].split('_')[-2]))
    evolution_game_other = np.asarray(data[agent][exploration_strategy][somegrid][someotherbar][someothernoise][someotherbar][someothernoise]["tables"])[idxs_o]
    action_pd_no_noise = pd.DataFrame(evolution_game[-1]).sort_index()
    action_pd_noise = pd.DataFrame(evolution_game_other[-1]).sort_index()
    all_columns = pd.merge(action_pd_no_noise.fillna(np.nan).astype(float), action_pd_noise.fillna(np.nan).astype(float), how="outer").columns
    action_pd_no_noise_complete = pd.concat([action_pd_no_noise,pd.DataFrame(columns=list(set(all_columns) - set(action_pd_no_noise.columns)))]).fillna(np.nan).sort_index()[all_columns]
    action_pd_noise_complete = pd.concat([action_pd_noise,pd.DataFrame(columns=list(set(all_columns) - set(action_pd_noise.columns)))]).fillna(np.nan).sort_index()[all_columns]
    common_nan_mask = np.isnan(action_pd_no_noise_complete.values) & np.isnan(action_pd_noise_complete.values)
    column_mask = np.all(common_nan_mask, axis=0)
    masked_data_terminal = np.ma.masked_array(common_nan_mask, mask=np.repeat(column_mask.reshape(1,-1), 3, axis=0))
    
    #for sortex_idx in range(len(data[agent][exploration_strategy][somegrid][somebar][somenoise][somebar][somenoise]["values"])):
    #fig, ax = plt.subplots(1,1, figsize=(27,27))
    action_pd_no_noise = pd.DataFrame(evolution_game[sortex_idx]).sort_index()
    action_pd_noise = pd.DataFrame(evolution_game_other[sortex_idx]).sort_index()

    action_pd_no_noise_complete = pd.concat([action_pd_no_noise,pd.DataFrame(columns=list(set(all_columns) - set(action_pd_no_noise.columns)))]).fillna(np.nan).sort_index()[all_columns]
    action_pd_noise_complete = pd.concat([action_pd_noise,pd.DataFrame(columns=list(set(all_columns) - set(action_pd_noise.columns)))]).fillna(np.nan).sort_index()[all_columns]
    common_nan_mask = np.isnan(action_pd_no_noise_complete.values) & np.isnan(action_pd_noise_complete.values)
    action_pd_noise_nan_mask = np.isnan(action_pd_noise_complete.values) & ~np.isnan(action_pd_no_noise_complete.values)
    action_pd_no_noise_nan_mask = np.isnan(action_pd_no_noise_complete.values) & ~np.isnan(action_pd_noise_complete.values)

    merge = pd.merge(action_pd_no_noise_complete, action_pd_noise_complete, how='outer')[all_columns]
    a = abs(merge.iloc[:3,:].to_numpy() - merge.iloc[3:,:].to_numpy())
    
    if np.any(action_pd_noise_nan_mask == True):
        reds = np.sum(action_pd_noise_nan_mask)
    else:
        reds = 0
    if np.any(action_pd_no_noise_nan_mask == True):
        blues = np.sum(action_pd_no_noise_nan_mask)
    else:
        blues = 0
    greens = np.sum(masked_data_terminal.mask)
    states = np.sum(~common_nan_mask) - reds - blues
    G = data[agent][exploration_strategy][somegrid][somebar][somenoise][someotherbar][someothernoise]["values"][sortex_idx]
    L = data[agent][exploration_strategy][somegrid][someotherbar][someothernoise][someotherbar][someothernoise]["values"][sortex_idx]
    
    return [reds, blues, states]



def nanargmax_with_default(series):
    return 0 if series.isna().all() else np.nanargmax(series)

def generate_inner_explored_states(folder, subfolder, agent, exploration_strategy, somegrid, somebar, somenoise, someotherbar, someothernoise, sortex_idx):
    
    states_distribution = {}
    if agent not in states_distribution:
        states_distribution[agent] = {}
    if exploration_strategy not in states_distribution[agent]:
        states_distribution[agent][exploration_strategy] = {}
    if somegrid not in states_distribution[agent][exploration_strategy]:
        states_distribution[agent][exploration_strategy][somegrid] = {}
    if somebar not in states_distribution[agent][exploration_strategy][somegrid]:
        states_distribution[agent][exploration_strategy][somegrid][somebar] = {}
    if somenoise not in states_distribution[agent][exploration_strategy][somegrid][somebar]:
        states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise] = {}
    if someotherbar not in states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise]:
        states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise][someotherbar] = {}
    if someothernoise not in states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise][someotherbar]:
        states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise][someotherbar][someothernoise] = {}
        
    idxs = sorted(range(len(name[agent][exploration_strategy][somegrid][somebar][somenoise][somebar][somenoise])), key=lambda x: int(name[agent][exploration_strategy][somegrid][somebar][somenoise][somebar][somenoise][x].split('_')[-2]))
    evolution_game = np.asarray(data[agent][exploration_strategy][somegrid][somebar][somenoise][somebar][somenoise]["tables"])[idxs]
    idxs_o = sorted(range(len(name[agent][exploration_strategy][somegrid][someotherbar][someothernoise][someotherbar][someothernoise])), key=lambda x: int(name[agent][exploration_strategy][somegrid][someotherbar][someothernoise][someotherbar][someothernoise][x].split('_')[-2]))
    evolution_game_other = np.asarray(data[agent][exploration_strategy][somegrid][someotherbar][someothernoise][someotherbar][someothernoise]["tables"])[idxs_o]

    action_pd_no_noise = pd.DataFrame(evolution_game[-1]).sort_index()
    action_pd_noise = pd.DataFrame(evolution_game_other[-1]).sort_index()
    all_columns = action_pd_noise.columns.intersection(action_pd_no_noise.columns)
    merge_common = pd.concat([action_pd_noise[all_columns], action_pd_no_noise[all_columns]], axis=0, keys=['action_pd_no_noise', 'action_pd_noise'])[all_columns]
    merge_common.index = merge_common.index.droplevel()
    final_column = np.argsort(merge_common.iloc[:3,:].apply(nanargmax_with_default).to_numpy() == merge_common.iloc[3:,:].apply(nanargmax_with_default).to_numpy())[::-1]
    common_nan_mask = np.isnan(merge_common.iloc[:3,:].values) & np.isnan(merge_common.iloc[3:,:].values)
    column_mask = np.all(common_nan_mask, axis=0)[final_column]
    masked_data_terminal = np.ma.masked_array(common_nan_mask, mask=np.repeat(column_mask.reshape(1,-1), 3, axis=0))
    all_columns = all_columns[final_column]
    directory_path = f"{folder}/{subfolder}"

    #for sortex_idx in range(len(data[agent][exploration_strategy][somegrid][somebar][somenoise][somebar][somenoise]["values"])):

    action_pd_no_noise = pd.DataFrame(evolution_game[sortex_idx]).sort_index()
    action_pd_noise = pd.DataFrame(evolution_game_other[sortex_idx]).sort_index()

    common_columns = action_pd_no_noise.columns.intersection(action_pd_noise.columns)
    action_pd_no_noise_common = pd.concat([action_pd_no_noise[common_columns],pd.DataFrame(columns=list(set(all_columns) - set(common_columns)))]).fillna(np.nan).sort_index()[all_columns]
    action_pd_noise_common = pd.concat([action_pd_noise[common_columns],pd.DataFrame(columns=list(set(all_columns) - set(common_columns)))]).fillna(np.nan).sort_index()[all_columns]

    merge_common = pd.concat([action_pd_no_noise_common, action_pd_noise_common], axis=0, keys=['action_pd_no_noise', 'action_pd_noise'])[all_columns]
    a = pd.DataFrame(merge_common.iloc[:3,:].apply(nanargmax_with_default).to_numpy() == merge_common.iloc[3:,:].apply(nanargmax_with_default).to_numpy(), index=all_columns).values.astype(float)
    states = a.shape[0]
    common = states - np.sum(a)
    perc_common = common/states
    G = data[agent][exploration_strategy][somegrid][somebar][somenoise][someotherbar][someothernoise]["values"][sortex_idx]
    L = data[agent][exploration_strategy][somegrid][someotherbar][someothernoise][someotherbar][someothernoise]["values"][sortex_idx]
    states_distribution[agent][exploration_strategy][somegrid][somebar][somenoise][someotherbar][someothernoise][sortex_idx] = [perc_common, L, G]     
    return [perc_common, L, G]


import pickle

# # NON SEMANTIC NOISE
# somegrid_l = ['pong-thick','pong']
# someagent_l = ['BoltzmannAgent','SarsaAgent']
# someexploration_strategy_l = ['Boltzmann','Egreedy']
# #training env
# somebar_l = ['ComputerBar_{"index":1,"prob":{}}','DirectionalComputerBar_{"index":1,"prob":0.3}','DirectionalComputerBar_{"index":1,"prob":0.6}'] 
# somenoise_l = ['{"mean":0,"std":0}','{"mean":0,"std":0}','{"mean":0,"std":0}']
# #testing env
# someotherbar_l = ['ComputerBar_{"index":1,"prob":{}}','DirectionalComputerBar_{"index":1,"prob":0.3}','DirectionalComputerBar_{"index":1,"prob":0.6}']
# someothernoise_l = ['{"mean":0,"std":0.1}','{"mean":0,"std":0.1}','{"mean":0,"std":0.1}']

# SEMANTIC NOISE
somegrid_l = ['pong-thick','pong']
someagent_l = ['BoltzmannAgent','SarsaAgent']
someexploration_strategy_l = ['Boltzmann','Egreedy']
#training env
somebar_l = ['ComputerBar_{"index":1,"prob":{}}','ComputerBar_{"index":1,"prob":{}}']
somenoise_l = ['{"mean":0,"std":0}','{"mean":0,"std":0}']
#testing env
someotherbar_l = ['DirectionalComputerBar_{"index":1,"prob":0.6}','DirectionalComputerBar_{"index":1,"prob":0.3}'] 
someothernoise_l = ['{"mean":0,"std":0}','{"mean":0,"std":0}']

for someagent in someagent_l:
    if someagent not in name:
        continue
    for someexploration_strategy in someexploration_strategy_l:
        if someexploration_strategy not in name[someagent]:
            continue
        for somegrid in somegrid_l:
            if somegrid not in name[someagent][someexploration_strategy]:
                continue
            for somebar, somenoise, someotherbar, someothernoise in zip(somebar_l, somenoise_l, someotherbar_l, someothernoise_l):
                if somebar not in name[someagent][someexploration_strategy][somegrid]:
                    continue
                if somenoise not in name[someagent][someexploration_strategy][somegrid][somebar]:
                    continue
                input_string = np.asarray(name[agent][exploration_strategy][somegrid][somebar][somenoise][somebar][somenoise])[0]
                folder = re.sub(r"_training_agent_\d+_epoch", "", input_string)
                subfolder = f"results_{somegrid}_{somebar}_{somenoise}_{someotherbar}_{someothernoise}"
                output_name = re.sub("results_","",subfolder)
                pickle_file_path = f"{folder}/{subfolder}.pkl"
                values = []
                for sortex_idx in tqdm(range(len(data[agent][exploration_strategy][somegrid][somebar][somenoise][somebar][somenoise]["values"]))):
                    a = generate_inner_explored_states(folder,subfolder,someagent, someexploration_strategy, somegrid, somebar, somenoise, someotherbar, someothernoise, sortex_idx)
                    b = generate_occupancy(folder,subfolder,agent, exploration_strategy,somegrid, somebar, somenoise, someotherbar, someothernoise, sortex_idx)
                    values.append(b + a)
                with open(pickle_file_path, 'wb') as file:
                    pickle.dump(values, file)



