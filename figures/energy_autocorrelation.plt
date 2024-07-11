#set terminal pdf
#set output "energy_autocorrelation.pdf"
set title "Energy autocorrelation"
set xlabel "Markov time t"
set ylabel "χ_ϵ(t)"
#set xrange[0.0:1.0]
set yrange[0.0:1.0]
pl '../data/START=hot,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=1.00000_energy_autocorrelation.dat' u 0:1 w l t "β=1.0, L=100"