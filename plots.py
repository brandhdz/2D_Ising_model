import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mpl
#from cycler import cycler
#import scienceplots ""If necessary uncomment 
mpl.rcParams.update(mpl.rcParamsDefault)
plt.style.use(['science','grid'])

import os
import re

"""
This program is used for plot the results from the 2D Ising Model Fortran Program

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



def plot_measures(data, lattice,  fig, axes, all = True):


    ax1 = axes[0, 0]
    ax3 = axes[1, 0]
    ax2 = axes[0, 1]
    ax4 = axes[1, 1]

    beta = data[:,0]
    energy = data[:,1]
    heat_capacity = data[:,2]
    magnetization = data[:,3]
    sucep = data[:,4]
    lattice_label = lattice
    lattice = "$"+lattice+"$"

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
    
    fig.savefig('figures/Ising_Model_2D_StackedObservables.pdf')
    
def plot_measures_individual(data, lattice,  fig, axes, markerselect, observable = None ):
    """
    This function plots each individual observable given the data of a single lattice size.
    The function is the used in vectorized form to obtain stacked observables.

    """
    beta = data[:,0]
    energy = data[:,1]
    heat_capacity = data[:,2]
    magnetization = data[:,3]
    sucep = data[:,4]

    lattice = "$"+lattice+"$"
    if observable == 'Energy':
        
        axes.plot(beta, energy, marker = markerselect, ls = "", label = lattice, markersize = 0.7)
        axes.set_xlabel('$\\beta$')
        axes.set_ylabel('$\\langle \\vert E \\vert\\rangle$')
        axes.legend(fontsize=7)
    elif observable == 'HeatCapacity':
        axes.plot(beta,heat_capacity, marker = markerselect, ls = "", label = lattice, markersize = 0.7)
        axes.set_xlabel('$\\beta$')
        axes.set_ylabel('$C$')
        axes.legend(fontsize=7)
    elif observable == 'Magnetization':
        axes.plot(beta , magnetization, marker = markerselect, ls = "", label = lattice, markersize = 0.7)
        axes.set_xlabel('$\\beta$')
        axes.set_ylabel('$\\langle \\vert M \\vert\\rangle$')
        axes.legend(fontsize=7)
    elif observable == 'Suceptibility':
        axes.plot(beta , sucep,marker = markerselect,  ls = "",  label = lattice, markersize = 0.7)
        axes.set_xlabel('$\\beta$')
        axes.set_ylabel('$ \\chi$')
        axes.legend(fontsize=7)

    else: 
        raise TypeError("Observable not allowed")
    
    
    
    return fig, axes


fig, axes = plt.subplots(nrows=2, ncols=2, constrained_layout = True, figsize=(3.3*2 , 5))

fig1, ax1 = plt.subplots()
fig2, ax2 = plt.subplots()
fig3, ax3 = plt.subplots()
fig4, ax4 = plt.subplots()


labels =" "

markercycle = plt.cycler(marker=['o', '+', 'x', '*', '.', 'X'])
marker =['o', '+', 'x', '*', '.', 'X']
colorcycle = plt.rcParams["axes.prop_cycle"]


print(colorcycle * markercycle)
#ax2.set_prop_cycle(markercycle) 
i = 0
for L, pathFile  in lattice_dict_data.items():
    data = np.loadtxt(pathFile, delimiter = None)
    
    labels = labels + L
    plot_measures(data, L, fig, axes)
    plot_measures_individual(data, L,  fig1, ax1, marker[i], observable = "Energy")
    plot_measures_individual(data, L,  fig2, ax2, marker[i],  observable = "HeatCapacity")
    plot_measures_individual(data, L,  fig3, ax3, marker[i], observable = "Magnetization")
    plot_measures_individual(data, L,  fig4, ax4,  marker[i],  observable = "Suceptibility")
    i = i + 1
   

fig1.savefig('figures/ObsEnergy_for'+labels+'.pdf')
fig2.savefig('figures/ObsHeatCapacity_for'+labels+'.pdf')
fig3.savefig('figures/ObsMagnetization_for'+labels+'.pdf')
fig4.savefig('figures/ObsHeatSuceptibility_for'+labels+'.pdf')