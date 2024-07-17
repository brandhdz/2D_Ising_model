#set terminal pdf
#set output "heat_capacity.pdf"
set title "Heat Capacity"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "C_ϵ"
pl '../data/START=cold,ALGORITHM=Metropolis,L=50/mean_values.dat' u 1:4:5 w yerrorbars t 'L=50 SE', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/energy_block.dat' u 1:4:5 w yerrorbars t 'L=50 BE'