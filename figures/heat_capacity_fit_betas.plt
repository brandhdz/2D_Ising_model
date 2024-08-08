#set terminal pdf
#set output "heat_capacity.pdf"

set title "Critical point β_c fit" font "Helvetica, 15"
#set key box width 2.5 height 1.2 opaque

set xlabel "β" font "Helvetica, 16"
set ylabel "L" font "Helvetica, 16"

#set xrange[0.35:0.55]
#set yrange[0.0:3.0]

set grid 

pl log(1+sqrt(2))/2 w l t 'β_c ≈ 0.44068679', '../data/heat_capacity_fit.dat' u 1:2:3 w yerrorbars lw 2 t '', '' u 1:2 w l t ''