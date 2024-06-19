set terminal png size 1200, 800
set output "heat_capacity.png"
set title "Heat Capacity"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "C_ϵ"
pl \
 '../data/START=cold,ALGORITHM=Metropolis,L=30/mean_values.dat' u 1:4:5 w yerrorbars t 'L=30' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=120/mean_values.dat' u 1:4:5 w yerrorbars t 'L=120' , \
