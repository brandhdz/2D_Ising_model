#set terminal pdf
#set output "autocorrelation_time.pdf"

set title "Magnetization Autocorrelation Time L = 100" font "Helvetica, 15"
set xlabel "β" font "Helvetica, 16"
set ylabel "τ" font "Helvetica, 16"

set xrange[0.39:0.43]
#set yrange[0.0:1.0]

#set log y

set grid 

#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/autocorrelation_time_fit_L=100.dat' u 1:2:3 w yerrorbars lw 2 t "", '' u 1:2 w l t ""

pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Autocorrelations/autocorrelation_time_fit_L=100.dat' u 1:4:5 w yerrorbars lw 2 t "", '' u 1:4 w l t ""
