from os import stat
import numpy as np
from util import nearestPoint
from util import manhattanDistance
import util
from gameInterface import *
import traceback


###############################
#  Dynamic Non-Controllable   #
###############################


class Directions:
    EAST = 'East'
    WEST = 'West'
    STOP = 'Stop'
    UPLEFT = 'Upleft'
    UPRIGHT = 'Upright'
    DOWNLEFT = 'DownLeft'
    DOWNRIGHT = 'DownRight'
    DOWN = 'Down'
    UP = 'Up'

    REVERSE = {EAST: WEST,
               WEST: EAST,
               STOP: STOP,
               UPRIGHT: UPLEFT,
               DOWNLEFT: DOWNRIGHT,
               UP: DOWN
               }


class BallAgent(Agent):
    def __init__(self, index):
        self.index = index

    def getAction(self, state, actlist, ensemble_agent=False):
        dist = {}
        for a in actlist.keys():
            dist[a] = sum(actlist[a].values())
        dist = util.Counter(dist)
        if len(dist) == 0:
            return Directions.STOP
        else:
            return actlist[util.chooseFromDistribution(dist)]

    def getDistribution(self, state):
        "Returns a Counter encoding a distribution over actions from the provided state."
        util.raiseNotDefined()


class Ball(BallAgent):
    "A ghost that chooses a legal action uniformly at random."

    def getDistribution(self, state):
        dist = util.Counter()
        for a in BallRules.getLegalActions(state, self.index):
            dist[a] = 1.0
        dist.normalize()
        return dist

class BallAgent(Agent):
    def __init__(self, index):
        self.index = index

    def getAction(self, state, actlist, ensemble_agent=False):
        dist = {}
        for a in actlist.keys():
            dist[a] = sum(actlist[a].values())
        dist = util.Counter(dist)
        if len(dist) == 0:
            return Directions.STOP
        else:
            return actlist[util.chooseFromDistribution(dist)]

    def getDistribution(self, state):
        "Returns a Counter encoding a distribution over actions from the provided state."
        util.raiseNotDefined()

class ComputerBarAgent(Agent):
    def __init__( self, index, prob=None):
        self.prob = prob
        self.index = index

    def getAction(self, state, actlist, ensemble_agent=False):
        dist = {}
        for a in actlist.keys():
            dist[a] = sum(actlist[a].values())
        dist = util.Counter(dist)
        if len(dist) == 0:
            return Directions.STOP
        else:
            return actlist[util.chooseFromDistribution(dist)]

    def getDistribution(self, state):
        "Returns a Counter encoding a distribution over actions from the provided state."
        util.raiseNotDefined()

class ComputerBar(ComputerBarAgent):
    "A ghost that chooses a legal action uniformly at random."
    def __init__( self, index, prob=None):
        self.prob = prob
        self.index = index
    
    def getDistribution(self, state):
        dist = util.Counter()
        for a in BarRules.getLegalActions(state, self.index):
            dist[a] = 1.0
        dist.normalize()
        return dist

class MoveMostlyWestComputerBar(ComputerBarAgent):
    "A bar that chooses a legal action uniformly at random."
    def __init__( self, index, prob=0.8):
        self.prob = prob
        self.index = index

    def getDistribution( self, state ):
        dist = util.Counter()
        legal_actions = BarRules.getLegalActions(state, self.index) 
        if Directions.WEST not in legal_actions:
            for a in BarRules.getLegalActions(state, self.index ): dist[a] = 1.0
            dist.normalize()
        elif len(legal_actions) == 1:
            dist[Directions.WEST] = 1
        else:
            dist[Directions.WEST] = self.prob
            other_prob = (1 -self.prob)/ (len(legal_actions)-1)
            for a in BarRules.getLegalActions(state, self.index ): 
                if a!= Directions.WEST:
                    dist[a] = other_prob
        return dist

class DirectionalComputerBar( ComputerBarAgent ):
    "A ghost that prefers to rush Pacman, or flee when scared."
    def __init__( self, index, prob=0.2):
        self.index = index
        self.prob = prob

    def getDistribution( self, state ):
        # Read variables from state
        barState = state.getBarState(self.index)
        legalActions = BarRules.getLegalActions(state, self.index )
        pos = state.getBarPosition( self.index )

        speed = 1

        actionVectors = [BarActions.directionToVector( a, speed ) for a in legalActions]
        newPositions = [( pos[0]+a[0], pos[1]+a[1] ) for a in actionVectors]
        ballPosition = state.getBallPosition()

        # Select best actions given the state
        distancesToBall = [manhattanDistance( pos, ballPosition ) for pos in newPositions]
       
        bestScore = min( distancesToBall )
        bestProb = self.prob
        bestActions = [action for action, distance in zip( legalActions, distancesToBall ) if distance == bestScore]

        # Construct distribution
        dist = util.Counter()
        for a in bestActions: dist[a] = bestProb / len(bestActions)
        for a in legalActions: dist[a] += ( 1-bestProb ) / len(legalActions)
        dist.normalize()
        return dist


class PongConfiguration(Configuration):
    """
    A Configuration holds the (x,y) coordinate of a character, along with its
    traveling direction.

    The convention for positions, like a graph, is that (0,0) is the lower left corner, x increases
    horizontally and y increases vertically.  Therefore, north is the direction of increasing y, or (0,1).
    """

    def __init__(self, pos, direction):
        # pos is the centre of the bar
        self.pos = pos
        self.direction = direction

    def getPosition(self):
        return (self.pos)

    def getDirection(self):
        return self.direction

    def isInteger(self):
        x, y = self.pos
        return x == int(x) and y == int(y)

    def __eq__(self, other):
        if other == None:
            return False
        return (self.pos == other.pos and self.direction == other.direction)

    def __hash__(self):
        x = hash(self.pos)
        y = hash(self.direction)
        return hash(x + 13 * y)

    def __str__(self):
        return "(x,y)="+str(self.pos)+", "+str(self.direction)

    def generateSuccessor(self, vector, direction):
        """
        Generates a new configuration reached by translating the current
        configuration by the action vector.  This is a low-level call and does
        not attempt to respect the legality of the movement.

        Actions are movement vectors.
        """
        x, y = self.pos
        dx, dy = vector

        return PongConfiguration((x + dx, y+dy), direction)

    def movetoAnyState(self, nxtstatepos, action):
        return PongConfiguration((nxtstatepos[0], nxtstatepos[1]), action)


class PongAgentState(AgentState):
    """
    AgentStates hold the state of an agent (configuration, speed, scared, etc).
    """

    def __init__(self, startConfiguration, isBar):
        self.start = startConfiguration
        self.isBar = isBar
        self.configuration = startConfiguration

    def __str__(self):
        return "Pong: " + str(self.configuration)

    def __eq__(self, other):
        if other == None:
            return False
        return self.configuration == other.configuration

    def __hash__(self):
        return hash(hash(self.configuration))

    def copy(self):
        state = PongAgentState(self.start, self.isBar)
        state.configuration = self.configuration
        return state

    def getPosition(self):
        if self.configuration == None:
            return None
        return self.configuration.getPosition()

    def getDirection(self):
        return self.configuration.getDirection()


class PongGrid(Grid):
    """
    A 2-dimensional array of objects backed by a list of lists.  Data is accessed
    via grid[x][y] where (x,y) are positions on a Pacman map with x horizontal,
    y vertical and the origin (0,0) in the bottom left corner.

    The __str__ method constructs an output that is oriented like a pacman board.
    """
    pass


def reconstituteGrid(bitRep):
    if type(bitRep) is not type((1, 2)):
        return bitRep
    width, height = bitRep[:2]
    return PongGrid(width, height, bitRepresentation=bitRep[2:])


####################################
# Parts you shouldn't have to read #
####################################

class NormActions(Actions):
    """
    A collection of static methods for manipulating move actions.
    """
    # Directions
    _directions = {Directions.EAST:  (1, 0),
                   Directions.WEST: (-1, 0),
                   Directions.UP:  (0, 1),
                   Directions.DOWN: (0,-1)}

    _directionsAsList = _directions.items()

    TOLERANCE = .001

    def reverseDirection(action):
        if action == Directions.EAST:
            return Directions.WEST
        if action == Directions.WEST:
            return Directions.EAST
        if action == Directions.UP:
            return Directions.DOWN
        if action == Directions.DOWN:
            return Directions.UP
        return action
    reverseDirection = staticmethod(reverseDirection)


class BallActions(Actions):
    """
    A collection of static methods for manipulating move actions.
    """
    # Directions
    _directions = {Directions.UPLEFT:  (-1, 1),
                   Directions.UPRIGHT:  (1, 1),
                   Directions.DOWNLEFT:  (-1, -1),
                   Directions.DOWNRIGHT:  (1, -1),
                   Directions.WEST:  (-1, 0),
                   Directions.EAST: (1, 0)}

    _directionsAsList = _directions.items()

    TOLERANCE = .001

    def reverseDirection(action, norm):
        if action == Directions.EAST:
            return Directions.WEST
        if action == Directions.WEST:
            return Directions.EAST
        if action == Directions.UPRIGHT:
            if norm == Directions.DOWN:
                return Directions.DOWNRIGHT
            if norm == Directions.WEST:
                return Directions.UPLEFT
            else:
                return Directions.DOWNLEFT
        if action == Directions.UPLEFT:
            if norm == Directions.DOWN:
                return Directions.DOWNLEFT
            if norm == Directions.EAST:
                return Directions.UPRIGHT
            else:
                return Directions.DOWNRIGHT                
        if action == Directions.DOWNRIGHT:
            if norm == Directions.UP:
                return Directions.UPRIGHT
            if norm == Directions.WEST:
                return Directions.DOWNLEFT
            if norm == Directions.EAST:
                return Directions.UPLEFT
            else:
                Directions.DOWNLEFT
        if action == Directions.DOWNLEFT:
            if norm == Directions.UP:
                return Directions.UPLEFT
            if norm == Directions.EAST:
                return Directions.DOWNRIGHT
            if norm == Directions.WEST:
                return Directions.UPRIGHT
            else:
                Directions.DOWNRIGHT
        return action
    reverseDirection = staticmethod(reverseDirection)

    def vectorToDirection(dx, dy):
        if dx < 0 and dy < 0:
            return Directions.DOWNLEFT
        if dx < 0 and dy > 0:
            return Directions.UPLEFT
        if dx < 0 and dy == 0:
            return Directions.WEST
        if dx > 0 and dy == 0:
            return Directions.EAST
        if dx > 0 and dy > 0:
            return Directions.UPRIGHT
        if dx > 0 and dy < 0:
            return Directions.DOWNRIGHT
        return Directions.STOP
    vectorToDirection = staticmethod(vectorToDirection)

    def directionToVector(direction, speed=1.0):
        dx, dy = BallActions._directions[direction]
        return (dx * speed, dy * speed)
    directionToVector = staticmethod(directionToVector)

    # ONLY MINDS THE WALLS!
    def getPossibleActions(config, layout):
        possible = []
        x, y = config.pos

        x_int = int(x + 0.5)
        y_int = int(y + 0.5)

        for dir, pos in BallActions._directionsAsList:
            dx, dy = pos
            next_x = x_int + int(dx)
            next_y = y_int + int(dy)
            if not layout.walls[next_x][next_y]:
                possible.append(dir)
        return possible

    getPossibleActions = staticmethod(getPossibleActions)

    def getSuccessor(position, action):
        dx = BallActions.directionToVector(action)
        x = position
        return x + dx
    getSuccessor = staticmethod(getSuccessor)


class BarActions(Actions):
    """
    A collection of static methods for manipulating move actions.
    """
    # Directions
    _directions = {Directions.UP:  (0, 1),
                   Directions.DOWN: (0, -1),
                   Directions.STOP:  (0, 0)}

    _directionsAsList = _directions.items()

    TOLERANCE = .001

    def reverseDirection(action):
        if action == Directions.UP:
            return Directions.DOWN
        if action == Directions.DOWN:
            return Directions.UP
        return action
    reverseDirection = staticmethod(reverseDirection)

    def vectorToDirection(dy):
        if dy < 0:
            return Directions.UP
        if dy > 0:
            return Directions.DOWN
        return Directions.STOP
    vectorToDirection = staticmethod(vectorToDirection)

    def directionToVector(direction, speed=1.0):
        dx, dy = BarActions._directions[direction]
        return (dx * speed, dy * speed)
    directionToVector = staticmethod(directionToVector)

    def getPossibleActions(config, layout):
        possible = []
        x, y = config.pos
        x_int, y_int = int(x + 0.5), int(y + 0.5)

        for dir, vec in BarActions._directionsAsList:
            dx, dy = vec
            next_y = y_int + dy
            next_x = x_int + dx

            if not layout.walls[next_x][next_y+ 1*dy]:
                possible.append(dir)

        return possible

    getPossibleActions = staticmethod(getPossibleActions)

    def getSuccessor(position, action):
        dx = BarActions.directionToVector(action)
        x = position
        return x + dx
    getSuccessor = staticmethod(getSuccessor)


class PongGameStateData(GameStateData):
    """

    """

    def __init__(self, prevState=None):
        """
        Generates a new data packet by copying information from its predecessor.
        """
        if prevState != None:
            self.agentStates = self.copyAgentStates(prevState.agentStates)
            self.layout = prevState.layout
            self.score = prevState.score

        self._capsuleEaten = None
        self._agentMoved = None
        self._lose = False
        self._win = False
        self._numMoves = 0
        self.scoreChange = 0

    def deepCopy(self):
        state = PongGameStateData(self)
        state.layout = self.layout.deepCopy()
        state._agentMoved = self._agentMoved
        return state

    def copyAgentStates(self, agentStates):
        copiedStates = []
        for agentState in agentStates:
            copiedStates.append(agentState.copy())
        return copiedStates

    def __eq__(self, other):
        """
        Allows two states to be compared.
        """
        if other == None:
            return False
        # TODO Check for type of other
        if not self.agentStates == other.agentStates:
            return False
        if not self.score == other.score:
            return False

        return True

    def __hash__(self):
        """
        Allows states to be keys of dictionaries.
        """
        for i, state in enumerate(self.agentStates):
            try:
                int(hash(state))
            except TypeError as e:
                print(e)
                # hash(state)
        return int((hash(tuple(self.agentStates)) + 113 + 7 * hash(self.score)) % 1048575)

    def __str__(self):
        width, height = self.layout.width, self.layout.height
        map = PongGrid(width, height)
   
        for x in range(width):
            for y in range(height):
                walls = self.layout.walls
                map[x][y] = self._WallStr(walls[x][y])
        
        for agentStateId in range(len(self.agentStates)):
            if self.agentStates[agentStateId] == None:
                continue
            if self.agentStates[agentStateId].configuration == None:
                continue
            x, y = [int(i) for i in nearestPoint(
                self.agentStates[agentStateId].configuration.pos)]
            if self.agentStates[agentStateId].isBar == 1:
                for y1 in range(y-1, y+2):
                    map[x][y1] = self._barStr()
            elif self.agentStates[agentStateId].isBar == 0:
                map[x][y] = self._ballStr()

        return str(map)

    def _WallStr(self, hasWall):
        if hasWall:
            return '%'
        else:
            return ' '

    def _ballStr(self):
        return "."

    def _barStr(self):
        return "|"

    def initialize(self, layout):
        """
        Creates an initial game state from a layout array (see layout.py).
        """
        self.layout = layout
        self.score = 0
        self.scoreChange = 0

        self.agentStates = []
        for isBar, pos in layout.agentPositions:
            if isBar:
                direction = Directions.UP
            else:
                direction = Directions.EAST
            self.agentStates.append(PongAgentState(
                PongConfiguration(pos, direction), isBar))
    

try:
    import boinc
    _BOINC_ENABLED = True
except:
    _BOINC_ENABLED = False


class PongGameState(GameState):
    """
    A GameState specifies the full game state, including capsules,
    agent configurations and score changes.

    GameStates are used by the Game object to capture the actual state of the game and
    can be used by agents to reason about the game.

    Much of the information in a GameState is stored in a GameStateData object.  We
    strongly suggest that you access that data via the accessor methods below rather
    than referring to the GameStateData object directly.

    Note that in classic Pacman, Pacman is always agent 0.
    """

    ####################################################
    # Accessor methods: use these to access state data #
    ####################################################

    # static variable keeps track of which states have had getLegalActions called
    explored = set()

    def getAndResetExplored():
        tmp = PongGameState.explored.copy()
        PongGameState.explored = set()
        return tmp
    getAndResetExplored = staticmethod(getAndResetExplored)

    def getLegalActions(self, agentIndex=0):
        """
        Returns the legal actions for the agent specified.
        """
#        GameState.explored.add(self)
        if self.isWin() or self.isLose():
            return []

        if agentIndex == 0:  # Pacman is moving
            return BarRules.getLegalActions(self)
        else:
            return BallRules.getLegalActions(self, agentIndex)

    def generateSuccessor(self, agentIndex, action):
        """
        SHOULD NOT BE USED ANYMORE!
        Returns the successor state after the specified agent takes the action.
        """
        # Check that successors exist
        if self.isWin() or self.isLose():
            raise Exception('Can\'t generate a successor of a terminal state.')

        # Copy current state
        state = PongGameState(self)

        # Let agent's logic deal with its action's effects on the board
        if agentIndex == 2:  # Pacman is moving
            BallRules.applyAction(state, action, agentIndex)
        else:
            state.data._destroyed = [
                False for i in range(state.getNumAgents())]
            BarRules.applyAction(state, action, agentIndex)
           # A ghost is moving    

        # Time passes
        if agentIndex == 0:
            state.data.scoreChange += -TIME_PENALTY  # Penalty for waiting around

        # Book keeping
        state.data._agentMoved = agentIndex
        state.data.score += state.data.scoreChange
        PongGameState.explored.add(self)
        PongGameState.explored.add(state)
        return state

    def movetoAnyState(self, nextstate, action, agentIndex, nxtstatepos):
        """
        SHOULD BE USED IN PLACE of generateSuccessor!
        Returns the successor state after the specified agent takes the action.
        """
        # Check that successors exist
        if self.isWin() or self.isLose():
            raise Exception('Can\'t generate a successor of a terminal state.')
        
        # Copy current state
        state = PongGameState(self)
        
        # Let agent's logic deal with its action's effects on the board
        if agentIndex == 0:  # Pacman is moving
            state.data._destroyed = [
                False for i in range(state.getNumAgents())]
            BarRules.movetoAnyState(state, nxtstatepos, None)
        else:                # A ghost is moving
            BallRules.movetoAnyState(state, nxtstatepos, state.data.agentStates[agentIndex].getDirection(), agentIndex)
        
        # Time passes
        if agentIndex == 0:
            state.data.scoreChange += -TIME_PENALTY
        
        # Book keeping
        state.data._agentMoved = agentIndex
        state.data.score += state.data.scoreChange
        state.data.action = action
        
        PongGameState.explored.add(self)
        PongGameState.explored.add(state)
        return state

    def getLegalBarActions(self):
        return self.getLegalActions(0)

    def generateBarSuccessor(self, action):
        """
        SHOULD NOT BE USED ANYMORE
        Generates the successor state after the specified pacman move
        """
        return self.generateSuccessor(0, action)

    def getBarState(self, agentIndex):
        """
        Returns an AgentState object for pacman (in game.py)

        state.pos gives the current position
        state.direction gives the travel vector
        """
        return self.data.agentStates[agentIndex].copy()

    def getBarPosition(self, index):
        return self.data.agentStates[index].getPosition()

    def getBallState(self):
        return self.data.agentStates[2]

    def getBallPosition(self):
        return self.data.agentStates[2].getPosition()

    def getNumAgents(self):
        return len(self.data.agentStates)

    def getScore(self):
        return float(self.data.score)
    
    def getMoves(self):
        return float(self.data._numMoves)

    def getWalls(self):
        """
        Returns a Grid of boolean wall indicator variables.

        Grids can be accessed via list notation, so to check
        if there is a wall at (x,y), just call

        walls = state.getWalls()
        if walls[x][y] == True: ...
        """
        return self.data.layout.walls

    def hasWall(self, x, y):
        return self.data.layout.walls[x][y]

    def isLose(self):
        return self.data._lose

    def isWin(self):
        return self.data._win

    #############################################
    #             Helper methods:               #
    # You shouldn't need to call these directly #
    #############################################

    def __init__(self, prevState=None):
        """
        Generates a new state by copying information from its predecessor.
        """
        if prevState != None:  # Initial state
            self.data = PongGameStateData(prevState.data)
        else:
            self.data = PongGameStateData()

    def deepCopy(self):
        state = PongGameState(self)
        state.data = self.data.deepCopy()
        return state

    def __eq__(self, other):
        """
        Allows two states to be compared.
        """
        return hasattr(other, 'data') and self.data == other.data

    def __hash__(self):
        """
        Allows states to be keys of dictionaries.
        """
        return hash(self.data)

    def __str__(self):

        return str(self.data)

    def initialize(self, layout):
        """
        Creates an initial game state from a layout array (see layout.py).
        """
        self.data.initialize(layout)

############################################################################
#                     THE HIDDEN SECRETS OF PACMAN                         #
#                                                                          #
# You shouldn't need to look through the code in this section of the file. #
############################################################################


SCARED_TIME = 40    # Moves ghosts are scared
COLLISION_TOLERANCE = 0.7  # How close ghosts must be to Pacman to kill
TIME_PENALTY = 1  # Number of points lost each round


class PongClassicGameRules(ClassicGameRules):
    """
    These game rules manage the control flow of a game, deciding when
    and how the game starts and ends.
    """

    def __init__(self, timeout=30):
        self.timeout = timeout

    def newGame(self, layout, barAgents, ballAgent, display, quiet=False, catchExceptions=False):
        agents = barAgents + [ballAgent]
        initState = PongGameState()
        initState.initialize(layout)
        game = PongGame(agents, display, self, catchExceptions=catchExceptions)
        game.state = initState
        self.initialState = initState.deepCopy()
        self.quiet = quiet
        return game

    def process(self, state, game):
        """
        Checks to see whether it is time to end the game.
        """
        if state.isWin():
            self.win(state, game)
        if state.isLose():
            self.lose(state, game)

    def win(self, state,game):
        if not self.quiet:
            # print "Pacman emerges victorious! Score: %d" % state.data.score
            pass
        game.gameOver = True

    def lose(self, state, game):
        if not self.quiet:
            pass
            # print "Pacman died! Score: %d" % state.data.score
        game.gameOver = True

class BarRules(AgentRules):
    """
    These functions govern how pacman interacts with his environment under
    the classic game rules.
    """
    BAR_SPEED = 1

    def getLegalActions(state, agentIndex):
        """
        Returns a list of possible actions.
        """
        return BarActions.getPossibleActions(state.getBarState(agentIndex).configuration, state.data.layout)
    getLegalActions = staticmethod(getLegalActions)

    def applyAction(state, action, agentIndex):
        """
        Edits the state to reflect the results of the action.
        """
        legal = BarRules.getLegalActions(state, agentIndex)
        if action not in legal:
            raise Exception("Illegal action " + str(action))

        barState = state.data.agentStates[agentIndex]

        # Update Configuration
        vector = BarActions.directionToVector(action, BarRules.BAR_SPEED)
        barState.configuration = barState.configuration.generateSuccessor(
            vector, action)
    applyAction = staticmethod(applyAction)

    def movetoAnyState(state, nxtstatepos, action):
        """
        Edits the state to reflect the results of the action.
        """

        barState = state.data.agentStates[0]

        # Update Configuration
        barState.configuration = barState.configuration.movetoAnyState(
            nxtstatepos, action)
    movetoAnyState = staticmethod(movetoAnyState)


class BallRules(AgentRules):
    """
    These functions govern how pacman interacts with his environment under
    the classic game rules.
    """
    BALL_SPEED = 1

    def getNorm(state):
        confball = state.getBallState().configuration
        xball, yball = confball.pos
        dir = confball.direction

        norm = []

        x_int = int(xball + 0.5)
        y_int = int(yball + 0.5)

        for dir, pos in NormActions._directionsAsList:
            dx, dy = pos
            next_x = x_int + dx
            next_y = y_int + dy
            if state.data.layout.walls[next_x][next_y]:
                norm.append(NormActions.reverseDirection(dir))
        if len(norm) == 1:
            return norm[0]
        else:
            return norm

    getNorm = staticmethod(getNorm)

    def getLegalActions(state, agentIndex=2):
        """
        Ghosts cannot stop, and cannot turn around unless they
        reach a dead end, but can turn 90 degrees at intersections.
        down-left corner (0,0)
        """
        confball = state.getBallState().configuration
        confbar1 = state.getBarState(0).configuration
        confbar2 = state.getBarState(1).configuration

        xball, yball = confball.pos
        xbar1, ybar1 = confbar1.pos
        xbar2, ybar2 = confbar2.pos

        directionsAsList = set()
        dir = confball.direction
        norm = BallRules.getNorm(state)
        revdir = BallActions.reverseDirection(dir, norm)
        possibleActions = BallActions.getPossibleActions(
            confball, state.data.layout)
        
        if xball == xbar1:
            if yball < ybar1 and abs(yball - ybar1) < 2:
                if Directions.DOWNRIGHT in possibleActions:
                    directionsAsList.add(Directions.DOWNRIGHT)
                else:
                    directionsAsList.add(Directions.UPRIGHT)
            elif yball == ybar1 and abs(yball - ybar1) < 2:
                directionsAsList.add(Directions.EAST) 
            elif yball > ybar1 and abs(yball - ybar1) < 2:
                if Directions.UPRIGHT in possibleActions:
                    directionsAsList.add(Directions.UPRIGHT)
                else:
                    directionsAsList.add(Directions.DOWNRIGHT)
            else:
                return []
        if xball == xbar2:
            if yball < ybar2 and abs(yball - ybar2) < 2:
                if Directions.DOWNLEFT in possibleActions:
                    directionsAsList.add(Directions.DOWNLEFT)
                else:
                    directionsAsList.add(Directions.UPLEFT)
            elif yball == ybar2 and abs(yball - ybar2) < 2:
                directionsAsList.add(Directions.WEST) 
            elif yball > ybar2 and abs(yball - ybar2) < 2:
                if Directions.UPLEFT in possibleActions:
                    directionsAsList.add(Directions.UPLEFT)
                else:
                    directionsAsList.add(Directions.DOWNLEFT)
            else:
                return []
        elif dir in possibleActions:
            directionsAsList.add(dir)
        elif revdir in possibleActions:
            directionsAsList.add(revdir)
        else:
            directionsAsList.add(possibleActions[0])
        return directionsAsList

    getLegalActions = staticmethod(getLegalActions)

    def applyAction(state, action, agentIndex):
        """
        Edits the state to reflect the results of the action.
        """
        legal = BallRules.getLegalActions(state)
        if action not in legal:
            raise Exception("Illegal action " + str(action))

        ballState = state.data.agentStates[agentIndex]

        # Update Configuration
        vector = BallActions.directionToVector(action, BallRules.BALL_SPEED)
        ballState.configuration = ballState.configuration.generateSuccessor(
            vector, action)
        # Eat
        
        next = ballState.configuration.getPosition()
        nearest = nearestPoint(next)
        if manhattanDistance(nearest, next) <= 0.5:
            BallRules.checkstatus(state)

    applyAction = staticmethod(applyAction)

    def movetoAnyState(state, nxtstatepos, direction, agentIdx):
        """
        Edits the state to reflect the results of the action.
        """

        ballState = state.data.agentStates[agentIdx]

        # Update Configuration
        ballState.configuration = ballState.configuration.movetoAnyState(
            nxtstatepos, direction)
        
        # Eat
        next = ballState.configuration.getPosition()
        nearest = nearestPoint(next)

        BallRules.checkstatus(state)

    movetoAnyState = staticmethod(movetoAnyState)

    def checkstatus(state):
        # TODO: cache numFood?

        bally, ballx = state.data.agentStates[2].configuration.pos
        bar1y, bar1x = state.data.agentStates[0].configuration.pos
        bar2y, bar2x = state.data.agentStates[1].configuration.pos

        if bar1y == bally and abs(ballx - bar1x) > 1:
            state.data.scoreChange -= 500
            state.data._lose = True
        
        if bar2y == bally and abs(ballx - bar2x) > 1:
            state.data.scoreChange += 500
            state.data._win = True
        

    checkstatus = staticmethod(checkstatus)


class PongGame(Game):
    """
    The Game manages the control flow, soliciting actions from agents.
    """

    def __init__(self, agents, display, rules, startingIndex=0, muteAgents=False, catchExceptions=False, ensemble_agent=False):
        self.agentCrashed = False
        self.agents = agents
        self.rules = rules
        self.startingIndex = startingIndex
        self.gameOver = False
        self.muteAgents = muteAgents
        self.catchExceptions = catchExceptions
        self.moveHistory = []
        self.totalAgentTimes = [0 for agent in agents]
        self.totalAgentTimeWarnings = [0 for agent in agents]
        self.agentTimeout = False
        self.transitionFunctionTree = None
        from io import StringIO
        self.agentOutput = [StringIO() for agent in agents]

    def getProgress(self):
        if self.gameOver:
            return 1.0
        else:
            return self.rules.getProgress(self)

    def _agentCrash(self, agentIndex, quiet=False):
        "Helper method for handling agent crashes"
        if not quiet:
            traceback.print_exc()
        self.gameOver = True
        self.agentCrashed = True
        self.rules.agentCrash(self, agentIndex)
    
    def mute(self, agentIndex):
        if not self.muteAgents:
            return
        global OLD_STDOUT, OLD_STDERR
        import cStringIO
        OLD_STDOUT = sys.stdout
        OLD_STDERR = sys.stderr
        sys.stdout = self.agentOutput[agentIndex]
        sys.stderr = self.agentOutput[agentIndex]

    def unmute(self):
        if not self.muteAgents:
            return
        global OLD_STDOUT, OLD_STDERR
        # Revert stdout/stderr to originals
        sys.stdout = OLD_STDOUT
        sys.stderr = OLD_STDERR

    def run(self, game_number, total_games, ensemble_agent=None):
        """
        Main control loop for game play.
        """
        isInitial = True
        self.numMoves = 0
        actionstostateshashdict = {}

        # self.display.initialize(self.state.makeObservation(1).data)
        # inform learning agents of the game start
        for i in range(len(self.agents)):
            agent = self.agents[i]
            if not agent:
                self.mute(i)
                # this is a null agent, meaning it failed to load
                # the other team wins
                self.unmute()
                self._agentCrash(i, quiet=True)
                return
            if ("registerInitialState" in dir(agent)):
                self.mute(i)
                agent.registerInitialState(self.state.deepCopy())
                self.unmute()

        agentIndex = self.startingIndex
        numAgents = len(self.agents)
        moves=0
        maxMoves=self.transitionFunctionTree.factorLegal

        while not self.gameOver and self.numMoves < maxMoves:
            
            # Fetch the next agent
            agent = self.agents[agentIndex]
            move_time = 0
            skip_action = False

            # Generate an observation of the state
            if 'observationFunction' in dir(agent):
                self.mute(agentIndex)
                if self.catchExceptions:
                    observation = agent.observationFunction(
                        self.state.deepCopy())
                self.unmute()
            else:
                observation = self.state.deepCopy()
            
            if agentIndex == 0:
                fromstatehash = self.transitionFunctionTree.getHashfromState(observation)
                legal_actions = self.transitionFunctionTree.transitionMatrixDic[fromstatehash].keys()
                if len(legal_actions) != 0:
                    pacaction = agent.getAction(observation, legal_actions, game_number, total_games, isInitial, ensemble_agent=ensemble_agent)
                    actionstostateshashdict = self.transitionFunctionTree.getLegalActions(
                        fromstatehash, pacaction)
                    nextstatehash = self.transitionFunctionTree.generateSuccessor(actionstostateshashdict)                   
                    self.state.data.agentStates[2].configuration.direction =  self.transitionFunctionTree.keyDict[nextstatehash].data.agentStates[2].configuration.getDirection()
                    isInitial = False
                    
            # Execute the action
            self.state = self.transitionFunctionTree.moveToPosition(
                        self.state, pacaction, nextstatehash, agentIndex)
            
            # Change the display
            self.moveHistory.append((agentIndex, nextstatehash, self.transitionFunctionTree.actions[pacaction]))

            self.rules.process(self.state, self)

            # Track progress
            if agentIndex == numAgents + 1:
                self.numMoves += 1
            # Next agent
            agentIndex = (agentIndex + 1) % numAgents

            if _BOINC_ENABLED:
                boinc.set_fraction_done(self.getProgress())
        
        if self.gameOver or self.transitionFunctionTree.transitionMatrixDic[nextstatehash] == {}:
            try:
                self.agents[0].getAction(self.state, [], game_number, total_games, isInitial)
                state.data._numMoves = self.numMoves
            except:
                pass
        # inform a learning agent of the game result
        for agentIndex, agent in enumerate(self.agents):
            if "final" in dir(agent):
                try:
                    self.mute(agentIndex)
                    agent.final(self.state)
                    self.unmute()
                except Exception as data:
                    if not self.catchExceptions:
                        raise
                    self._agentCrash(agentIndex)
                    self.unmute()
                    return