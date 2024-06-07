# 2D Ising Model

This repository implements a numerical simulation for the Ising model in 2D adopting the Markov chain Monte Carlo approach.

The energy is given by

$$
H=-\frac{J}{2}\sum_{\langle i,j\rangle}\sigma_{i}\sigma_{j}
$$ 

where $\sum_{\langle i,j\rangle}\$ is the sum over all the neighbor particles, $\sigma_{i}$ is the spin of the $i$-th particle which only can take $+1$ and $-1$ values and $J$ is an interaction constant  (we are assuming $J = 1$). 

### Lattice

We will consider a square lattice $L\times L = \Lambda$ with the spins positions given by $s_{i,j}$. The Hamiltonian in a configuration of spins $[S]={s_{i,j}}$ is then

$$
H([S])=-\frac{J}{2}\sum_{i,j\in \Lambda}s_{i,j}(s_{i+1,j}+s_{i,j+1})
$$

where we are assuming periodic boundary conditions $s_{i+L,j}=s_{i,j},s_{i,j+L}=s_{i,j}$.

In addition we can get the magnetization as

$$
M([S]) = \frac{1}{L}\sum_{i,j\in \Lambda}s_{i,j},
$$

and using the results to obtain the heat capacity as

$$
\begin{equation}
    C_{E} = \frac{\langle E^{2} \rangle - \langle E \rangle ^{2}}{\beta^2}
\end{equation}
$$

where $\beta=\frac{1}{\kappa_{B}T}$ (also in this program we are assuming $\kappa_{B}=1$), and the susceptibility as

$$
\begin{equation}
    \chi = L^{2}*(\langle M^{2} \rangle - \langle M \rangle ^{2}).
\end{equation}
$$

<br/>

### Repo Contains
```
.
├─ install.sh
├─ Makefile
├── bin
├── src 
│   ├── str_conv.f90 (Module for converting integer and real values in strings) 
│   ├── parameters.f90 (Module where define parameters) 
│   ├── arrays.f90 (Module for defining the lattice) 
│   ├── init.f90 (Module to initialize the lattice (constant or randomly values )) 
│   ├── periodic_boundary_conditions.f90 (Module for implementing the periodic boundary conditions)
│   ├── energy.f90 (Module to calculate energy, the energy mean, and heat capacity)  
│   ├── observables.f90 (Module to calculate magnetization, magnetization mean, and susceptibility)  
│   ├── local_update_algorithms.f90 (Module that contains the Metropolis and Glauber algorithms)
│   ├── dynamics.f90 (Principal module created to get measures)
│   ├── main.f90 (Main program)  
├── data (folder to store the output data)
├── figures (folder to store output plots)


  
```

# Usage and Compilation

-----------

The main code is standard Fortran 90 and can be compiled
with any standard f90 conforming compiler.

## Intitial Conditions

To install the program execute the following line in the terminal:

```
./install.sh
```

Now you can modify the ``parameters.dat`` file to enter different settings for the input parameters. The default ones are: 

```
&input_parameters
L = 30,
start = "cold" ("hot"),
algorithm = "Metropolis" ("Glauber"),
N_thermalization = 1000,
N_measurements= 1000,
N_skip = 10,
a = 0 (start range of beta values),
b = 1 (end range of beta values),
N_beta = 100 (number of beta values),
/
```

To run the program execute the following line in the terminal:
```
make run
```
To clean the data directory execute the following line in the terminal:
```
make clean
```
To plot the data created in the data directory execute the following line in the terminal:
```
make plot
```