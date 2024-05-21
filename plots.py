import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mpl
mpl.rcParams.update(mpl.rcParamsDefault)
plt.style.use(['science','grid','muted'])



"""
This program is used for plot the results from the ODE Fortran Solver

"""
# Import the data
data = np.loadtxt('./data/beta_measures.dat', delimiter = None)

T = data[:,0]
M = data[:,1]


fig, ax = plt.subplots() 

ax.plot(T, M,"*", label = '$L=30$', markersize = 0.2)

ax.set_xlabel('$\\beta$')
ax.set_ylabel('$\\langle \\vert M \\vert\\rangle$')
ax.legend(fontsize=7)



fig.savefig('figures/magnetization.pdf')
