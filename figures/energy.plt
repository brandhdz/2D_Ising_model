set terminal png 1200, 800
set output "energy.png"
set title "Average Energy Density"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "<ϵ>"
pl \
'../data/START=cold,ALGORITHM=Metropolis,L=30/mean_values.dat' u 1:2:3 w yerrorbars t 'L=30' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=120/mean_values.dat' u 1:2:3 w yerrorbars t 'L=120'  '../data/START=cold,ALGORITHM=Metropolis,L=10/mean_values.dat' u 1:2:3 w yerrorbars t 'L=10' , \
