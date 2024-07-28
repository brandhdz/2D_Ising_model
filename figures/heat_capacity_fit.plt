#set terminal pdf
#set output "heat_capacity.pdf"

set title "Heat Capacity, β_c fit" font "Helvetica, 15"
#set key box width 2.5 height 1.2 opaque

set xlabel "β" font "Helvetica, 16"
set ylabel "C_ϵ" font "Helvetica, 16"

set xrange[0.35:0.55]
#set yrange[0.0:3.0]

set grid 

f(x) = B*C**2*log(abs(1-C/x))+A
B = -2.5
C = 0.4
fit f(x) '../data/START=cold,ALGORITHM=Metropolis,L=150/Mean_values/energy_jk.dat' every::35::55 u 1:4 via A, B, C

pl '../data/START=cold,ALGORITHM=Metropolis,L=150/Mean_values/energy_jk.dat' every::35::55 u 1:4:5 w yerrorbars t 'L = 150', f(x) t 'β_c = 0.440122 +/- 0.0005735', 4/pi*(log(1+sqrt(2))/2)**2*(3*log(2)-pi/2-log(4*(x-log(1+sqrt(2))/2)**2))-4/pi*(log(1+sqrt(2))/2)**2*(3*log(2)-pi/2-log(4*(log(1+sqrt(2))/2)**2)) t "Onsager"