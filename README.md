# 2D Ising Model

This repository implements a numerical simulation for the Ising model in 2D adopting the Markov chain Monte Carlo approach.

The energy is given by

$$
H=-\frac{J}{2}\sum_{<i,j>}\sigma_{i}sigma_{j}
$$ 

where $\sum_{<i,j>}\$ is the sum over all the neighbor particles, $\sigma_{i}$ is the spin of the i-th particle which only can take +1 and -1 values and $J$ is an interaction constant  (we are assuming $\J = 1$). 

### Lattice

We will consider a square lattice $L\times L$ with the spins positions given by $s_{i,j}$. The Hamiltonian in a configuration of spins $S={s_{i,j}}$ is then

$$
H(S)=-\frac{J}{2}\sum_{i,j\in L \times L}s_{i,j}(s_{i+1,j}+s_{i-1,j}+s_{i,j+1}+s_{i,j-1})
$$

where we are assuming periodic boundary conditions $s_{i+L,j}=s_{i,j},s_{i,j+L}=s_{i,j}$.

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
start = "cold",
algorithm = "Metropolis",
N_thermalization = 1000,
N_measurements= 1000,
N_skip = 10,
a = 0,
b = 1,
N_beta = 100,
/
```

To run the program execute the following line in the terminal:
```
make run
```
To clean the data directory the program executes the following line in the terminal:
```
make clean
```
To plot the data created in the data directory execute the following line in the terminal:
```
make plot
```