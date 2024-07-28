#set terminal pdf
#set output "heat_capacity.pdf"

set title "Heat Capacity - Jackknife Error" font "Helvetica, 15"
#set key box width 2.5 height 1.2 opaque

set xlabel "β" font "Helvetica, 16"
set ylabel "C_ϵ" font "Helvetica, 16"

#set xrange[0.0:15000.0]
set yrange[0.0:3.0]

set grid 

#Standard_error
#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_standard.dat' u 1:4:5 w yerrorbars t 'L = 100', '../data/START=cold,ALGORITHM=Metropolis,L=80/Mean_values/energy_standard.dat' u 1:4:5 w yerrorbars t 'L = 80', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_standard.dat' u 1:4:5 w yerrorbars t 'L = 50', '../data/START=cold,ALGORITHM=Metropolis,L=30/Mean_values/energy_standard.dat' u 1:4:5 w yerrorbars t 'L = 30', '../data/START=cold,ALGORITHM=Metropolis,L=10/Mean_values/energy_standard.dat' u 1:4:5 w yerrorbars t 'L = 10'

#Block_error
#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_block.dat' u 1:4:5 w yerrorbars t 'L = 100', '../data/START=cold,ALGORITHM=Metropolis,L=80/Mean_values/energy_block.dat' u 1:4:5 w yerrorbars t 'L = 80', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_block.dat' u 1:4:5 w yerrorbars t 'L = 50', '../data/START=cold,ALGORITHM=Metropolis,L=30/Mean_values/energy_block.dat' u 1:4:5 w yerrorbars t 'L = 30', '../data/START=cold,ALGORITHM=Metropolis,L=10/Mean_values/energy_block.dat' u 1:4:5 w yerrorbars t 'L = 10'

#Bootstrap_error
#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_bootstrap.dat' u 1:4:5 w yerrorbars t 'L = 100', '../data/START=cold,ALGORITHM=Metropolis,L=80/Mean_values/energy_bootstrap.dat' u 1:4:5 w yerrorbars t 'L = 80', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_bootstrap.dat' u 1:4:5 w yerrorbars t 'L = 50', '../data/START=cold,ALGORITHM=Metropolis,L=30/Mean_values/energy_bootstrap.dat' u 1:4:5 w yerrorbars t 'L = 30', '../data/START=cold,ALGORITHM=Metropolis,L=10/Mean_values/energy_bootstrap.dat' u 1:4:5 w yerrorbars t 'L = 10'

#Jackknife_error
pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_jk.dat' u 1:4:5 w yerrorbars t 'L = 100', '../data/START=cold,ALGORITHM=Metropolis,L=80/Mean_values/energy_jk.dat' u 1:4:5 w yerrorbars t 'L = 80', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_jk.dat' u 1:4:5 w yerrorbars t 'L = 50', '../data/START=cold,ALGORITHM=Metropolis,L=30/Mean_values/energy_jk.dat' u 1:4:5 w yerrorbars t 'L = 30', '../data/START=cold,ALGORITHM=Metropolis,L=10/Mean_values/energy_jk.dat' u 1:4:5 w yerrorbars t 'L = 10'