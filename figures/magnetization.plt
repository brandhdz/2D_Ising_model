set terminal png size 750, 500
set output "magnetization.png"
set title "Magnetization mean"
set xlabel "beta"
set ylabel "|<M>|" pl '../data/START=cold,ALGORITHM=Metropolis,L=50/mean_values.dat' u 1:5:6 w yerrorbars t 'L=50'
