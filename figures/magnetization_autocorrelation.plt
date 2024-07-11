#set terminal pdf
#set output "mag_autocorrelation.pdf"

set title "Magnetization - Autocorrelation time"
set xlabel "Markov time t"
set ylabel "χ_m(t)"

#set xrange[0.0:1000.0]
set yrange[0.0:1.0]

#set log y

f(x) = exp(-x/T)
fit f(x) '../data/START=hot,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.50000_magnetization_autocorrelation.dat' u 0:1 via T

pl '../data/START=hot,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.50000_magnetization_autocorrelation.dat' u 0:1 w l t "β=0.5, L=100", f(x) t "τ = 336.988 +/- 2.137"