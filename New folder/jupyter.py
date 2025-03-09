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
