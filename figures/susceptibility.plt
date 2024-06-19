set terminal png size 1200, 800
set output "susceptibility.png"
set title "Magnetic Susceptibility"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "χ"
pl \ '../data/START=cold,ALGORITHM=Metropolis,L=30/mean_values.dat' u 1:8:9 w yerrorbars t 'L=30' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=120/mean_values.dat' u 1:8:9 w yerrorbars t 'L=120' , \
