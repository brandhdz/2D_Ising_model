#set terminal pdf
#set output "energy.pdf"
set title "Average Energy Density"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "<ϵ>"

pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_standard.dat' u 1:2:3 w yerrorbars t 'L=100  Standard', '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_block.dat' u 1:2:3 w yerrorbars t 'L=100 Block', '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_bootstrap.dat' u 1:2:3 w yerrorbars t 'L=50 Bootstrap','../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/energy_jk.dat' u 1:2:3 w yerrorbars t 'L=100 Jackknife'

#pl '../data/START=hot,ALGORITHM=Metropolis,L=100/Mean_values/energy_standard.dat' u 1:2:3 w yerrorbars t 'L=100  Standard', '../data/START=hot,ALGORITHM=Metropolis,L=100/Mean_values/energy_block.dat' u 1:2:3 w yerrorbars t 'L=100 Block', '../data/START=hot,ALGORITHM=Metropolis,L=100/Mean_values/energy_bootstrap.dat' u 1:2:3 w yerrorbars t 'L=50 Bootstrap','../data/START=hot,ALGORITHM=Metropolis,L=100/Mean_values/energy_jk.dat' u 1:2:3 w yerrorbars t 'L=100 Jackknife'