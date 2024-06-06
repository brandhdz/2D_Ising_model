set terminal png size 750, 500
set output "energy.png"
set title "Energy mean"
set xlabel "beta"
set ylabel "<E>" 
pl '../data/START=cold,ALGORITHM=Metropolis,L=30/mean_values.dat' u 1:2:3 w yerrorbars t 'L=30'
