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

#training the model
for _ in range(100) :
    state = (0,0)
    while state != goal:
        action = random.choice(actions)
        new_state = move(state, action)
        reward = 10 if new_state == goal else (-5 if new_state in obstacles else -1)
        q[state][actions.index(action)] += 0.5 * (reward + 0.9 * np.max(q[new_state]) -q[state][action.index(action)])
        state = new_state

#testing
state, path = (0,0), [(0,0)]
while state  != goal:
    action = actions[np.argmax(q[state])]
    state = move(state,action)
    path.append(state)

#draw the path
grid = np.zeros((grid_size, grid_size))
for oba in obstacles :
    grid[obs] = -1
    grid[goal] = 2

plt.imshow(grid, cmap = "gray_r", origin ="upper")
for (x,y) in path:
    plt.text(y,x, "#", ha = "center", fontsize = 15, color ="red" if(x,y) != goal else "green"
plt.xticks(range(grid_size))
plt.yticks(range(grid_size))
plt.grid(True)
plt.show()

             
