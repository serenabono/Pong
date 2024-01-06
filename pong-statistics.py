# bar.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
#
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
Pacman.py holds the logic for the classic bar game along with the main
code to run a game.  This file is divided into three sections:

  (i)  Your interface to the bar world:
          Pacman is a complex environment.  You probably don't want to
          read through all of the code we wrote to make the game runs
          correctly.  This section contains the parts of the code
          that you will need to understand in order to complete the
          project.  There is also some code in game.py that you should
          understand.

  (ii)  The hidden secrets of bar:
          This section contains all of the logic code that the bar
          environment uses to decide who can move where, who dies when
          things collide, etc.  You shouldn't need to read this section
          of code, but you can if you want.
defineTransitionMatrix
  (iii) Framework to start a game:
          The final section contains the code for reading the command
          you use to set up the game, then starting up a new game, along with
          linking in all the external parts (agent functions, graphics).
          Check this section out to see all the options available to you.

To play your first game, type 'python bar.py' from the command line.
The keys are 'a', 's', 'd', and 'w' to move (or arrow keys).  Have fun!
"""

"""
to run this file: 
python runStatistics.py -m s -p BoltzmannAgent -l v3 -s '{"epochs":100,"trained_agents":2,"n_training_steps":10,"n_testing_steps":10,"timeout":30}' -t "saved_agent.pkl" -n '{"semanticDistribution":"DistributedNoise","noiseType":"GaussianNoise","noiseArgs":{"mean":0,"std":1,"scale":0.1}}'
"""




import pongLayout
import sys
import random
import os
from QLearningAgent import *
from search import *
from pongTransitionFunction import *
from pong import PongClassicGameRules
import json

def default(str):
    return str + ' [Default: %default]'

def parseAgentArgs(str):
    if str == None:
        return {}
    pieces = str.split(',')
    opts = {}
    for p in pieces:
        if '=' in p:
            key, val = p.split('=')
        else:
            key, val = p, 1
        opts[key] = val
    return opts

def defineBars(agentOpts, barName):

    agentType = loadAgent(barName, 1)
    bar = agentType(agentOpts["bar"])  # Instantiate bar with agentArgs
    computerBarType = getattr(__import__("pong"), agentOpts["computer_bar"]["name"])
    computer_bar = computerBarType(prob=agentOpts["computer_bar"]["args"]["prob"], index=agentOpts["computer_bar"]["args"]["index"]) 

    return bar, computer_bar

def readCommand(argv):
    """
    Processes the command used to run bar from the command line.
    """
    from optparse import OptionParser
    usageStr = """
    USAGE:      python bar.py <options>
    EXAMPLES:   (1) python bar.py
                    - starts an interactive game
                (2) python bar.py --layout smallClassic --zoom 2
                OR  python bar.py -l smallClassic -z 2
                    - starts an interactive game on a smaller board, zoomed in
    """
    parser = OptionParser(usageStr)
    parser.add_option('-m', '--mode', dest='mode',
                      help=default(
                          'type of statistics you want to run (s, e, g, t)'),
                      default='s')
    parser.add_option('-l', '--layout', dest='layout',
                      help=default(
                          'the LAYOUT_FILE from which to load the map layout'),
                      metavar='LAYOUT_FILE', default='mediumClassic')
    parser.add_option('-b', '--bar', dest='bar',
                      help=default(
                          'the agent TYPE in the barAgents module to use'),
                      metavar='TYPE', default='KeyboardAgent')
    parser.add_option('-g', '--computerBar', dest='computerBar',
                      help=default(
                          'the ghost agent TYPE in the ghostAgents module to use'),
                      metavar='TYPE', default='ComputerBar')
    parser.add_option('-k', '--numball', type='int', dest='numGhosts',
                      help=default('The maximum number of ball to use'), default=4)
    parser.add_option('-z', '--zoom', type='float', dest='zoom',
                      help=default('Zoom the size of the graphics window'), default=1.0)
    parser.add_option('-q', '--quietTextGraphics', action='store_true', dest='quietGraphics',
                      help='Generate minimal output and no graphics', default=False)
    parser.add_option('-f', '--fixRandomSeed', action='store_true', dest='fixRandomSeed',
                      help='Fixes the random seed to always play the same game', default=False)
    parser.add_option('-a', '--agentArgs', dest='agentArgs',
                      help='Comma separated values sent to agent. e.g. "opt1=val1,opt2,opt3=val3"')
    parser.add_option('--timeout', dest='timeout', type='int',
                      help=default('Maximum length of time an agent can spend computing in a single game'), default=30)
    parser.add_option('-s', '--statArgs', dest='statArgs',
                      help='Comma separated values sent to stat. e.g. "opt1=val1,opt2,opt3=val3"')
    parser.add_option('-c', '--swapsArg', dest='swapsArg',
                      help='Comma separated values sent to stat. e.g. "opt1=val1,opt2,opt3=val3"')
    parser.add_option('-t', '--pretrainedAgent', dest='pretrainedAgent', help=default('The pre-trained barAgents module to use'),
                      metavar='TYPE', default=None)
    parser.add_option('-o', '--outputStats', dest='outputStats', help=default('Output file to save stats'),
                      metavar='TYPE', default='saved_agent.pkl')
    parser.add_option('-d', '--savedfFolder', dest='savedfFolder', help=default('Output file to save stats'),
                      metavar='TYPE', default='.')
    parser.add_option('-x', '--numTraining', dest='numTraining', type='int',
                      help=default('How many episodes are training (suppresses output)'), default=0)
    parser.add_option('--frameTime', dest='frameTime', type='float',
                      help=default('Time to delay between frames; <0 means keyboard'), default=0.1)

    options, otherjunk = parser.parse_args(argv)
    if len(otherjunk) != 0:
        raise Exception('Command line input not understood: ' + str(otherjunk))
    args = dict()

    # Fix the random seed
    if options.fixRandomSeed:
        random.seed('cs188')

    # Choose a layout
    args['layout'] = pongLayout.getLayout(options.layout)
    if args['layout'] == None:
        raise Exception("The layout " + options.layout + " cannot be found")

    # Choose a Pacman agent
    agentOpts = json.loads(options.agentArgs)

    try:
        agentOpts = json.loads(options.agentArgs)
    except:
        agentOpts = {}
    try:
        args['statOpts'] = json.loads(options.statArgs)
    except:
        args['statOpts'] = {}

    args["bars"] = {}
    args["perturbOpts"] = {}

    testingenv_bar, testingenv_computer_bar = defineBars(agentOpts["test"], options.bar)
    args["bars"]["test"] = {}
    args["bars"]["test"]["bar"] = testingenv_bar
    args["bars"]["test"]["computerbar"] = testingenv_computer_bar
    args["perturbOpts"]["test"] = agentOpts["test"]["perturb"]

    if "ensemble" in agentOpts:
        ensembleenv_bar, ensembleenv_computer_bar = defineBars(agentOpts["ensemble"], options.bar)
        args["bars"]["ensemble"] = {}
        args["bars"]["ensemble"]["bar"] = ensembleenv_bar
        args["bars"]["ensemble"]["computerbar"] = ensembleenv_computer_bar
        args["perturbOpts"]["ensemble"] = agentOpts["ensemble"]["perturb"]
    
    # Don't display training games
    if 'numTrain' in agentOpts:
        options.numQuiet = int(agentOpts['numTrain'])
        options.numIgnore = int(agentOpts['numTrain'])

    if 'savedFolder' in agentOpts:
        args['savedFolder'] = options.savedFolder

    # Choose a ghost agent
    # Choose a ball agent
    ballType = getattr(__import__("pong"), 'Ball')
    args['ball'] = ballType(2) 


    args['timeout'] = options.timeout
    args['agentOpts'] = agentOpts
    args['barAgentName'] = options.bar
    args['pretrainedAgentName'] = options.pretrainedAgent
    args['outputStats'] = options.outputStats
    args['swapsArg'] = options.swapsArg
    args['display'] = None

    args['mode'] = options.mode

    return args

# testing envs NON SEMANTIC
GENERALIZATION_WORLDS = [{"bar":{},"computer_bar":{"name":"ComputerBar","args":
                        {"index":1,"prob":{}}},"perturb":{"noise":{"mean":0,"std":0.1},"perm":{}}}, {"bar":{},"computer_bar":{"name":"ComputerBar","args":
                        {"index":1,"prob":{}}},"perturb":{"noise":{"mean":0,"std":0.5},"perm":{}}}]

# testing envs SEMANTIC
#GENERALIZATION_WORLDS = [{"bar":{},"computer_bar":{"name":"ComputerBar","args":{"index":1,"prob":{}}},"perturb":{"noise":{"mean":0,"std":0},"perm":{}}}]


def saveRecordings(tree, game, layout, filepath):
    import time
    import pickle
    fname = filepath
    f = open(fname, 'wb')
    components = {'layout': layout, 'actions': game.moveHistory}
    pickle.dump(components, f)
    f.close()


def saveHeatMap(tree, game, layout, filepath):
    import time
    import pickle
    fname = filepath
    f = open(fname, 'wb')
    components = {'heatmap': tree.generateHeatMapAgent(
        layout, game.moveHistory, 0)}
    pickle.dump(components, f)
    f.close()


def loadAgent(bar, nographics):
    # Looks through all pythonPath Directories for the right module,
    pythonPathStr = os.path.expandvars("$PYTHONPATH")
    if pythonPathStr.find(';') == -1:
        pythonPathDirs = pythonPathStr.split(':')
    else:
        pythonPathDirs = pythonPathStr.split(';')
    pythonPathDirs.append('.')

    for moduleDir in pythonPathDirs:
        if not os.path.isdir(moduleDir):
            continue
        moduleNames = [f for f in os.listdir(
            moduleDir) if f.endswith('gents.py')]
        for modulename in moduleNames:
            try:
                module = __import__(modulename[:-3])
            except ImportError:
                continue
            if bar in dir(module):
                if nographics and modulename == 'keyboardAgents.py':
                    raise Exception(
                        'Using the keyboard requires graphics (not text display)')
                return getattr(module, bar)
    raise Exception('The agent ' + bar +
                    ' is not specified in any *Agents.py.')


def train_epoch(transitionMatrixTree, n_training_steps, rules, bars, ball, layout, gameDisplay):

    bar = bars[0]

    for i in range(n_training_steps):
        game = rules.newGame(layout, bars, ball,
                             None, 1, catchExceptions=False)
        transitionMatrixTree.state = game.state
        game.transitionFunctionTree = transitionMatrixTree.copy()
        if 'Boltzmann' in bar.__class__.__name__:
            bar.agent.set_trainable(trainable=True)
        elif 'PacmanDQN' in bar.__class__.__name__:
            bar.set_trainable(trainable=True)
        game.run(i, n_training_steps)


def test_epoch(transitionMatrixTree, n_testing_steps, rules, bars, ball, layout, gameDisplay, ensemble_agent=None, record=None):
    scores = []
    bar = bars[0]

    for i in range(n_testing_steps):
        game = rules.newGame(layout, bars, ball,
                             gameDisplay, 1)
        transitionMatrixTree.state = game.state
        game.transitionFunctionTree = transitionMatrixTree.copy()
        if 'Boltzmann' in bar.__class__.__name__:
            bar.agent.set_trainable(trainable=False)
        elif 'PacmanDQN' in bar.__class__.__name__:
            bar.set_trainable(trainable=False)
        
        game.run(i, n_testing_steps, ensemble_agent = ensemble_agent)
        scores.append(game.state.getScore())
    

    return np.asarray(scores)

def test_noisy_agents_epoch(transitionMatrixTreeList, n_testing_steps, rules, bars, ball, layout, gameDisplay, record=None):

    across_agents_scores = []
    bar = bars[0]

    for n in range(len(GENERALIZATION_WORLDS)):
        scores = []
        for i in range(n_testing_steps):
            game = rules.newGame(layout, bars, ball,
                                 gameDisplay, 1)
            transitionMatrixTreeList[n].state = game.state
            game.transitionFunctionTree = transitionMatrixTreeList[n].copy()

            if 'Boltzmann' in bar.__class__.__name__:
                bar.agent.set_trainable(trainable=False)
            elif 'PacmanDQN' in bar.__class__.__name__:
                bar.set_trainable(trainable=False)

            game.run(i, n_testing_steps)
            scores.append(game.state.getScore())

            if record:
                saveRecordings(transitionMatrixTree, game,
                               layout, record + f"-{i}_round.pkl")

        across_agents_scores.append(np.asarray(scores))

    return across_agents_scores


def defineTransitionMatrix(bars, ball, layout, file_to_be_loaded=None, file_to_be_saved=None, applyperturb=None):
    # define transition function

    bar=bars[0]

    if bar.__class__.__name__ == "BoltzmannAgent":
        # semanticDistribution, noiseType, noiseArgs
        try:
            if file_to_be_loaded:
                loaded_agent = pickle.load(open(file_to_be_loaded, "rb"))
                bar.agent.__class__ = loaded_agent.__class__
                bar.agent.__dict__ = loaded_agent.__dict__
                # set not trainable
                bar.set_trainable(False)
        except:
            print("impossible to load file: " + file_to_be_loaded)
            print("starting a new agent from scratch ...")
    elif bar.__class__.__name__ == 'PacmanDQN':
        try:
            if file_to_be_loaded:
                bar.params["load_file"] = file_to_be_loaded
                bar.params["save_file"] = file_to_be_saved
                # set not trainable
                bar.agent.set_trainable(False)
        except:
            print("impossible to load file: " + file_to_be_loaded)
            print("starting a new agent from scratch ...")

    # only gaussian supported for now    
    if applyperturb["perm"] != {}:
        transitionMatrixTree = TransitionMatrixDicTree(bars, ball, layout, swaps=float(applyperturb["perm"]))
    if applyperturb["noise"] != {}:
        transitionMatrixTree = TransitionMatrixDicTree(bars, ball, layout, noise=applyperturb["noise"])
    else:
        transitionMatrixTree = TransitionMatrixDicTree(bars, ball, layout)

    transitionMatrixTree.computeProbabilities()

    return transitionMatrixTree


def runStatistics(bar, barName, barArgs, ball, layout, display, file_to_be_loaded=None, applyperturb=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = PongClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_training_steps], dtype=np.float32)

    for i in range(trained_agents):
        transitionMatrixTreeList = []
        transitionMatrixTreeList.append(defineTransitionMatrix(
            bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=None))
        transitionMatrixTreeList.append(defineTransitionMatrix(
            bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=applyperturb))

        for j in range(epochs // n_training_steps):

            if record_range and j >= record_range["min_range"] and j < record_range["max_range"]:
                recordpath = args['outputStats'] + \
                    "-learnability-RECORDING-" + f"{j}_epoch"
            else:
                recordpath = None

            if (j * n_training_steps) < run_untill:
                transitionMatrixTree = transitionMatrixTreeList[1]
            else:
                transitionMatrixTree = transitionMatrixTreeList[0]

            print(j)
            if bar.__class__.__name__ != "KeyboardAgent":
                train_epoch(transitionMatrixTree, n_training_steps,
                            rules, bar, ball, layout, display)
            score = np.mean(test_epoch(
                transitionMatrixTreeList[0], n_testing_steps, rules, bar, ball, layout, display, record=recordpath))
            stats[i][j] = score
        print('trained agent ', i)
        print('Scores:       ', ', '.join([str(score) for score in stats[i]]))

        if not os.path.exists(args['outputStats'].split('/')[0]):
            os.makedirs(args['outputStats'].split('/')[0])
        np.savetxt(args['outputStats'] +
                   f"{i}_training_agent.pkl", stats[i],  delimiter=',')

        #   reinitialize bar
        if bar.__class__.__name__ == "KeyboardAgent":
            barType = loadAgent(barName, 0)
        else:
            barType = loadAgent(barName, 1)
        bar[0] = barType(barArgs)

    return np.mean(stats, 0)


def runLearnability(bars, barName, barArgs, ball, layout, display, file_to_be_loaded=None, applyperturb=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = PongClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_training_steps], dtype=np.float32)
    
    if not os.path.exists(args['outputStats'].split('/')[0]):
        os.makedirs(args['outputStats'].split('/')[0])
    # only the agent operated bar

    for i in range(trained_agents):
        transitionMatrixTree = defineTransitionMatrix(
                [bars["test"]["bar"],bars["test"]["computerbar"]] , ball, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=applyperturb["test"])

        for j in range(epochs // n_training_steps):
            print(j)
            train_epoch(transitionMatrixTree, n_training_steps,
                            rules, [bars["test"]["bar"],bars["test"]["computerbar"]] , ball, layout, display)
            score = np.mean(test_epoch(
                transitionMatrixTree, n_testing_steps, rules, [bars["test"]["bar"],bars["test"]["computerbar"]] , ball, layout, display))
            stats[i][j] = score
            
            # with open(args['outputStats'] +
            #    f"{i}_training_agent_{j}_epoch.json", 'w') as f:
            #    json.dump(bars["test"]["bar"].agent.q_values, f)
        
        print('trained agent ', i)
        print('Scores:       ', ', '.join([str(score) for score in stats[i]]))

        if not os.path.exists(args['outputStats'].split('/')[0]):
            os.makedirs(args['outputStats'].split('/')[0])
        np.savetxt(args['outputStats'] +
                   f"{i}_training_agent.pkl", stats[i],  delimiter=',')
            
        barType = loadAgent(barName, 1)
        bars["test"]["bar"] = barType(barArgs)

    return np.mean(stats, 0)

def runEnsembleAgents(bars, barName, barArgs, ball, layout, display, file_to_be_loaded=None, applyperturb=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = PongClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_training_steps], dtype=np.float32)
    
    bar = bars["test"]["bar"] 
    computer_bar = bars["test"]["computerbar"]
    perturbedenv_bar = bars["ensemble"]["bar"]
    perturbedenv_computer_bar = bars["ensemble"]["computerbar"]

    for i in range(trained_agents):

        transitionMatrixTreeList = {}
        # normal environment agent
        transitionMatrixTree = defineTransitionMatrix(
                [bar, computer_bar], ball, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=applyperturb["test"])
        transitionMatrixTreeList["test"] = transitionMatrixTree
        
        transitionMatrixTree = defineTransitionMatrix(
                [perturbedenv_bar, perturbedenv_computer_bar], ball, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=applyperturb["ensemble"])
        transitionMatrixTreeList["ensemble"] = transitionMatrixTree
        
        for j in range(epochs // n_training_steps):
            print(j)
            if bar.__class__.__name__ != "KeyboardAgent":
                train_epoch(transitionMatrixTreeList["test"], n_training_steps,
                            rules, [bar, computer_bar], ball, layout, display)
                train_epoch(transitionMatrixTreeList["ensemble"], n_training_steps,
                            rules, [perturbedenv_bar, perturbedenv_computer_bar], ball, layout, display)
            score = np.mean(test_epoch(
                transitionMatrixTreeList["test"], n_testing_steps, rules, [bar, computer_bar], ball, layout, display, ensemble_agent=perturbedenv_bar))
            stats[i][j] = score
        print('trained agent ', i)
        print('Scores:       ', ', '.join([str(score) for score in stats[i]]))

        if not os.path.exists(args['outputStats'].split('/')[0]):
            os.makedirs(args['outputStats'].split('/')[0])
        np.savetxt(args['outputStats'] +
                   f"{i}_training_agent.pkl", stats[i],  delimiter=',')

        # reinitialize agents
        perturbedenv_barType = loadAgent(barName, 1) 
        perturbedenv_bar = perturbedenv_barType(barArgs)
        barType = loadAgent(barName, 1) 
        bar = barType(barArgs)

    return np.mean(stats, 0)


def runGeneralization(bars, barName, barArgs, ball, layout, display, file_to_be_loaded=None, applyperturb=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = PongClassicGameRules(timeout)
    
    stats = np.zeros(
        [trained_agents, len(GENERALIZATION_WORLDS), epochs // n_training_steps], dtype=np.float32)
    
    if not os.path.exists(args['outputStats'].split('/')[0]):
        os.makedirs(args['outputStats'].split('/')[0])

    for i in range(trained_agents):
        transitionMatrixTreeList = []
        transitionMatrixTree = defineTransitionMatrix(
                [bars["test"]["bar"], bars["test"]["computerbar"]], ball, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=applyperturb["test"])
        transitionMatrixTreeList.append(transitionMatrixTree)
        if applyperturb:
            print("adding noise...")
            for n in range(len(GENERALIZATION_WORLDS)):
                print(GENERALIZATION_WORLDS[n])
                barType = loadAgent(barName, 1)
                newworld_bar, newworld_computerbar = defineBars(GENERALIZATION_WORLDS[n], barName)
                transitionMatrixTreeList.append(defineTransitionMatrix(
                    [newworld_bar, newworld_computerbar], ball, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=GENERALIZATION_WORLDS[n]["perturb"]))

        for j in range(epochs // n_training_steps):

            print(j)
            train_epoch(transitionMatrixTreeList[0], n_training_steps,
                            rules,  [bars["test"]["bar"], bars["test"]["computerbar"]], ball, layout, display)
            
            # with open(args['outputStats'] +
            #        f"{i}_training_agent_{j}_epoch.json", 'w') as f:
            #     json.dump(bars["test"]["bar"].agent.q_values, f)

            scores = test_noisy_agents_epoch(
                transitionMatrixTreeList[1:], n_testing_steps, rules, [bars["test"]["bar"], bars["test"]["computerbar"]], ball, layout, display)
            for k in range(len(scores)):
                stats[i][k][j] = np.mean(scores[k])

        print('trained agent ', i)
        print('Scores:       ', ', '.join([str(score) for score in stats[i]]))


        for k in range(len(GENERALIZATION_WORLDS)):
            if not os.path.exists(args['outputStats'].split('/')[0]):
                os.makedirs(args['outputStats'].split('/')[0])
            np.savetxt(args['outputStats'] + f'_{GENERALIZATION_WORLDS[k]["computer_bar"]["name"]}_' 
            + f'{GENERALIZATION_WORLDS[k]["computer_bar"]["args"]}_' + f'{GENERALIZATION_WORLDS[k]["perturb"]["noise"]}_end_' 
            + f"{i}_training_agent.pkl", stats[i][k],  delimiter=',')

        barType = loadAgent(barName, 1)
        bars["test"]["bar"] = barType(barArgs)
        

    return np.mean(stats, 0)

CURRICULUM_NOISE = [{"noise":{"mean":0, "std":0}, "epochs": 650}]
CURRICULUM_SWAPS = [{"swaps":0, "epochs": 200}]


def newTrainingMethod(bar, barName, barArgs, ball, layout, display, file_to_be_loaded=None, applyperturb=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = PongClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_training_steps], dtype=np.float32)

    for i in range(trained_agents):
        transitionMatrixTreeList = []
        current_list = []

        if applyperturb:
            print("adding noise...")
            current_list = CURRICULUM_NOISE.copy()
            for n in CURRICULUM_NOISE:
                transitionMatrixTreeList.append(defineTransitionMatrix(
                    bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=n["noise"]))
            transitionMatrixTreeList.append(defineTransitionMatrix(
                    bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=applyperturb))
            current_list.append({"noise":applyperturb, "epochs":epochs})
        if applyswaps: 
            print("adding permutations...")   
            current_list = CURRICULUM_SWAPS.copy()
            for n in CURRICULUM_SWAPS:
                transitionMatrixTreeList.append(defineTransitionMatrix(
                    bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applyswaps=n["swaps"]))
            transitionMatrixTreeList.append(defineTransitionMatrix(
                    bar, ball, layout, file_to_be_loaded=file_to_be_loaded))
            current_list.append({"swaps":applyswaps, "epochs":epochs})
        
        current_transition_fn = transitionMatrixTreeList[0]
        current_transition_fn_id = 0

        for j in range(epochs // n_training_steps):

            if record_range and j >= record_range["min_range"] and j < record_range["max_range"]:
                recordpath = args['outputStats'] + \
                    "-generalization-RECORDING-" + f"{j}_epoch"
            else:
                recordpath = None

            print(j)
            if bar.__class__.__name__ != "KeyboardAgent":
                if (j*n_testing_steps) >= current_list[current_transition_fn_id]["epochs"]:
                    current_transition_fn_id+=1
                    current_transition_fn=transitionMatrixTreeList[current_transition_fn_id]
                
                train_epoch(current_transition_fn, n_training_steps,
                            rules, bar, ball, layout, display)
                        
            score = np.mean(test_epoch(
                transitionMatrixTreeList[-1], n_testing_steps, rules, bar, ball, layout, display))
            stats[i][j] = score
        print('trained agent ', i)
        print('Scores:       ', ', '.join([str(score) for score in stats[i]]))

        if not os.path.exists(args['outputStats'].split('/')[0]):
            os.makedirs(args['outputStats'].split('/')[0])
        np.savetxt(args['outputStats'] +
                   f"{i}_training_agent.pkl", stats[i],  delimiter=',')


        #   reinitialize bar
        if bar.__class__.__name__ == "KeyboardAgent":
            barType = loadAgent(barName, 0)
        else:
            barType = loadAgent(barName, 1)
        bar[0] = barType(barArgs)

    return np.mean(stats, 0) 

if __name__ == '__main__':
    """
    The main function called when bar.py is run
    from the command line:

    > python bar.py

    See the usage string for more details.

    > python bar.py --help
    """
    args = readCommand(sys.argv[1:])  # Get game components based on input
    if args['mode'] == 'l':
        output = runLearnability(args['bars'], args['barAgentName'], args['agentOpts'],
                                 args['ball'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applyperturb=args['perturbOpts'], **args['statOpts'])
        # np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 's':
        output = runStatistics(args['bars'], args['barAgentName'], args['agentOpts'],
                               args['ball'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applyperturb=args['perturbOpts'], **args['statOpts'])
        # np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 'm':
        output = newTrainingMethod(args['bars'], args['barAgentName'], args['agentOpts'],
                               args['ball'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applyperturb=args['perturbOpts'], **args['statOpts'])
        # np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 'e':
        output = runEnsembleAgents(args['bars'], args['barAgentName'], args['agentOpts'],
                               args['ball'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applyperturb=args['perturbOpts'], **args['statOpts'])
        # np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 'g':
        output = runGeneralization(args['bars'], args['barAgentName'], args['agentOpts'],
                                  args['ball'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applyperturb=args['perturbOpts'], **args['statOpts'])
        # for n in range(len(GENERALIZATION_WORLDS)):
        #     np.savetxt(args['outputStats'] +
        #                f"_{GENERALIZATION_WORLDS[n]}"+".pkl", output[n],  delimiter=',')

    pass
