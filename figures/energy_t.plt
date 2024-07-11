#set terminal pdf
#set output "energy.pdf"
set title "Energy Density Thermalization"
set xlabel "t_ϵ"
set ylabel "ϵ"
#set xrange[0.0:1000.0]
set yrange[-2.0:2.0]
pl '../data/START=hot,ALGORITHM=Metropolis,L=100/Thermalization/beta=1.00000_measures.dat' u 0:1 w l t "β=1.0, L=100",
