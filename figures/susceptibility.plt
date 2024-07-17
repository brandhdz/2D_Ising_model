#set terminal pdf
#set output "susceptibility.pdf"
set title "Magnetic Susceptibility"
#set key box width 2.5 height 1.2 opaque
set xlabel "β"
set ylabel "χ"
pl '../data/START=cold,ALGORITHM=Metropolis,L=50/mean_values.dat' u 1:8:9 w yerrorbars t 'L=50 SE', '../data/START=cold,ALGORITHM=Metropolis,L=50/Mean_values/magnetization_block.dat' u 1:4:5 w yerrorbars t 'L=50 BE'
