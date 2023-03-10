from pongTransitionFunction import TransitionMatrixDicTree
from pong import *
from pongRun import *
import pprint


def constructTransitionTest(layout, bar, ball, numGames, numTraining=0, catchExceptions=False, timeout=30):
    import __main__

    rules = PongClassicGameRules(timeout)
    games = []

    game = rules.newGame(layout, bar, ball,
                         None, 1, catchExceptions)
    
    tree = TransitionMatrixDicTree(bar, ball, layout)
    checkKeyHashFunction([tree.actions[Directions.STOP],tree.ballactions[Directions.UP]], tree)
    # define transition function
    
    tree.computeProbabilities()
    tree.state = game.state
    game.transitionFunctionTree = tree.copy()
    generateSuccessorState(game, 0, 1, perturbingagents=False)
    generateSuccessorState(game, 0, 1, perturbingagents=False)
    print("check hash function")
    checkHashFunction(game.state, tree)
    print("OK")

    nxtgamestate = generateSuccessorState(game, 0, 1, perturbingagents=False)
    print("next game state:")
    print(nxtgamestate)

    return games

def checkKeyHashFunction(actions, tree):
    print(actions)
    actionshash = tree.getHashfromKeys(actions)
    backactions= tree.getKeysfromHash(actionshash, 2)
    print(backactions)

def checkHashFunction(state, tree):
    print(state)
    statehash = tree.getHashfromState(state)
    backstate = tree.getStatefromHash(state, statehash)
    print(backstate)
    assert str(state) == str(backstate)


def generateSuccessorState(game, game_number, total_games, perturbingagents=False):
    """
    Main control loop for game play.
    """
    isInitial = True
    game.numMoves = 0
    actionstostateshashdict = {}

    for i in range(len(game.agents)):
        agent = game.agents[i]

    agentIndex = game.startingIndex
    numAgents = len(game.agents)

    while agentIndex < numAgents:
        # Fetch the next agent
        agent = game.agents[agentIndex]

        # Generate an observation of the state
        observation = game.state.deepCopy()

        action = None

        if perturbingagents:
            rolloutagent = game.agents[agentIndex]
            actionstostateshashdict[agentIndex] = {}
            if agentIndex == 0:
                barlegalactionspobdict = game.transitionFunctionTree.getLegalActionsAgent(
                    game.transitionFunctionTree.getHashfromState(observation), 0)
                action = agent.getAction(observation, barlegalactionspobdict.keys(
                ), game_number, total_games, isInitial)
                actionstostateshashdict[agentIndex] = barlegalactionspobdict[action]
                isInitial = False
            else:
                balllegalactionspobdict = game.transitionFunctionTree.getLegalActionsAgent(
                    game.transitionFunctionTree.getHashfromState(observation), agentIndex)
                actionstostateshashdict[agentIndex] = rolloutagent.getAction(
                    observation, balllegalactionspobdict)
        else:
            if agentIndex == 0:
                barlegalactionspobdict = game.transitionFunctionTree.getLegalBarActions(
                    game.transitionFunctionTree.getHashfromState(observation))
                action = agent.getAction(observation, barlegalactionspobdict.keys(
                ), game_number, total_games, isInitial)
                actionstostateshashdict = game.transitionFunctionTree.getLegalStates(
                    observation, action)
                isInitial = False

        game.state = game.transitionFunctionTree.generateSuccessor(
            game.state, actionstostateshashdict[agentIndex], agentIndex)

        for el in actionstostateshashdict[agentIndex].keys():
            print(game.transitionFunctionTree.getStatefromHash(game.state, el))
        agentIndex += 1

    return game.state


if __name__ == "__main__":
    args = readCommand(sys.argv[1:])
    constructTransitionTest(**args)
    pass
