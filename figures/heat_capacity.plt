#set terminal pdf
#set output "heat_capacity.pdf"
set title "Heat Capacity"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "C_ϵ"
pl '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_standard.dat' u 1:4:5 w yerrorbars t 'L=100  Standard', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_block.dat' u 1:4:5 w yerrorbars t 'L=50 Block', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_bootstrap.dat' u 1:4:5 w yerrorbars t 'L=50 Bootstrap', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_jk.dat' u 1:4:5 w yerrorbars t 'L=50 Jackknife'

#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_standard.dat' u 1:4:5 w yerrorbars t 'L=100  Standard',
#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_block.dat' u 1:4:5 w yerrorbars t 'L=100 Block',
#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_bootstrap.dat' u 1:4:5 w yerrorbars t 'L=100 Bootstrap',
#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_jk.dat' u 1:4:5 w yerrorbars t 'L=100 Jackknife'