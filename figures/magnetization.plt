#set terminal pdf
#set output "magnetization.pdf"
set title "Average Magnetization Density"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "<|m|>"
pl '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/magnetization_standard.dat' u 1:2:3 w yerrorbars t 'L=50  Standard', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/magnetization_block.dat' u 1:2:3 w yerrorbars t 'L=50 Block', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/magnetization_bootstrap.dat' u 1:2:3 w yerrorbars t 'L=50 Bootstrap', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/magnetization_jk.dat' u 1:2:3 w yerrorbars t 'L=150 Jackknife'