set title "Susceptibility"

set xlabel "Beta"
set ylabel "Chi"

#set xrange[0.0:1000.0]
#set yrange[0.0:200.0]

pl '../data/mean_values.dat' u 1:5
#w l 
#t sprintf( "Markov time t = %i ", i)
