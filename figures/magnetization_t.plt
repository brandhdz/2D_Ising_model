set title "Magnetization Density"
set xlabel "t_m"
set ylabel "m"
pl '../data/START=hot,ALGORITHM=Metropolis,L=100/beta=0.50000_measure.dat' u 0:2 w l, '../data/START=cold,ALGORITHM=Metropolis,L=100/beta=0.50000_measure.dat' u 0:2 w l

