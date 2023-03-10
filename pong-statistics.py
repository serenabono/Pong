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




import breakoutLayout
import sys
import random
import os
from QLearningAgent import *
from search import *
from breakoutTransitionFunction import *
from breakout import BreakoutClassicGameRules
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
    parser.add_option('-g', '--ball', dest='ball',
                      help=default(
                          'the ghost agent TYPE in the ghostAgents module to use'),
                      metavar='TYPE', default='RandomGhost')
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
    parser.add_option('-n', '--noiseArgs', dest='noiseArgs',
                      help='Comma separated values sent to noise. e.g. "opt1=val1,opt2,opt3=val3,noise=\{arg1=val1,arg2=val2\}"')
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
    args['layout'] = breakoutLayout.getLayout(options.layout)
    if args['layout'] == None:
        raise Exception("The layout " + options.layout + " cannot be found")

    # Choose a Pacman agent
    
    barName = options.bar
    agentType = loadAgent(barName, 1)
    agentOpts = parseAgentArgs(options.agentArgs)

    try:
        agentOpts = json.loads(options.agentArgs)
    except:
        agentOpts = {}

    try:
        args['statOpts'] = json.loads(options.statArgs)
    except:
        args['statOpts'] = {}

    try:
        args['noiseOpts'] = json.loads(options.noiseArgs)
    except:
        args['noiseOpts'] = {}

    agentOpts['width'] = breakoutLayout.getLayout(options.layout).width
    agentOpts['height'] = breakoutLayout.getLayout(options.layout).height

    bar = agentType(agentOpts)  # Instantiate bar with agentArgs
    args['bar'] = bar
    bar.width = agentOpts['width']
    bar.height = agentOpts['height']

    # Don't display training games
    if 'numTrain' in agentOpts:
        options.numQuiet = int(agentOpts['numTrain'])
        options.numIgnore = int(agentOpts['numTrain'])

    if 'savedFolder' in agentOpts:
        args['savedFolder'] = options.savedFolder

    # Choose a ghost agent
    # Choose a ball agent
    ballType = getattr(__import__("breakout"), 'Ball')
    args['ball'] = ballType(1) 


    args['timeout'] = options.timeout
    args['agentOpts'] = agentOpts
    args['barAgentName'] = barName
    args['pretrainedAgentName'] = options.pretrainedAgent
    args['outputStats'] = options.outputStats
    args['swapsArg'] = options.swapsArg
    args['display'] = None

    args['mode'] = options.mode

    return args


# NOISY_ARGS = [{},{"std":0.1, "mean":0}, {"std":0.2, "mean":0},{"std":0.3, "mean":0},{"std":0.4, "mean":0},{"std":0.5, "mean":0},{"std":0.6, "mean":0},{"std":0.7, "mean":0},{"std":0.8, "mean":0},{"std":0.9, "mean":0},
#    {"std":0.1, "mean":0.1}, {"std":0.1, "mean":0.2},{"std":0.1, "mean":0.3},{"std":0.1, "mean":0.4},{"std":0.1, "mean":0.5},{"std":0.1, "mean":0.6},{"std":0.1, "mean":0.7},{"std":0.1, "mean":0.8},{"std":0.1, "mean":0.9}]

NOISY_ARGS = [{}, {"std": 0.1, "mean": 0}, {"std": 0.2, "mean": 0}, {
    "std": 0.3, "mean": 0}, {"std": 0.5, "mean": 0}, {"std": 0.7, "mean": 0}, {"std": 0.9, "mean": 0}]

SWAP_LIST = [0,0.1,0.2,0.3,0.5,0.7,0.9]

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


def train_epoch(transitionMatrixTree, n_training_steps, rules, bar, ball, layout, gameDisplay):

    for i in range(n_training_steps):
        game = rules.newGame(layout, bar, ball,
                             None, 1, catchExceptions=False)
        transitionMatrixTree.state = game.state
        game.transitionFunctionTree = transitionMatrixTree.copy()
        if 'Boltzmann' in bar.__class__.__name__:
            bar.agent.set_trainable(trainable=True)
        elif 'PacmanDQN' in bar.__class__.__name__:
            bar.set_trainable(trainable=True)
        game.run(i, n_training_steps)


def test_epoch(transitionMatrixTree, n_testing_steps, rules, bar, ball, layout, gameDisplay, ensemble_agent=None, record=None):
    scores = []
    for i in range(n_testing_steps):
        game = rules.newGame(layout, bar, ball,
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

def test_noisy_agents_epoch(transitionMatrixTreeList, n_testing_steps, rules, bar, ball, layout, gameDisplay, record=None):

    across_agents_scores = []
    for n in range(len(NOISY_ARGS)):
        scores = []
        for i in range(n_testing_steps):
            game = rules.newGame(layout, bar, ball,
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


def defineTransitionMatrix(bar, ball, layout, file_to_be_loaded=None, file_to_be_saved=None, applynoise=None, applyswaps=None):
    # define transition function

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
    if applyswaps != None:
        applyswaps = float(applyswaps)
        transitionMatrixTree = TransitionMatrixDicTree(bar, ball, layout, swaps=applyswaps)
    if applynoise != None:
        transitionMatrixTree = TransitionMatrixDicTree(bar, ball, layout, noise=applynoise)
    else:
        transitionMatrixTree = TransitionMatrixDicTree(bar, ball, layout)

    transitionMatrixTree.computeProbabilities()

    return transitionMatrixTree


def runStatistics(bar, barName, barArgs, ball, layout, display, file_to_be_loaded=None, applynoise=None, applyswaps=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = BreakoutClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_training_steps], dtype=np.float32)

    for i in range(trained_agents):
        transitionMatrixTreeList = []
        transitionMatrixTreeList.append(defineTransitionMatrix(
            bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applynoise=None, applyswaps=applyswaps))
        transitionMatrixTreeList.append(defineTransitionMatrix(
            bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applynoise=applynoise, applyswaps=applyswaps))

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
        bar = barType(barArgs)

    return np.mean(stats, 0)


def runLearnability(bar, barName, barArgs, ball, layout, display, file_to_be_loaded=None, applynoise=None, applyswaps=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = BreakoutClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_training_steps], dtype=np.float32)

    for i in range(trained_agents):
        if applynoise:
            transitionMatrixTree = defineTransitionMatrix(
                bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applynoise=applynoise)
        elif applyswaps:
            transitionMatrixTree = defineTransitionMatrix(
                bar, ball, layout, file_to_be_loaded=file_to_be_loaded,applyswaps=applyswaps)
        else:
            transitionMatrixTree = defineTransitionMatrix(
                bar, ball, layout, file_to_be_loaded=file_to_be_loaded)

        for j in range(epochs // n_training_steps):
            print(j)
            if bar.__class__.__name__ != "KeyboardAgent":
                train_epoch(transitionMatrixTree, n_training_steps,
                            rules, bar, ball, layout, display)
            score = np.mean(test_epoch(
                transitionMatrixTree, n_testing_steps, rules, bar, ball, layout, display))
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
        bar = barType(barArgs)

    return np.mean(stats, 0)

def runEnsembleAgents(bar, barName, barArgs, ball, layout, display, file_to_be_loaded=None, applynoise=None, applyswaps=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = BreakoutClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_training_steps], dtype=np.float32)
    
    if bar.__class__.__name__ == "KeyboardAgent":
        barType = loadAgent(barName, 0)
    else:
        barType = loadAgent(barName, 1)
    perturbedenv_bar = barType(barArgs)

    for i in range(trained_agents):

        transitionMatrixTreeList = []
        # normal environment agent
        transitionMatrixTreeList.append(defineTransitionMatrix(
                bar, ball, layout, file_to_be_loaded=file_to_be_loaded))
        
        # perturbed environment agent
        if applynoise:
            transitionMatrixTree = defineTransitionMatrix(
                perturbedenv_bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applynoise=applynoise)
            transitionMatrixTreeList.append(transitionMatrixTree)
        if applyswaps:
            transitionMatrixTree = defineTransitionMatrix(
                perturbedenv_bar, ball, layout, file_to_be_loaded=file_to_be_loaded,applyswaps=applyswaps)
            transitionMatrixTreeList.append(transitionMatrixTree)
        
        for j in range(epochs // n_training_steps):
            print(j)
            if bar.__class__.__name__ != "KeyboardAgent":
                train_epoch(transitionMatrixTreeList[0], n_training_steps,
                            rules, bar, ball, layout, display)
                train_epoch(transitionMatrixTreeList[1], n_training_steps,
                            rules, perturbedenv_bar, ball, layout, display)
            score = np.mean(test_epoch(
                transitionMatrixTreeList[1], n_testing_steps, rules, perturbedenv_bar, ball, layout, display, ensemble_agent=bar))
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
        bar = barType(barArgs)
        perturbedenv_bar = barType(barArgs)

    return np.mean(stats, 0)


def runGenralization(bar, barName, barArgs, ball, layout, display, file_to_be_loaded=None, applynoise=None, applyswaps=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = BreakoutClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, len(NOISY_ARGS), epochs // n_training_steps], dtype=np.float32)

    for i in range(trained_agents):
        transitionMatrixTreeList = []
        if applynoise:
            print("adding noise...")
            for n in range(len(NOISY_ARGS)):
                transitionMatrixTreeList.append(defineTransitionMatrix(
                    bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applynoise=NOISY_ARGS[n]))
        if applyswaps: 
            print("adding permutations...")   
            for n in range(len(SWAP_LIST)):
                transitionMatrixTreeList.append(defineTransitionMatrix(
                    bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applyswaps=SWAP_LIST[n]))
        for j in range(epochs // n_training_steps):

            if record_range and j >= record_range["min_range"] and j < record_range["max_range"]:
                recordpath = args['outputStats'] + \
                    "-generalization-RECORDING-" + f"{j}_epoch"
            else:
                recordpath = None

            print(j)
            if bar.__class__.__name__ != "KeyboardAgent":
                train_epoch(transitionMatrixTreeList[0], n_training_steps,
                            rules, bar, ball, layout, display)
            scores = test_noisy_agents_epoch(
                transitionMatrixTreeList, n_testing_steps, rules, bar, ball, layout, display, record=recordpath)
            for k in range(len(scores)):
                stats[i][k][j] = np.mean(scores[k])

        print('trained agent ', i)
        print('Scores:       ', ', '.join([str(score) for score in stats[i]]))

        if applynoise:
            for k in range(len(NOISY_ARGS)):
                if not os.path.exists(args['outputStats'].split('/')[0]):
                    os.makedirs(args['outputStats'].split('/')[0])
                np.savetxt(args['outputStats'] + f"_{NOISY_ARGS[k]}_" +
                        f"{i}_training_agent.pkl", stats[i][k],  delimiter=',')
        if applyswaps:
            for k in range(len(SWAP_LIST)):
                if not os.path.exists(args['outputStats'].split('/')[0]):
                    os.makedirs(args['outputStats'].split('/')[0])
                np.savetxt(args['outputStats'] + "_{\"swaps\":"+f"{SWAP_LIST[k]}"+"}_" +
                        f"{i}_training_agent.pkl", stats[i][k],  delimiter=',')

        #   reinitialize bar
        if bar.__class__.__name__ == "KeyboardAgent":
            barType = loadAgent(barName, 0)
        else:
            barType = loadAgent(barName, 1)
        bar = barType(barArgs)

    return np.mean(stats, 0)

CURRICULUM_NOISE = [{"noise":{"mean":0, "std":0}, "epochs": 650}]
CURRICULUM_SWAPS = [{"swaps":0, "epochs": 200}]


def newTrainingMethod(bar, barName, barArgs, ball, layout, display, file_to_be_loaded=None, applynoise=None, applyswaps=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = BreakoutClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_training_steps], dtype=np.float32)

    for i in range(trained_agents):
        transitionMatrixTreeList = []
        current_list = []

        if applynoise:
            print("adding noise...")
            current_list = CURRICULUM_NOISE.copy()
            for n in CURRICULUM_NOISE:
                transitionMatrixTreeList.append(defineTransitionMatrix(
                    bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applynoise=n["noise"]))
            transitionMatrixTreeList.append(defineTransitionMatrix(
                    bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applynoise=applynoise))
            current_list.append({"noise":applynoise, "epochs":epochs})
        if applyswaps: 
            print("adding permutations...")   
            current_list = CURRICULUM_SWAPS.copy()
            for n in CURRICULUM_SWAPS:
                transitionMatrixTreeList.append(defineTransitionMatrix(
                    bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applyswaps=n["swaps"]))
            transitionMatrixTreeList.append(defineTransitionMatrix(
                    bar, ball, layout, file_to_be_loaded=file_to_be_loaded, applyswaps=applyswaps))
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
        bar = barType(barArgs)

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
        output = runLearnability(args['bar'], args['barAgentName'], args['agentOpts'],
                                 args['ball'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applynoise=args['noiseOpts'], applyswaps=args["swapsArg"], **args['statOpts'])
        np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 's':
        output = runStatistics(args['bar'], args['barAgentName'], args['agentOpts'],
                               args['ball'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applynoise=args['noiseOpts'],  applyswaps=args["swapsArg"], **args['statOpts'])
        np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 'm':
        output = newTrainingMethod(args['bar'], args['barAgentName'], args['agentOpts'],
                               args['ball'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applynoise=args['noiseOpts'],  applyswaps=args["swapsArg"], **args['statOpts'])
        np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 'e':
        output = runEnsembleAgents(args['bar'], args['barAgentName'], args['agentOpts'],
                               args['ball'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applynoise=args['noiseOpts'],  applyswaps=args["swapsArg"], **args['statOpts'])
        np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 'g':
        output = runGenralization(args['bar'], args['barAgentName'], args['agentOpts'],
                                  args['ball'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applynoise=args['noiseOpts'],  applyswaps=args["swapsArg"], **args['statOpts'])
        for n in range(len(NOISY_ARGS)):
            np.savetxt(args['outputStats'] +
                       f"_{NOISY_ARGS[n]}"+".pkl", output[n],  delimiter=',')

    pass
