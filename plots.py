import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mpl
mpl.rcParams.update(mpl.rcParamsDefault)
plt.style.use(['science','grid'])

import os
import re

"""
This program is used for plot the results from the Ising Model Fortran Program

"""


rootdir = './data'
start = 'L='
end = '/mean_values.dat'



data_dir = []
lattice_list = []

#Looks for mean_values.dat data files in all subfolders
for subdir, dirs, files in os.walk(rootdir):
    for file in files:
        if re.search('mean_values.dat', file):
            #print(os.path.join(subdir, file))
            path_file_mean_value = os.path.join(subdir, file)
            data_dir.append(path_file_mean_value )
            
            lattice_size = re.search('%s(.*)%s' % (start, end), path_file_mean_value).group(1)
            lattice_size = start + lattice_size
            lattice_list.append(lattice_size)
print(lattice_list)
            

lattice_dict_data = dict(zip(lattice_list, data_dir))
print(lattice_dict_data)
#print(data_dir)

# Import the data

fig, axes = plt.subplots(nrows=2, ncols=2, constrained_layout = True, figsize=(3.3*2 , 5))


def plot_measures(data, lattice,  fig, axes):


    ax1 = axes[0, 0]
    ax3 = axes[1, 0]
    ax2 = axes[0, 1]
    ax4 = axes[1, 1]

    beta = data[:,0]
    energy = data[:,1]
    heat_capacity = data[:,2]
    magnetization = data[:,3]
    sucep = data[:,4]

    ax1.plot(beta, energy,"*", label = lattice, markersize = 0.7)
    ax1.set_xlabel('$\\beta$')
    ax1.set_ylabel('$\\langle \\vert E \\vert\\rangle$')
    ax1.legend(fontsize=7)
    
    ax2.plot(beta,heat_capacity,"*", label = lattice, markersize = 0.7)
    ax2.set_xlabel('$\\beta$')
    ax2.set_ylabel('$C$')
    ax2.legend(fontsize=7)
    
    ax3.plot(beta , magnetization,"*", label = lattice, markersize = 0.7)
    ax3.set_xlabel('$\\beta$')
    ax3.set_ylabel('$\\langle \\vert M \\vert\\rangle$')
    ax3.legend(fontsize=7)
    
    ax4.plot(beta , sucep, "*", label = lattice, markersize = 0.7)
    ax4.set_xlabel('$\\beta$')
    ax4.set_ylabel('$ \\chi$')
    ax4.legend(fontsize=7)
    
    fig.savefig('figures/Ising_Model_2D_Observables.pdf')


for L, pathFile  in lattice_dict_data.items():
    data = np.loadtxt(pathFile, delimiter = None)
    plot_measures(data, L, fig, axes)

    








#
