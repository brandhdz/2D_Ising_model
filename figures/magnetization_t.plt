#set terminal pdf
#set output "energy.pdf"
set title "Magnetization Density Thermalization"
set xlabel "t_m"
set ylabel "m"
#set xrange[0.0:1000.0]
set yrange[0.0:1.0]
pl '../data/START=hot,ALGORITHM=Metropolis,L=100/Thermalization/beta=0.60000_measures.dat' u 0:2 w l t "β=0.43, L=100",
