#required libraries
import numpy as np
import random
import matplotlib.pyplot as plt

#setting up the grid
grid_size = 4
goal = (3,3)
obstacles = [(1,1),(2,2)]

#Actions & tables
actions = ["UP","Down","LEFT","RIGHT"]
q = np.zeros((grid_size, grid_size, len(actions)))
#q table is important for the learning process of the agent. it'll record all the actions and rewards to train the model. 

#submarine movements(actions)
def move(state,action):
    moves = {"UP" : (-1,0), "DOWN" : (1,0) "LEFT" : (0,-1), "RIGHT" : (0,1)}
    new_state = (state[0] + moves[action][0], state[1] + moves[action][1])
    return new_state if 0 <= new_state[0] < grid_size and 0 <= new_state[0] < grid_size and 0 <= new_state[1] < grid_size and
    new state not in obstacles else state
