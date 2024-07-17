#set terminal pdf
#set output "magnetization.pdf"
set title "Average Magnetization Density"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "<|m|>"
pl '../data/START=cold,ALGORITHM=Metropolis,L=50/mean_values.dat' u 1:6:7 w yerrorbars t 'L=50 SE', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/magnetization_block.dat' u 1:2:3 w yerrorbars t 'L=50 BE'
