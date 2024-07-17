#set terminal pdf
#set output "energy.pdf"
set title "Average Energy Density"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "<ϵ>"
pl '../data/START=cold,ALGORITHM=Metropolis,L=50/mean_values.dat' u 1:2:3 w yerrorbars t 'L=50 SE', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_block.dat' u 1:2:3 w yerrorbars t 'L=50 BE', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_bootstrap.dat' u 1:2:3 w yerrorbars t 'L=50 BSE'
