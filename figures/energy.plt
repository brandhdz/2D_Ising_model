set terminal png size 750, 500
set output "energy.png"
set title "Energy"
set xlabel "beta"
set ylabel "<E>"
 pl '../data/START=cold,ALGORITHM=Metropolis,L=50/mean_values.dat' u 1:2:3 w yerrorbars t 'L=50'
