#set terminal pdf
#set output "energy.pdf"
set title "Magnetization Density"
set xlabel "t_m"
set ylabel "m"
#set xrange[0.0:1000.0]
#set yrange[0.0:200.0]
pl '../data/START=hot,ALGORITHM=Metropolis,L=100/beta=0.41667_measure.dat' u 0:2 w l,

