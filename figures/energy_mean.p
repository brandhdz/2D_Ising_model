set title "Energy mean"

set xlabel "$\beta$"
set ylabel "<E>"

#set xrange[0.0:1000.0]
#set yrange[0.0:200.0]

pl "../data/START=cold,ALGORITHM=Metropolis,L=30/mean_values.dat" u 1:2:3 w yerrorbars lc rgb "red" t "Energy mean"

#'../data/START=cold,ALGORITHM=Metropolis,L=30/mean_values.dat' u 1:2, 
#'../data/ START=cold,ALGORITHM=Metropolis,L=50/mean_values.dat' u 1:2,
#'../data/START=cold,ALGORITHM=Metropolis,L=80/mean_values.dat' u 1:2