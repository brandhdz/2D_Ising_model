set title "Energy Density"
set xlabel "t_ϵ"
set ylabel "ϵ"
pl '../data/START=hot,ALGORITHM=Metropolis,L=100/beta=1.00000_measure.dat' u 0:1 w l, '../data/START=cold,ALGORITHM=Metropolis,L=100/beta=1.00000_measure.dat' u 0:1 w l

