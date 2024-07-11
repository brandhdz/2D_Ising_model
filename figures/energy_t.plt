#set terminal pdf
#set output "energy.pdf"
set title "Energy Density"
set xlabel "t_ϵ"
set ylabel "ϵ"
#set xrange[0.0:1000.0]
#set yrange[0.0:200.0]
pl '../data/START=hot,ALGORITHM=Metropolis,L=100/beta=0.41667_measure.dat' u 0:1 w l,
