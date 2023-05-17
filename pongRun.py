# bar.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
#
# Attribution Information: The bar AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
bar.py holds the logic for the classic bar game along with the main
code to run a game.  This file is divided into three sections:

  (i)  Your interface to the bar world:
          bar is a complex environment.  You probably don't want to
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

  (iii) Framework to start a game:
          The final section contains the code for reading the command
          you use to set up the game, then starting up a new game, along with
          linking in all the external parts (agent functions, graphics).
          Check this section out to see all the options available to you.

To play your first game, type 'python bar.py' from the command line.
The keys are 'a', 's', 'd', and 'w' to move (or arrow keys).  Have fun!
"""
import pongLayout as layout
import sys
import random
import os
from QLearningAgent import *
from pongTransitionFunction import *
from pong import *
from search import *

###################################################
# YOUR INTERFACE TO THE bar WORLD: A GameState #
###################################################

#############################
# FRAMEWORK TO START A GAME #
#############################


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

    parser.add_option('-n', '--numGames', dest='numGames', type='int',
                      help=default('the number of GAMES to play'), metavar='GAMES', default=1)
    parser.add_option('-l', '--layout', dest='layout',
                      help=default(
                          'the LAYOUT_FILE from which to load the map layout'),
                      metavar='LAYOUT_FILE', default='mediumClassic')
    parser.add_option('-p', '--bar', dest='bar',
                      help=default(
                          'the agent TYPE in the barAgents module to use'),
                      metavar='TYPE', default='KeyboardAgent')
    parser.add_option('-t', '--textGraphics', action='store_true', dest='textGraphics',
                      help='Display output as text only', default=False)
    parser.add_option('-q', '--quietTextGraphics', action='store_true', dest='quietGraphics',
                      help='Generate minimal output and no graphics', default=False)
    parser.add_option('-z', '--zoom', type='float', dest='zoom',
                      help=default('Zoom the size of the graphics window'), default=1.0)
    parser.add_option('-f', '--fixRandomSeed', action='store_true', dest='fixRandomSeed',
                      help='Fixes the random seed to always play the same game', default=False)
    parser.add_option('-r', '--recordActions', action='store_true', dest='record',
                      help='Writes game histories to a file (named by the time they were played)', default=False)
    parser.add_option('--replay', dest='gameToReplay',
                      help='A recorded game file (pickle) to replay', default=None)
    parser.add_option('-a', '--agentArgs', dest='agentArgs',
                      help='Comma separated values sent to agent. e.g. "opt1=val1,opt2,opt3=val3"')
    parser.add_option('-x', '--numTraining', dest='numTraining', type='int',
                      help=default('How many episodes are training (suppresses output)'), default=0)
    parser.add_option('--frameTime', dest='frameTime', type='float',
                      help=default('Time to delay between frames; <0 means keyboard'), default=0.1)
    parser.add_option('-c', '--catchExceptions', action='store_true', dest='catchExceptions',
                      help='Turns on exception handling and timeouts during games', default=False)
    parser.add_option('--timeout', dest='timeout', type='int',
                      help=default('Maximum length of time an agent can spend computing in a single game'), default=30)

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
    
    agentType = loadAgent(options.bar, 1)
    agentOpts = parseAgentArgs(options.agentArgs)
    agentOpts['width'] = layout.getLayout(options.layout).width
    agentOpts['height'] = layout.getLayout(options.layout).height

    bar = agentType(agentOpts)  # Instantiate bar with agentArgs
    args['bars'] = []
    args['bars'].append(bar)

    computerBarType = getattr(__import__("pong"), 'ComputerBar')
    computerBar = computerBarType(1) 
    args['bars'].append(computerBar)

    # Don't display training games
    if options.numTraining > 0:
        args['numTraining'] = options.numTraining
        if 'numTraining' not in agentOpts:
            agentOpts['numTraining'] = options.numTraining

    # Choose a ball agent
    ballType = getattr(__import__("pong"), 'Ball')
    args['ball'] = ballType(2) 

    args['numGames'] = options.numGames
    args['catchExceptions'] = options.catchExceptions
    args['timeout'] = options.timeout

    # Special case: recorded games don't use the runGames method or args structure
    return args


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


def runGames(layout, bars, ball, numGames, numTraining=0, catchExceptions=False, timeout=30):
    import __main__
    from noise import GaussianNoise
    from semanticNoise import DistributedNoise

    rules = PongClassicGameRules(timeout)
    games = []

    # define transition function
    tree = TransitionMatrixDicTree(bars, ball, layout)
    tree.computeProbabilities()
    print(tree.nPossibleActions)
    print(tree.nStates)
    
    for i in range(numGames):
        print(i)
        beQuiet = i < numTraining

        game = rules.newGame(layout, bars, ball,
                             None, beQuiet, catchExceptions)
        tree.state = game.state
        game.transitionFunctionTree = tree.copy()
        game.run(i, numGames)

        if not beQuiet:
            games.append(game)

    if (numGames-numTraining) > 0:
        scores = [game.state.getScore() for game in games]
        moves = [game.state.getMoves() for game in games]
        wins = [game.state.isWin() for game in games]
        winRate = wins.count(True) / float(len(wins))
        movesAvg = sum(moves) / float(len(moves))
        print('Average Score:', sum(scores) / float(len(scores)))
        print('Scores:       ', ', '.join([str(score) for score in scores]))
        print('Win Rate:      %d/%d (%.2f)' % (wins.count(True), len(wins), winRate))
        print('Moves Avg:      %.2f' % (movesAvg))
        print('Record:       ', ', '.join([['Loss', 'Win'][int(w)] for w in wins]))

    return games


if __name__ == '__main__':
    """
    The main function called when bar.py is run
    from the command line:

    > python bar.py

    See the usage string for more details.

    > python bar.py --help
    """
    args = readCommand(sys.argv[1:])  # Get game components based on input
    runGames(args['layout'], args['bars'], args['ball'], args['numGames'], args['catchExceptions'], args['timeout'])

    # import cProfile
    # cProfile.run("runGames( **args )")
    pass
