set title "Magnetization mean"

set xlabel "Beta"
set ylabel "|<M>|"

#set xrange[0.0:1000.0]
#set yrange[0.0:200.0]

pl '../data/START=cold,ALGORITHM=Metropolis,L=20/mean_values.dat' u 1:4,
