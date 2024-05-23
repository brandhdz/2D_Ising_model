set title "Magnetization mean"

set xlabel "Beta"
set ylabel "|<M>|"

#set xrange[0.0:1000.0]
#set yrange[0.0:200.0]

pl '../data/START=cold,ALGORITHM=Metropolis,L=10/mean_values.dat' u 1:4, '../data/START=cold,ALGORITHM=Metropolis,L=30/mean_values.dat' u 1:4, '../data/START=cold,ALGORITHM=Metropolis,L=50/mean_values.dat' u 1:4, '../data/START=cold,ALGORITHM=Metropolis,L=80/mean_values.dat' u 1:4

#w l 
#t sprintf( "Markov time t = %i ", i)
