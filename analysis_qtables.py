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
import pandas as pd
import json
import os
import sys

# Check if the correct number of command-line arguments is provided
if len(sys.argv) != 2:
    print("Usage: python script.py <file_path>")
    sys.exit(1)

# Extract the file path from the command-line arguments
file_path = sys.argv[1]
data = {}
name = {}
for path, directories, files in os.walk('.'):
    if f"{file_path}" in path:
        print(path)
        for file in files:
            if "_epoch" not in file:
                continue
            if "json" in file:
                agent = path.split("_")[-6]
                exploration_strategy = path.split("_")[-5]
                grid = path.split("_")[-4]
                bar = "_".join(path.split("_")[-3:-1])
                noise = "".join(path.split("_")[-1])
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
                    data[agent][exploration_strategy][grid][bar][noise] = []
                    name[agent][exploration_strategy][grid][bar][noise] = []
                with open(os.path.join(path, file)) as f:
                    #print(f"reading filename {os.path.join(path, file)}\n")
                    data[agent][exploration_strategy][grid][bar][noise].append(json.load(f))
                    train_epoch = file.split("-")[-1].replace(rf"train0_","").replace(".json","")
                    name[agent][exploration_strategy][grid][bar][noise].append("_".join(path.split("_")[-4:]) +"_"+ train_epoch)

                    n = "_".join(path.split("_")[-4:]) +"_"+ train_epoch


from matplotlib.colors import LinearSegmentedColormap
import tqdm
import os
import imageio

cmap = mpl.colormaps.get_cmap('binary')  # viridis is the default colormap for imshow

cmap.set_under(color ='blue')  # Set the color for values below vmin to blue
cmap.set_over(color ='red')
cmap.set_bad(color ='green', alpha=0.1)

def generategifs_occupancy(folder,subfolder,agent, exploration_strategy, somegrid, somebar, somenoise, someotherbar, someothernoise):
    idxs = sorted(range(len(name[agent][exploration_strategy][somegrid][somebar][somenoise])), key=lambda x: int(name[agent][exploration_strategy][somegrid][somebar][somenoise][x].split('_')[-2]))
    evolution_game = np.asarray(data[agent][exploration_strategy][somegrid][somebar][somenoise])[idxs]
    idxs_o = sorted_indices = sorted(range(len(name[agent][exploration_strategy][somegrid][someotherbar][someothernoise])), key=lambda x: int(name[agent][exploration_strategy][somegrid][someotherbar][someothernoise][x].split('_')[-2]))
    evolution_game_other = np.asarray(data[agent][exploration_strategy][somegrid][someotherbar][someothernoise])[idxs_o]
    action_pd_no_noise = pd.DataFrame(evolution_game[-1]).sort_index()
    action_pd_noise = pd.DataFrame(evolution_game_other[-1]).sort_index()
    all_columns = pd.merge(action_pd_no_noise.fillna(np.nan).astype(float), action_pd_noise.fillna(np.nan).astype(float), how="outer").columns
    action_pd_no_noise_complete = pd.concat([action_pd_no_noise,pd.DataFrame(columns=list(set(all_columns) - set(action_pd_no_noise.columns)))]).fillna(np.nan).sort_index()[all_columns]
    action_pd_noise_complete = pd.concat([action_pd_noise,pd.DataFrame(columns=list(set(all_columns) - set(action_pd_noise.columns)))]).fillna(np.nan).sort_index()[all_columns]
    common_nan_mask = np.isnan(action_pd_no_noise_complete.values) & np.isnan(action_pd_noise_complete.values)
    column_mask = np.all(common_nan_mask, axis=0)
    masked_data_terminal = np.ma.masked_array(common_nan_mask, mask=np.repeat(column_mask.reshape(1,-1), 3, axis=0))
    
    for sortex_idx in range(len(data[agent][exploration_strategy][somegrid][somebar][somenoise])):
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
        a[common_nan_mask] = 0
        min_val = np.nanmin(a) - 1
        max_val = np.nanmax(a) + 1
        if np.any(action_pd_noise_nan_mask == True):
            a[action_pd_noise_nan_mask] = np.nanmax(a) + 2
        if np.any(action_pd_no_noise_nan_mask == True):
            a[action_pd_no_noise_nan_mask] = np.nanmin(a) - 2
        # VISUALIZE TERMINAL STATES
        a[masked_data_terminal.mask] = np.nan
        plt.figure(figsize=(27, 27))

        # Plot and save the image
        plt.imshow(a, aspect="auto", cmap=cmap, vmin=min_val, vmax=max_val)
        plt.colorbar()
        
        # Create folder if it doesn't exist
        folder_path = f"{folder}/{subfolder}"
        os.makedirs(folder_path, exist_ok=True)

        # Save the figure
        plt.savefig(f"{folder}/{subfolder}/{name[agent][exploration_strategy][somegrid][somebar][somenoise][idxs[sortex_idx]]}.png")
        plt.close()

# generate GIFS
import os
import imageio

def create_gif(input_folder, output_file, file_extension=".png", duration=1.0):
    images = []

    # Get file names and sort them based on the number of epochs
    idxs = sorted(range(len(name[agent][exploration_strategy][somegrid][somebar][somenoise])), key=lambda x: int(name[agent][exploration_strategy][somegrid][somebar][somenoise][x].split('_')[-2]))
    for filename in np.asarray(name[agent][exploration_strategy][somegrid][somebar][somenoise])[idxs]:
        filepath = os.path.join(input_folder, filename + ".png")
        images.append(imageio.imread(filepath))

    # Save the images as a GIF with the specified duration
    imageio.mimsave(output_file, images, duration=duration)


# In[ ]:


# NON SEMANTIC NOISE
# #grid
# somegrid_l = ['pong-thick','pong']
# someagent_l = ['BoltzmannAgent','SarsaAgent']
# someexploration_strategy_l = ['Boltzmann','Egreedy']
# #training env
# somebar_l = ['ComputerBar_{"index":1,"prob":{}}','DirectionalComputerBar_{"index":1,"prob":0.3}','DirectionalComputerBar_{"index":1,"prob":0.6}'] 
# somenoise_l = ['{"mean":0,"std":0}','{"mean":0,"std":0}','{"mean":0,"std":0}']
# #testing env
# someotherbar_l = ['ComputerBar_{"index":1,"prob":{}}','DirectionalComputerBar_{"index":1,"prob":0.3}','DirectionalComputerBar_{"index":1,"prob":0.6}']
# someothernoise_l = ['{"mean":0,"std":0.1}','{"mean":0,"std":0.1}','{"mean":0,"std":0.1}']

# for someagent in someagent_l:
#     if someagent not in name:
#         continue
#     for someexploration_strategy in someexploration_strategy_l:
#         if someexploration_strategy not in name[someagent]:
#             continue
#         for somegrid in somegrid_l:
#             if somegrid not in name[someagent][someexploration_strategy]:
#                 continue
#             for somebar, somenoise, someotherbar, someothernoise in zip(somebar_l, somenoise_l, someotherbar_l, someothernoise_l):
#                 if somebar not in name[someagent][someexploration_strategy][somegrid]:
#                     continue
#                 if somenoise not in name[someagent][someexploration_strategy][somegrid][somebar]:
#                     continue
#                 folder = f'_trial_learnability_{someagent}_{someexploration_strategy}_' + re.sub(r"_training_agent_\d+_epoch", "", np.asarray(name[agent][exploration_strategy][somegrid][somebar][somenoise])[0])
#                 output_name = re.sub(r"_test\d+_training_agent_\d+_epoch", "", np.asarray(name[agent][exploration_strategy][somegrid][somebar][somenoise])[0])
#                 subfolder = f"union_{somegrid}_{somebar}_{somenoise}_{someotherbar}_{someothernoise}"
#                 generategifs_occupancy(folder,subfolder,agent, exploration_strategy,somegrid, somebar, somenoise, someotherbar, someothernoise)
#                 input_folder = f"{folder}/{subfolder}/"
#                 output_file = f"{folder}/{subfolder}/v.gif"
#                 create_gif(input_folder, output_file, duration=1.5)


# SEMANTIC NOISE
#grid
somegrid_l = ['pong-thick','pong'] 
someagent_l = ['BoltzmannAgent','SarsaAgent']
someexploration_strategy_l = ['Boltzmann','Egreedy']
#training env
someotherbar_l = ['DirectionalComputerBar_{"index":1,"prob":0.3}','DirectionalComputerBar_{"index":1,"prob":0.6}'] 
someothernoise_l = ['{"mean":0,"std":0}','{"mean":0,"std":0}']
#testing env
somebar_l = ['ComputerBar_{"index":1,"prob":{}}','ComputerBar_{"index":1,"prob":{}}']
somenoise_l = ['{"mean":0,"std":0}','{"mean":0,"std":0}']

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
                folder = f'_trial_learnability_{someagent}_{someexploration_strategy}_' + re.sub(r"_test\d+_training_agent_\d+_epoch", "", np.asarray(name[agent][exploration_strategy][somegrid][somebar][somenoise])[0])
                output_name = re.sub(r"_test\d+_training_agent_\d+_epoch", "", np.asarray(name[agent][exploration_strategy][somegrid][somebar][somenoise])[0])
                subfolder = f"union_{somegrid}_{somebar}_{somenoise}_{someotherbar}_{someothernoise}"
                generategifs_occupancy(folder,subfolder,agent, exploration_strategy,somegrid, somebar, somenoise, someotherbar, someothernoise)
                input_folder = f"{folder}/{subfolder}/"
                output_file = f"{folder}/{subfolder}/{output_name}.gif"
                create_gif(input_folder, output_file, duration=1.5)



# # generate GIFS
# import os
# import imageio

# def create_gif(input_folder, output_file, file_extension=".png", duration=1.0):
#     images = []

#     # Get file names and sort them based on the number of epochs
#     idxs = sorted(range(len(name[agent][exploration_strategy][somegrid][somebar][somenoise])), key=lambda x: int(name[agent][exploration_strategy][somegrid][somebar][somenoise][x].split('_')[-2]))
#     for filename in np.asarray(name[agent][exploration_strategy][somegrid][somebar][somenoise])[idxs]:
#         filepath = os.path.join(input_folder, filename + ".png")
#         images.append(imageio.imread(filepath))

#     # Save the images as a GIF with the specified duration
#     imageio.mimsave(output_file, images, duration=duration)
# def nanargmax_with_default(series):
#     return 0 if series.isna().all() else np.nanargmax(series)



# import tqdm
# import os
# import imageio
# import shutil

# cmap = mpl.colormaps.get_cmap('binary_r')  # viridis is the default colormap for imshow
# cmap.set_bad(color ='red', alpha=0.1)


# def generate_gifs_inner_explored_states(folder, subfolder, agent, exploration_strategy, somegrid, somebar, somenoise, someotherbar_l, someothernoise):
#     print(somegrid, somebar, somenoise)
#     print(f"len: {len(data[agent][exploration_strategy][somegrid][somebar][somenoise])}")
#     idxs = sorted(range(len(name[agent][exploration_strategy][somegrid][somebar][somenoise])), key=lambda x: int(name[agent][exploration_strategy][somegrid][somebar][somenoise][x].split('_')[-2]))
#     evolution_game = np.asarray(data[agent][exploration_strategy][somegrid][somebar][somenoise])[idxs]
#     idxs_o = sorted_indices = sorted(range(len(name[agent][exploration_strategy][somegrid][someotherbar_l][someothernoise])), key=lambda x: int(name[agent][exploration_strategy][somegrid][someotherbar_l][someothernoise][x].split('_')[-2]))
#     evolution_game_other = np.asarray(data[agent][exploration_strategy][somegrid][someotherbar_l][someothernoise])[idxs_o]

#     action_pd_no_noise = pd.DataFrame(evolution_game[-1]).sort_index()
#     action_pd_noise = pd.DataFrame(evolution_game_other[-1]).sort_index()
#     all_columns = action_pd_noise.columns.intersection(action_pd_no_noise.columns)
#     merge_common = pd.concat([action_pd_noise[all_columns], action_pd_no_noise[all_columns]], axis=0, keys=['action_pd_no_noise', 'action_pd_noise'])[all_columns]
#     merge_common.index = merge_common.index.droplevel()
#     final_column = np.argsort(merge_common.iloc[:3,:].apply(nanargmax_with_default).to_numpy() == merge_common.iloc[3:,:].apply(nanargmax_with_default).to_numpy())[::-1]
#     common_nan_mask = np.isnan(merge_common.iloc[:3,:].values) & np.isnan(merge_common.iloc[3:,:].values)
#     column_mask = np.all(common_nan_mask, axis=0)[final_column]
#     masked_data_terminal = np.ma.masked_array(common_nan_mask, mask=np.repeat(column_mask.reshape(1,-1), 3, axis=0))
#     all_columns = all_columns[final_column]
#     directory_path = f"{folder}/{subfolder}"

#     if not os.path.exists(directory_path):
#         os.makedirs(directory_path)
#     else:
#         print(f"Found preexisting {directory_path}. Removing...")
#         shutil.rmtree(directory_path)
#         os.makedirs(directory_path)

#     for sortex_idx in range(len(data[agent][exploration_strategy][somegrid][somebar][somenoise])):

#         action_pd_no_noise = pd.DataFrame(evolution_game[sortex_idx]).sort_index()
#         action_pd_noise = pd.DataFrame(evolution_game_other[sortex_idx]).sort_index()

#         common_columns = action_pd_no_noise.columns.intersection(action_pd_noise.columns)
#         action_pd_no_noise_common = pd.concat([action_pd_no_noise[common_columns],pd.DataFrame(columns=list(set(all_columns) - set(common_columns)))]).fillna(np.nan).sort_index()[all_columns]
#         action_pd_noise_common = pd.concat([action_pd_noise[common_columns],pd.DataFrame(columns=list(set(all_columns) - set(common_columns)))]).fillna(np.nan).sort_index()[all_columns]

#         merge_common = pd.concat([action_pd_no_noise_common, action_pd_noise_common], axis=0, keys=['action_pd_no_noise', 'action_pd_noise'])[all_columns]
#         a = pd.DataFrame(merge_common.iloc[:3,:].apply(nanargmax_with_default).to_numpy() == merge_common.iloc[3:,:].apply(nanargmax_with_default).to_numpy(), index=all_columns).values.astype(float)
#         a[column_mask] = np.nan
#         plt.imshow(a.T, aspect="auto", cmap=cmap)
#         plt.colorbar()
#         plt.savefig(f"{folder}/{subfolder}/{name[agent][exploration_strategy][somegrid][somebar][somenoise][idxs[sortex_idx]]}.png")
#         plt.show()



# # NON SEMANTIC NOISE
# #grid
# somegrid_l = ['pong-thick','pong']
# someagent_l = ['BoltzmannAgent','SarsaAgent']
# someexploration_strategy_l = ['Boltzmann','Egreedy']
# #training env
# somebar_l = ['ComputerBar_{"index":1,"prob":{}}','DirectionalComputerBar_{"index":1,"prob":0.3}','DirectionalComputerBar_{"index":1,"prob":0.6}'] 
# somenoise_l = ['{"mean":0,"std":0}','{"mean":0,"std":0}','{"mean":0,"std":0}']
# #testing env
# someotherbar_l = ['ComputerBar_{"index":1,"prob":{}}','DirectionalComputerBar_{"index":1,"prob":0.3}','DirectionalComputerBar_{"index":1,"prob":0.6}']
# someothernoise_l = ['{"mean":0,"std":0.1}','{"mean":0,"std":0.1}','{"mean":0,"std":0.1}']

# for someagent in someagent_l:
#     if someagent not in name:
#         continue
#     for someexploration_strategy in someexploration_strategy_l:
#         if someexploration_strategy not in name[someagent]:
#             continue
#         for somegrid in somegrid_l:
#             if somegrid not in name[someagent][someexploration_strategy]:
#                 continue
#             for somebar, somenoise, someotherbar, someothernoise in zip(somebar_l, somenoise_l, someotherbar_l, someothernoise_l):
#                 if somebar not in name[someagent][someexploration_strategy][somegrid]:
#                     continue
#                 if somenoise not in name[someagent][someexploration_strategy][somegrid][somebar]:
#                     continue
#                 print(f"Generating gifs for {somegrid}, {somebar}, {somenoise}, {someotherbar_l}, {someothernoise}")
#                 folder = f'_trial_learnability_{someagent}_{someexploration_strategy}_' + re.sub(r"_test\d+_training_agent_\d+_epoch", "", np.asarray(name[agent][exploration_strategy][somegrid][somebar][somenoise])[0])
#                 subfolder = f"common_{somegrid}_{somebar}_{somenoise}_{someotherbar_l}_{someothernoise}"
#                 print(f"folder: {folder}")
#                 generate_gifs_inner_explored_states(folder,subfolder,someagent, someexploration_strategy, somegrid, somebar, somenoise, someotherbar_l, someothernoise)
#                 input_folder = f"{folder}/{subfolder}/"
#                 output_file = f"{folder}/{subfolder}/{subfolder}.gif"
#                 create_gif(input_folder, output_file, duration=1.5)


# # SEMANTIC NOISE
# #grid
# somegrid_l = ['pong-thick','pong'] 
# someagent_l = ['BoltzmannAgent','SarsaAgent']
# someexploration_strategy_l = ['Boltzmann','Egreedy']
# #training env
# somebar_l = ['DirectionalComputerBar_{"index":1,"prob":0.3}','DirectionalComputerBar_{"index":1,"prob":0.6}'] 
# somenoise_l = ['{"mean":0,"std":0}','{"mean":0,"std":0}']
# #testing env
# someotherbar_l = ['ComputerBar_{"index":1,"prob":{}}','ComputerBar_{"index":1,"prob":{}}']
# someothernoise_l = ['{"mean":0,"std":0}','{"mean":0,"std":0}']

# for someagent in someagent_l:
#     if someagent not in name:
#         continue
#     for someexploration_strategy in someexploration_strategy_l:
#         if someexploration_strategy not in name[someagent]:
#             continue
#         for somegrid in somegrid_l:
#             if somegrid not in name[someagent][someexploration_strategy]:
#                 continue
#             for somebar, somenoise, someotherbar, someothernoise in zip(somebar_l, somenoise_l, someotherbar_l, someothernoise_l):
#                 if somebar not in name[someagent][someexploration_strategy][somegrid]:
#                     continue
#                 if somenoise not in name[someagent][someexploration_strategy][somegrid][somebar]:
#                     continue
#         print(f"Generating gifs for {somegrid}, {somebar}, {somenoise}, {someotherbar}, {someothernoise}")
#         folder = '_trial_learnability_BoltzmannAgent_' + re.sub(r"_test\d+_training_agent_\d+_epoch", "", np.asarray(name[somegrid][somebar][somenoise])[0])
#         subfolder = f"common_{somegrid}_{somebar}_{somenoise}_{someotherbar}_{someothernoise}"
#         print(f"folder: {folder}")
#         generate_gifs_inner_explored_states(folder,subfolder,somegrid, somebar, somenoise, someotherbar, someothernoise)
#         input_folder = f"{folder}/{subfolder}/"
#         output_file = f"{folder}/{subfolder}/{subfolder}.gif"
#         create_gif(input_folder, output_file, duration=1.5)





