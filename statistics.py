# pacman.py
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
Pacman.py holds the logic for the classic pacman game along with the main
code to run a game.  This file is divided into three sections:

  (i)  Your interface to the pacman world:
          Pacman is a complex environment.  You probably don't want to
          read through all of the code we wrote to make the game runs
          correctly.  This section contains the parts of the code
          that you will need to understand in order to complete the
          project.  There is also some code in game.py that you should
          understand.

  (ii)  The hidden secrets of pacman:
          This section contains all of the logic code that the pacman
          environment uses to decide who can move where, who dies when
          things collide, etc.  You shouldn't need to read this section
          of code, but you can if you want.

  (iii) Framework to start a game:
          The final section contains the code for reading the command
          you use to set up the game, then starting up a new game, along with
          linking in all the external parts (agent functions, graphics).
          Check this section out to see all the options available to you.

To play your first game, type 'python pacman.py' from the command line.
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
import semanticNoise
from pong import ClassicGameRules
import noise
import json
def default(str):
    return str + ' [Default: %default]'


def readCommand(argv):
    """
    Processes the command used to run pacman from the command line.
    """
    from optparse import OptionParser
    usageStr = """
    USAGE:      python pacman.py <options>
    EXAMPLES:   (1) python pacman.py
                    - starts an interactive game
                (2) python pacman.py --layout smallClassic --zoom 2
                OR  python pacman.py -l smallClassic -z 2
                    - starts an interactive game on a smaller board, zoomed in
    """
    parser = OptionParser(usageStr)
    parser.add_option('-m', '--mode', dest='mode',
                      help=default(
                          'type of statistics you want to run (s, e, g)'),
                      default='s')
    parser.add_option('-l', '--layout', dest='layout',
                      help=default(
                          'the LAYOUT_FILE from which to load the map layout'),
                      metavar='LAYOUT_FILE', default='mediumClassic')
    parser.add_option('-p', '--pacman', dest='pacman',
                      help=default(
                          'the agent TYPE in the pacmanAgents module to use'),
                      metavar='TYPE', default='KeyboardAgent')
    parser.add_option('-g', '--ghosts', dest='ghost',
                      help=default(
                          'the ghost agent TYPE in the ghostAgents module to use'),
                      metavar='TYPE', default='RandomGhost')
    parser.add_option('-k', '--numghosts', type='int', dest='numGhosts',
                      help=default('The maximum number of ghosts to use'), default=4)
    parser.add_option('-f', '--fixRandomSeed', action='store_true', dest='fixRandomSeed',
                      help='Fixes the random seed to always play the same game', default=False)
    parser.add_option('-a', '--agentArgs', dest='agentArgs',
                      help='Comma separated values sent to agent. e.g. "opt1=val1,opt2,opt3=val3"')
    parser.add_option('--timeout', dest='timeout', type='int',
                      help=default('Maximum length of time an agent can spend computing in a single game'), default=30)
    parser.add_option('-s', '--statArgs', dest='statArgs',
                      help='Comma separated values sent to stat. e.g. "opt1=val1,opt2,opt3=val3"')
    parser.add_option('-t', '--pretrainedAgent', dest='pretrainedAgent', help=default('The pre-trained pacmanAgents module to use'),
                      metavar='TYPE', default=None)
    parser.add_option('-o', '--outputStats', dest='outputStats', help=default('Output file to save stats'),
                      metavar='TYPE', default='saved_agent.pkl')
    parser.add_option('-n', '--noiseArgs', dest='noiseArgs',
                      help='Comma separated values sent to noise. e.g. "opt1=val1,opt2,opt3=val3,noise=\{arg1=val1,arg2=val2\}"')

    options, otherjunk = parser.parse_args(argv)
    if len(otherjunk) != 0:
        raise Exception('Command line input not understood: ' + str(otherjunk))
    args = dict()

    # Fix the random seed
    if options.fixRandomSeed:
        random.seed('cs188')

    # Choose a layout
    args['layout'] = layout.getLayout(options.layout)
    if args['layout'] == None:
        raise Exception("The layout " + options.layout + " cannot be found")

    pacmanAgentName = options.pacman
    pacmanType = loadAgent(pacmanAgentName, 1)

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

    pacman = pacmanType(**agentOpts)  # Instantiate Pacman with agentArgs
    args['pacman'] = pacman

    # Don't display training games
    if 'numTrain' in agentOpts:
        options.numQuiet = int(agentOpts['numTrain'])
        options.numIgnore = int(agentOpts['numTrain'])

    # Choose a ghost agent
    ghostType = loadAgent(options.ghost, 1)
    args['ghosts'] = [ghostType(i+1) for i in range(options.numGhosts)]

    # Choose a display format
    import textDisplay
    args['display'] = textDisplay.NullGraphics()
    args['timeout'] = options.timeout
    args['agentOpts'] = agentOpts
    args['pacmanAgentName'] = pacmanAgentName
    args['pretrainedAgentName'] = options.pretrainedAgent
    args['outputStats'] = options.outputStats
    args['mode'] = options.mode

    return args


def loadAgent(pacman, nographics):
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
            if pacman in dir(module):
                if nographics and modulename == 'keyboardAgents.py':
                    raise Exception(
                        'Using the keyboard requires graphics (not text display)')
                return getattr(module, pacman)
    raise Exception('The agent ' + pacman +
                    ' is not specified in any *Agents.py.')


def train_epoch(transitionMatrixTree, n_training_steps, rules, pacman, ghosts, layout):

    for i in range(n_training_steps):
        import textDisplay
        gameDisplay = textDisplay.NullGraphics()
        game = rules.newGame(layout, pacman, ghosts,
                             gameDisplay, 1, catchExceptions=False)
        transitionMatrixTree.state = game.state
        game.pongTransitionFunctionTree = transitionMatrixTree.copy()
        pacman.agent.set_trainable(trainable=True)
        game.run(i, n_training_steps, perturbingagents=False)
    pass


def test_epoch(transitionMatrixTree, n_testing_steps, rules, pacman, ghosts, layout):
    games = []

    for i in range(n_testing_steps):
        import textDisplay
        gameDisplay = textDisplay.NullGraphics()
        game = rules.newGame(layout, pacman, ghosts,
                             gameDisplay, 1, catchExceptions=False)
        transitionMatrixTree.state = game.state
        game.pongTransitionFunctionTree = transitionMatrixTree.copy()
        pacman.agent.set_trainable(trainable=False)
        game.run(i, n_testing_steps, perturbingagents=False)
        games.append(game)

    scores = [game.state.getScore() for game in games]

    return np.asarray(scores)


def defineTransitionMatrix(pacman, ghosts, layout, file_to_be_loaded=None, applynoise=None):
    # define transition function
    transitionMatrixTree = TransitionMatrixDicTree(pacman, ghosts, layout)
    transitionMatrixTree.computeProbabilities()

    # semanticDistribution, noiseType, noiseArgs
    try:
        if file_to_be_loaded:
            loaded_agent = pickle.load(open(file_to_be_loaded, "rb"))
            pacman.agent.__class__ = loaded_agent.__class__
            pacman.agent.__dict__ = loaded_agent.__dict__
            pacman.agent.set_trainable(False)
    except:
        print "impossible to load file: " + file_to_be_loaded
        print "starting a new agent from scratch ..."

    if applynoise:
        distributedNoise = getattr(
            semanticNoise, applynoise['semanticDistribution'])(transitionMatrixTree)
        statesTobePerturbed = distributedNoise.generateToBePerturbedStatesMap(
            layout)
        transitionMatrixTree.applyNoiseToTransitionMatrix(
            getattr(noise, applynoise['noiseType'])({'mean': applynoise['noiseArgs']['mean'], 'std': applynoise['noiseArgs']['std'], 'scale': applynoise['noiseArgs']['scale']}), statesTobePerturbed)

    return transitionMatrixTree


def runStatistics(pacman, pacmanName, pacmanArgs, ghosts, layout, display, file_to_be_loaded=None, applynoise=None, epochs=1000, trained_agents=300, n_training_steps=10, n_testing_steps=10, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = ClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_training_steps], dtype=np.float)

    for i in range(trained_agents):
        transitionMatrixTree = defineTransitionMatrix(
            pacman, ghosts, layout, file_to_be_loaded, applynoise)
        for j in range(epochs // n_training_steps):
            print j
            train_epoch(transitionMatrixTree, n_training_steps,
                        rules, pacman, ghosts, layout)
            score = np.mean(test_epoch(
                transitionMatrixTree, n_testing_steps, rules, pacman, ghosts, layout))
            stats[i][j] = score
        print 'trained agent ', i
        print 'Scores:       ', ', '.join([str(score) for score in stats[i]])

        #   reinitialize pacman
        try:
            pacmanOpts = json.loads(pacmanArgs)
        except:
            pacmanOpts = {}

        pacmanType = loadAgent(pacmanName, 1)
        pacman = pacmanType(**pacmanOpts)

    return np.mean(stats, 0)


# python statistics.py -m e -p RandomAgent -l ChloeTest -s '{"epochs":100,"trained_agents":300,"timeout":30}' -o 'saved_agent_ChloeTest_RandomAgent_DistributedNoise_GaussianNoise_{"mean":0.1,"std":0.1,"scale":1}' -n '{"semanticDistribution":"DistributedNoise","noiseType":"GaussianNoise","noiseArgs":{"mean":0.1,"std":0.1,"scale":1}}'

def runExpectedValue(pacman, ghosts, layout, display, file_to_be_loaded=None, applynoise=None, epochs=100, trained_agents=300, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = ClassicGameRules(timeout)

    scores = np.zeros(
        [trained_agents], dtype=np.float)

    for i in range(trained_agents):
        transitionMatrixTree = defineTransitionMatrix(
            pacman, ghosts, layout, file_to_be_loaded, applynoise)

        games = []
        for j in range(epochs):
            print j
            game = rules.newGame(layout, pacman, ghosts,
                                 display, 1, catchExceptions=False)
            transitionMatrixTree.state = game.state
            game.pongTransitionFunctionTree = transitionMatrixTree.copy()
            game.run(i, trained_agents, perturbingagents=False)
            games.append(game)

        scores = [game.state.getScore() for game in games]
        print 'trained agent ', i
        print 'Scores:       ', ', '.join([str(score) for score in scores])

        scores[j] = np.mean(scores)

    return np.mean(scores).reshape([1,-1])

if __name__ == '__main__':
    """
    The main function called when pacman.py is run
    from the command line:

    > python pacman.py

    See the usage string for more details.

    > python pacman.py --help
    """
    args = readCommand(sys.argv[1:])  # Get game components based on input
    
    if args['mode'] == 's':
        output = runStatistics(args['pacman'], args['pacmanAgentName'], args['agentOpts'],
                              args['ghosts'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applynoise=args['noiseOpts'], **args['statOpts'])
    elif args['mode'] == 'e':
        output = runExpectedValue(args['pacman'], args['ghosts'], args['layout'],
                             args['display'], file_to_be_loaded=args['pretrainedAgentName'], applynoise=args['noiseOpts'], epochs=args['statOpts']['epochs'], trained_agents=args['statOpts']['trained_agents'], timeout=args['statOpts']['timeout'])
    
    np.savetxt(args['outputStats'], output,  delimiter=',')

    pass
