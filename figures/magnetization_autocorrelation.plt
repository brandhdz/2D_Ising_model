#set terminal pdf
#set output "mag_autocorrelation.pdf"

set title "Magnetization - Autocorrelation time"
set xlabel "Markov time t"
set ylabel "χ_m(t)"

#set xrange[0.0:1000.0]
#set yrange[0.0:1.0]

#set log y

#f(x) = A*exp(-x/T)
#fit f(x) '../data/START=cold,ALGORITHM=Metropolis,L=50/Autocorrelations/beta=0.45455_magnetization_autocorrelation.dat' u 0:1 via A, T

pl '../data/START=cold,ALGORITHM=Metropolis,L=50/Autocorrelations/beta=1.00000_magnetization_autocorrelation.dat' u 0:1 w l t "β=0.65, L=50"
#, f(x) t "τ = 336.988 +/- 2.137"