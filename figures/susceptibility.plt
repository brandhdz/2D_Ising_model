set terminal png size 750, 500
set output "susceptibility.png"
set title "Susceptibility"
set xlabel "beta"
set ylabel "Chi"
 pl '../data/START=cold,ALGORITHM=Metropolis,L=50/mean_values.dat' u 1:7 t 'L=50'
