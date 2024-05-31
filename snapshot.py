#%matplotlib inline
# Simulating the Ising model
from __future__ import division
import numpy as np
from numpy.random import rand
import matplotlib.pyplot as plt

import os
import re


class Ising():
    ''' Simulating the Ising model '''    
    ## monte carlo moves
    def mcmove(self, config, N, beta):
        ''' This is to execute the monte carlo moves using 
        Metropolis algorithm such that detailed
        balance condition is satisified'''
        for i in range(N):
            for j in range(N):            
                    a = np.random.randint(0, N)
                    b = np.random.randint(0, N)
                    s =  config[a, b]
                    nb = config[(a+1)%N,b] + config[a,(b+1)%N] + config[(a-1)%N,b] + config[a,(b-1)%N]
                    cost = 2*s*nb
                    if cost < 0:	
                        s *= -1
                    elif rand() < np.exp(-cost*beta):
                        s *= -1
                    config[a, b] = s
        return config
    
    def simulate(self):   
        ''' This module simulates the Ising model'''
        N, temp     = 10, .4        # Initialse the lattice
        config = 2*np.random.randint(2, size=(N,N))-1
      
        f = plt.figure(figsize=(15, 15), dpi=80);    
        self.configPlot(f, config, 0, N, 1);
        
        msrmnt = 1001
        for i in range(msrmnt):
            self.mcmove(config, N, 1.0/temp)
            print(config)
            if i == 1:       self.configPlot(f, config, i, N, 2);
            if i == 4:       self.configPlot(f, config, i, N, 3);
            if i == 32:      self.configPlot(f, config, i, N, 4);
            if i == 100:     self.configPlot(f, config, i, N, 5);
            if i == 1000:    self.configPlot(f, config, i, N, 6);
                 
        f.savefig('figures/Ising_Snapshot.pdf')         
    def configPlot(self, f, config, i, N, n_):
        ''' This modules plts the configuration once passed to it along with time etc '''
        X, Y = np.meshgrid(range(N), range(N))
        sp =  f.add_subplot(3, 3, n_ )  
        plt.setp(sp.get_yticklabels(), visible=False)
        plt.setp(sp.get_xticklabels(), visible=False)      
        plt.pcolormesh(X, Y, config, cmap=plt.cm.RdBu);
        plt.title('Time=%d'%i); plt.axis('tight')    
    plt.show()

rootdir = './data'

start = 'beta='
end = '.dat'



#pathfile = rootdir + 
data_dir = []
fig = plt.figure(figsize=(15, 15), dpi=80);    


for subdir, dirs, files in os.walk(rootdir):
    for file in files:
        if re.search('snapshot_', file):
            path_file_snaps = os.path.join(subdir, file)
            data_dir.append(path_file_snaps)

#print(data_dir)
pathFile =data_dir[10]

#print(pathFile)
data = np.loadtxt(pathFile, delimiter = None, dtype ='int')

#print(len(data))

config = np.delete(data[500],0) 
B = np.reshape(config, (-1, 30))
print(B)
N = len(B)
X, Y = np.meshgrid(range(N), range(N))
plt.pcolormesh(X, Y, B, cmap=plt.cm.RdBu)
fig.savefig('figures/Ising_Snapshot.pdf')         
#print(config)
#rm = Ising()
#rm.simulate()