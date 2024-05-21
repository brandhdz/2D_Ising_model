import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mpl
mpl.rcParams.update(mpl.rcParamsDefault)
plt.style.use(['science','grid'])



"""
This program is used for plot the results from the ODE Fortran Solver

"""
# Import the data
data = np.loadtxt('./data/mean_values.dat', delimiter = None)


#print(os.path.dirname(__file__))
beta = data[:,0]
energy = data[:,1]
heat_capacity = data[:,2]
magnetization = data[:,3]
sucep = data[:,4]




fig, axes = plt.subplots(nrows=2, ncols=2, constrained_layout = True, figsize=(3.3*2 , 5))

ax1 = axes[0, 0]
ax3 = axes[1, 0]
ax2 = axes[0, 1]
ax4 = axes[1, 1]

ax1.plot(beta, energy,"*", label = '$L=30$', markersize = 0.7)

ax1.set_xlabel('$\\beta$')
ax1.set_ylabel('$\\langle \\vert E \\vert\\rangle$')
ax1.legend(fontsize=7)

#####

ax2.plot(beta,heat_capacity,"*", label = '$L=30$', markersize = 0.7)

ax2.set_xlabel('$\\beta$')
ax2.set_ylabel('$C$')
ax2.legend(fontsize=7)



#####

ax3.plot(beta , magnetization,"*", label = '$L=30$', markersize = 0.7)

ax3.set_xlabel('$\\beta$')
ax3.set_ylabel('$\\langle \\vert M \\vert\\rangle$')
ax3.legend(fontsize=7)



#####

ax4.plot(beta , sucep, "*", label = '$L=30$', markersize = 0.7)

ax4.set_xlabel('$\\beta$')
ax4.set_ylabel('$ \\chi$')
ax4.legend(fontsize=7)



fig.savefig('figures/Ising_Model_2D_Observables.pdf')
