set terminal png size 750, 500
set output "heat_capacity.png"
set title "Heat Capacity"
set xlabel "beta"
set ylabel "C" pl '../data/START=cold,ALGORITHM=Metropolis,L=50/mean_values.dat' u 1:4 t 'L=50'
