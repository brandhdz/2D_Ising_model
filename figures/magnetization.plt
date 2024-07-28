#set terminal pdf
#set output "magnetization.pdf"

set title "Average Magnetization Density - Jackknife Error" font "Helvetica, 15"
#set key box width 2.5 height 1.2 opaque

set xlabel "β" font "Helvetica, 16"
set ylabel "<|m|>" font "Helvetica, 16"

#set xrange[0.0:15000.0]
#set yrange[0.0:4.0]

set grid 

#Standard_error
#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/magnetization_standard.dat' u 1:2:3 w yerrorbars t 'L = 100', '../data/START=cold,ALGORITHM=Metropolis,L=80/Mean_values/magnetization_standard.dat' u 1:2:3 w yerrorbars t 'L = 80', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/magnetization_standard.dat' u 1:2:3 w yerrorbars t 'L = 50', '../data/START=cold,ALGORITHM=Metropolis,L=30/Mean_values/magnetization_standard.dat' u 1:2:3 w yerrorbars t 'L = 30', '../data/START=cold,ALGORITHM=Metropolis,L=10/Mean_values/magnetization_standard.dat' u 1:2:3 w yerrorbars t 'L = 10'

#Block_error
#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/magnetization_block.dat' u 1:2:3 w yerrorbars t 'L = 100', '../data/START=cold,ALGORITHM=Metropolis,L=80/Mean_values/magnetization_block.dat' u 1:2:3 w yerrorbars t 'L = 80', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/magnetization_block.dat' u 1:2:3 w yerrorbars t 'L = 50', '../data/START=cold,ALGORITHM=Metropolis,L=30/Mean_values/magnetization_block.dat' u 1:2:3 w yerrorbars t 'L = 30', '../data/START=cold,ALGORITHM=Metropolis,L=10/Mean_values/magnetization_block.dat' u 1:2:3 w yerrorbars t 'L = 10'

#Bootstrap_error
#pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/magnetization_bootstrap.dat' u 1:2:3 w yerrorbars t 'L = 100', '../data/START=cold,ALGORITHM=Metropolis,L=80/Mean_values/magnetization_bootstrap.dat' u 1:2:3 w yerrorbars t 'L = 80', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/magnetization_bootstrap.dat' u 1:2:3 w yerrorbars t 'L = 50', '../data/START=cold,ALGORITHM=Metropolis,L=30/Mean_values/magnetization_bootstrap.dat' u 1:2:3 w yerrorbars t 'L = 30', '../data/START=cold,ALGORITHM=Metropolis,L=10/Mean_values/magnetization_bootstrap.dat' u 1:2:3 w yerrorbars t 'L = 10'

#Jackknife_error
pl '../data/START=cold,ALGORITHM=Metropolis,L=100/Mean_values/magnetization_jk.dat' u 1:2:3 w yerrorbars t 'L = 100', '../data/START=cold,ALGORITHM=Metropolis,L=80/Mean_values/magnetization_jk.dat' u 1:2:3 w yerrorbars t 'L = 80', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/magnetization_jk.dat' u 1:2:3 w yerrorbars t 'L = 50', '../data/START=cold,ALGORITHM=Metropolis,L=30/Mean_values/magnetization_jk.dat' u 1:2:3 w yerrorbars t 'L = 30', '../data/START=cold,ALGORITHM=Metropolis,L=10/Mean_values/magnetization_jk.dat' u 1:2:3 w yerrorbars t 'L = 10'