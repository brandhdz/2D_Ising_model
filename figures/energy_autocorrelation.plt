#set terminal pdf
#set output "energy_autocorrelation.pdf"

set title "Energy - Autocorrelation time"
set xlabel "Markov time t"
set ylabel "χ_ϵ(t)"

#set xrange[0.0:500.0]
#set yrange[0.0:1.0]

#set log y

#f(x) = A*exp(-x/T)
#fit f(x) '../data/START=hot,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.50000_energy_autocorrelation.dat' u 0:1 via A, T

pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=1.00000_energy_autocorrelation.dat' u 0:1 w l t "β=0.25, L=100",
# f(x) t "τ = 182.675 +/- 2.866"
