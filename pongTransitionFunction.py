# projectParams.py
# ----------------
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

import numpy as np
import random
from pong import BarActions, PongGameState, BarRules, BallRules, Directions, BallActions
##############################
#  TRANSITION FUNCTION CODE  #
##############################


class TransitionMatrixDicTree():
    """
    Class containing all the information to generate the state transition matrix
    """

    def __init__(self, barAgent, ballAgent, layout, noise=None, swaps=None):
        self.currentStateNum = 0
        self.stateDic = {}
        self.keyDict = {}
        initState = PongGameState()
        initState.initialize(layout)
        self.state = initState
        self.queue = []
        self.startingIndex = 0
        self.currentAgents = [barAgent] + \
            [ballAgent]
        self.visited = {}
        self.graph = {}
        self.numAgents = len(self.currentAgents)
        self.layout = layout
        self.nStates = (self.layout.width *
                        self.layout.height)**self.numAgents
        self.transitionMatrixDic = {}
        self.actions = {Directions.WEST: 0,
                        Directions.EAST: 1, Directions.STOP: 2}
        self.toactions = {v: k for k, v in self.actions.items()}

        self.ballactions = {Directions.UP: 3, Directions.UPLEFT: 4, Directions.UPRIGHT: 5,
                            Directions.DOWN: 6, Directions.DOWNLEFT: 7, Directions.DOWNRIGHT: 8}
        self.toballactions = {v: k for k, v in self.ballactions.items()}

        self.nPossibleActions = len(self.actions) + len(self.ballactions)
        self.nActions = (self.nPossibleActions)**self.numAgents
        self.helperDic = {}
        self.factorLegal = None

        self.swaps = swaps
        print("swaps level: ", self.swaps)

        self.STD = None
        self.MEAN = None
        self.noise = noise
        print("noise level: ", self.noise)
        if self.noise:
            self.STD = noise["std"]
            self.MEAN = noise["mean"]

    def copy(self):
        tree = self
        tree.state = self.state
        tree.queue = self.queue
        tree.startingIndex = self.startingIndex
        tree.currentAgents = self.currentAgents
        tree.visited = self.visited
        tree.graph = self.graph
        tree.numAgents = self.numAgents
        tree.layout = self.layout
        tree.nStates = self.nStates
        tree.transitionMatrixDic = self.transitionMatrixDic
        tree.actions = self.actions
        tree.nActions = self.nActions
        tree.helperDic = self.helperDic

        return tree

    def computeHash(self, state, action):
        hashstate = str(state) + str(state.getNumblocks()) + str(action)
        return hashstate

    def getHashfromState(self, state):
        balldir = state.data.agentStates[1].configuration.getDirection()
        statehash = self.computeHash(state, balldir)
        if statehash not in self.stateDic:
            self.stateDic[statehash] = self.currentStateNum
            self.keyDict[self.currentStateNum] = state
            self.currentStateNum += 1

        return self.stateDic[statehash]

    # the ball is the index 2
    # [lastbar, direction]
    def computeProbabilities(self):
        """
        Function to compute probabilities P(s'|s,a). Most transitions are illegal and the matrix is extremely big,
        therefore it is compressed in a dictionary containing as key the tostate value of the states and the actions
        for all non zero probability transitions.
        """
        for el in range(self.numAgents):
            self.visited[el] = {}
            self.helperDic[el] = {}

        self.queue.append(
            {"state": self.state, "id": 0, "lastbaraction": None})

        while self.queue:
            current_element = self.queue.pop()

            currentelementhash = self.getHashfromState(
                current_element["state"])

            if currentelementhash not in self.helperDic[current_element["id"]]:
                self.helperDic[current_element["id"]][currentelementhash] = {}

            if current_element["id"] == 0:
                legal_actions = BarRules.getLegalActions(
                    current_element["state"])
            else:
                legal_actions = BallRules.getLegalActions(
                    current_element["state"], current_element["id"])
            
            #print(current_element["state"])
            if current_element["state"].isWin() or current_element["state"].isLose():
                self.transitionMatrixDic[currentelementhash] = {}
                continue

            for action in legal_actions:
                successor_element = {}

                successor_element["id"] = (
                    current_element["id"] + 1) % self.numAgents

                successor_element["state"] = PongGameState(
                    current_element["state"])

                successor_element["state"] = current_element["state"].generateSuccessor(
                    current_element["id"], action)

                if current_element["id"] == 0:
                    successor_element["prob"] = 1
                    baraction = self.actions[action]
                    successor_element["lastbaraction"] = baraction
                else:
                    dist = self.currentAgents[current_element["id"]].getDistribution(
                        current_element["state"])
                    successor_element["prob"] = dist[action]
                    successor_element["lastbaraction"] = current_element["lastbaraction"]

                successorelelmenthash = self.getHashfromState(
                    successor_element["state"])

                if successorelelmenthash not in self.visited[successor_element["id"]]:
                    self.visited[successor_element["id"]
                                 ][successorelelmenthash] = True
                    self.queue.append(successor_element)

                if successor_element["lastbaraction"] not in self.helperDic[current_element["id"]][currentelementhash]:
                    self.helperDic[current_element["id"]
                                   ][currentelementhash][successor_element["lastbaraction"]] = {}
                self.helperDic[current_element["id"]
                               ][currentelementhash][successor_element["lastbaraction"]][successorelelmenthash] = successor_element["prob"]

        for currentelementhash in self.helperDic[0]:
            self.createMatrixrecursively(
                self.startingIndex, currentelementhash, [], currentelementhash, prob=1)
        
        #exit()
        self.factorLegal = len(self.transitionMatrixDic.keys())
        print("number of states: ", self.factorLegal)

        if self.swaps:
            self.computeCompleteMatrixSwaps()

        if self.noise:
            self.computeCompleteMatrix()

        # check correctness
        for fromstate in self.transitionMatrixDic:
            for throughaction in self.transitionMatrixDic[fromstate]:
                np.testing.assert_almost_equal(
                    sum(self.transitionMatrixDic[fromstate][throughaction].values()), 1)


        # check correctness
        for fromstatehash in self.transitionMatrixDic:
            for throughaction in self.transitionMatrixDic[fromstatehash]:
                np.testing.assert_almost_equal(
                    sum(self.transitionMatrixDic[fromstatehash][throughaction].values()), 1)

    def createMatrixrecursively(self, agentid, lastcompletestate, throughactions, currentelementhash, prob):
        if currentelementhash not in self.helperDic[agentid]:
            return

        for action in self.helperDic[agentid][currentelementhash]:
            throughactions.append(action)

            for successorelementhash in self.helperDic[agentid][currentelementhash][action]:
                probel = prob * \
                    self.helperDic[agentid][currentelementhash][action][successorelementhash]
                if agentid == self.numAgents - 1 or len(self.helperDic[agentid + 1][successorelementhash].keys()) == 0:
                    throughactionhash = throughactions[0]
                    if lastcompletestate not in self.transitionMatrixDic:
                        self.transitionMatrixDic[lastcompletestate] = {}
                    if throughactionhash not in self.transitionMatrixDic[lastcompletestate]:
                        self.transitionMatrixDic[lastcompletestate][throughactionhash] = {
                        }
                    if successorelementhash not in self.transitionMatrixDic[lastcompletestate][throughactionhash]:
                        self.transitionMatrixDic[lastcompletestate][throughactionhash][successorelementhash] = probel
                    else:
                        self.transitionMatrixDic[lastcompletestate][throughactionhash][successorelementhash] += probel
                else:
                    self.createMatrixrecursively(
                        agentid + 1, lastcompletestate, throughactions, successorelementhash, probel)

            throughactions.pop()

    def computeCompleteMatrix(self):

        for fromstatehash in self.transitionMatrixDic:
            for throughaction in self.transitionMatrixDic[fromstatehash].keys():
                np.random.seed()
                n_states = len(self.transitionMatrixDic.keys())
                noise_generated = np.absolute(
                    np.random.normal(self.MEAN, self.STD, n_states))
                for key, value in zip(self.transitionMatrixDic[fromstatehash][throughaction].keys(), self.transitionMatrixDic[fromstatehash][throughaction].values()):
                    noise_generated[list(self.transitionMatrixDic).index(
                        key)] += value * self.factorLegal
                probabilities = noise_generated / sum(noise_generated)
                self.transitionMatrixDic[fromstatehash][throughaction] = dict(
                    zip(self.transitionMatrixDic.keys(), probabilities))

    def computeCompleteMatrixSwaps(self):
        acceptable = [key for key,
                      value in self.transitionMatrixDic.items() if value != {}]
        randomindices = random.sample(
            range(0, len(acceptable)), int(self.swaps * len(acceptable)))
        shuffledvaluelist = [
            self.transitionMatrixDic[acceptable[idx]] for idx in randomindices]
        random.shuffle(shuffledvaluelist)
        keylist = [acceptable[idx] for idx in randomindices]

        for key, value in zip(keylist, shuffledvaluelist):
            self.transitionMatrixDic[key] = value

    def getLegalActions(self, fromstatehash, action):
        return self.transitionMatrixDic[fromstatehash][action]

    def getNorm(self, layout, nextx, nexty):
        if nextx == layout.width:
            if nexty == layout.height:
                return Directions.DOWNLEFT
            return Directions.EAST
        elif nexty == layout.height:
            if nextx == 0:
                return Directions.DOWNRIGHT
            return Directions.WEST
        elif nextx == 0:
            return Directions.EAST
        elif nexty == 0:
            return Directions.WEST
        else:
            return Directions.DOWN

    def computeAgentActionsFromBarState(self, fromstate):

        barx, bary = fromstate.data.agentStates[0].configuration.getPosition()
        ballx, bally = fromstate.data.agentStates[2].configuration.getPosition(
        )
        targetx, targety = fromstate.data.agentStates[1].configuration.getPosition(
        )

        dx = targetx-ballx
        dy = targety-bally
        throughactionball = self.ballactions[BallActions.vectorToDirection(
            dx, dy)]

        x_int = int(targetx + 0.5)
        y_int = int(targety + 0.5)

        next_x = x_int + int(dx)
        next_y = y_int + int(dy)

        if targety == bary:
            if targetx < barx and abs(targetx - barx) < 2:
                dx, dy = BallActions.directionToVector(Directions.UPLEFT)
                if fromstate.data.layout.walls[x_int + int(dx)][y_int + int(dy)]:
                    throughactiontarget = self.ballactions[Directions.UPRIGHT]
                else:
                    throughactiontarget = self.ballactions[Directions.UPLEFT]
            elif targetx == barx and abs(targetx - barx) < 2:
                throughactiontarget = self.ballactions[Directions.UP]
            elif targetx > barx and abs(targetx - barx) < 2:
                dx, dy = BallActions.directionToVector(Directions.UPRIGHT)
                if fromstate.data.layout.walls[x_int + int(dx)][y_int + int(dy)]:
                    throughactiontarget = self.ballactions[Directions.UPLEFT]
                else:
                    throughactiontarget = self.ballactions[Directions.UPRIGHT]
            else:
                # death
                return []
        elif fromstate.data.layout.walls[next_x][next_y]:
            norm = self.getNorm(fromstate.data.layout, next_x, next_y)
            throughactiontarget = self.ballactions[BallActions.reverseDirection(
                self.toballactions[throughactionball], norm)]
        elif fromstate.data.blocks[x_int][y_int]:
            throughactiontarget = self.ballactions[BallActions.reverseDirection(
                self.toballactions[throughactionball], Directions.DOWN)]
        else:
            throughactiontarget = throughactionball

        return [throughactiontarget, throughactionball][1]

    def getLegalStates(self, fromstate, throughactionbar):
        """ HelpDics are not affected, only the TransitionMatrixDic"""
        fromstatehash = self.getHashfromState(fromstate)
        actionstostateshashdict = {}

        throughaction = self.computeAgentActionsHashFromBarState(
            fromstate, throughactionbar)

        for tostatehash in self.transitionMatrixDic[fromstatehash][throughaction]:
            barFin, ballFin = self.getPositionAgentsInGridCoordfromHash(
                tostatehash)
            positions = [barFin] + ballFin
            current = fromstate
            for agentId in range(len(positions)):
                nxtstatepos = positions[agentId]
                if agentId == 0:
                    BarRules.movetoAnyState(current, nxtstatepos)
                else:
                    BallRules.movetoAnyState(current, nxtstatepos, agentId)
                successorelementhash = self.getHashfromState(
                    current)
                if agentId not in actionstostateshashdict:
                    actionstostateshashdict[agentId] = {}
                if successorelementhash not in actionstostateshashdict[agentId]:
                    actionstostateshashdict[agentId][successorelementhash] = self.transitionMatrixDic[
                        fromstatehash][throughaction][tostatehash]
                else:
                    actionstostateshashdict[agentId][successorelementhash] += self.transitionMatrixDic[fromstatehash][throughaction][tostatehash]

        return actionstostateshashdict

    def generateSuccessor(self, actionstostateshashdict):
        if actionstostateshashdict == {}:
            raise Exception('Can\'t generate a successor of a terminal state.')

        # random weighted choice
        actiontostatehash = random.choices(population=list(
            actionstostateshashdict.keys()), weights=list(actionstostateshashdict.values()), k=1)
        del actionstostateshashdict
        return actiontostatehash[0]

    def moveToPosition(self, state, pacaction, actiontostate, agentId):

        posingrid = self.keyDict[actiontostate].data.agentStates[agentId].getPosition(
        )
        newstate = state.movetoAnyState(
            self.keyDict[actiontostate], pacaction, agentId, posingrid)
        
        BallRules.checkstatus(state)
        return newstate
