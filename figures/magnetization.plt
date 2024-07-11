set terminal png size 1200, 800
set output "magnetization.png"
set title "Average Magnetization Density"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "|<m>|"
pl \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6 w l t 'L=30' , \
  '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=hot,ALGORITHM=Metropolis,L=100/mean_values.dat' u 1:6:7 w yerrorbars t 'L=100' , \
 '../data/START=cold,ALGORITHM=Metropolis,L=10/mean_values.dat' u 1:6:7 w yerrorbars t 'L=10' , \
