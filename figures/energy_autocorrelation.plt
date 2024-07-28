#set terminal pdf
#set output "energy_autocorrelation.pdf"

set title "Energy Autocorrelation L = 100" font "Helvetica, 15"
set xlabel "Markov time t" font "Helvetica, 16"
set ylabel "χ_ϵ(t)" font "Helvetica, 16"

set xrange[0.0:2500.0]
#set yrange[0.0:1.0]

#set log y

set grid 

f(x) = exp(-x/T)
fit f(x) '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.43434_energy_autocorrelation.dat' u 0:1 via T

#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.43434_energy_autocorrelation.dat' u 0:1 w l t "β=0.43, L=100", f(x) t "τ = 201.345 +/- 4.292"

pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.20202_energy_autocorrelation.dat' every ::0::20 u 0:1 w l t "L = 100", '../data/START=cold,ALGORITHM=Metropolis,L=80/Autocorrelations/beta=0.20202_energy_autocorrelation.dat' every ::0::20 u 0:1 w l t "L = 80", '../data/START=cold,ALGORITHM=Metropolis,L=50/Autocorrelations/beta=0.20202_energy_autocorrelation.dat' every ::0::20 u 0:1 w l t "L = 50",'../data/START=cold,ALGORITHM=Metropolis,L=30/Autocorrelations/beta=0.20202_energy_autocorrelation.dat' every ::0::20 u 0:1 w l t "L = 30",'../data/START=cold,ALGORITHM=Metropolis,L=10/Autocorrelations/beta=0.20202_energy_autocorrelation.dat' every ::0::20 u 0:1 w l t "L = 10"

#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.65657_energy_autocorrelation.dat' every ::0::20 u 0:1 w l t "L = 100", '../data/START=cold,ALGORITHM=Metropolis,L=80/Autocorrelations/beta=0.65657_energy_autocorrelation.dat' every ::0::20 u 0:1 w l t "L = 80", '../data/START=cold,ALGORITHM=Metropolis,L=50/Autocorrelations/beta=0.65657_energy_autocorrelation.dat' every ::0::20 u 0:1 w l t "L = 50",'../data/START=cold,ALGORITHM=Metropolis,L=30/Autocorrelations/beta=0.65657_energy_autocorrelation.dat' every ::0::20 u 0:1 w l t "L = 30",'../data/START=cold,ALGORITHM=Metropolis,L=10/Autocorrelations/beta=0.65657_energy_autocorrelation.dat' every ::0::20 u 0:1 w l t "L = 10"

pl  '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.39394_energy_autocorrelation.dat' every ::0::2500 u 0:1 w l t "β = 0.39", '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.40404_energy_autocorrelation.dat' every ::0::2500 u 0:1 w l t "β = 0.40", '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.41414_energy_autocorrelation.dat' every ::0::2500 u 0:1 w l t "β = 0.41", '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.42424_energy_autocorrelation.dat' every ::0::2500 u 0:1 w l t "β = 0.42", '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/beta=0.43434_energy_autocorrelation.dat' every ::0::2500 u 0:1 w l t "β = 0.43"