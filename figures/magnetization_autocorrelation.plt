#set terminal pdf
#set output "mag_autocorrelation.pdf"
set title "Magnetization autocorrelation"
set xlabel "Markov time t"
set ylabel "χ_m(t)"
#set xrange[0.0:1.0]
set yrange[0.0:1.0]
pl '../data/START=hot,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=1.00000_magnetization_autocorrelation.dat' u 0:1 w l t "β=1.0, L=100"

