#set terminal pdf
#set output "mag_autocorrelation.pdf"
set title "Magnetization autocorrelation"
set xlabel "time t"
set ylabel "χ_m(t)"
#set xrange[0.0:1.0]
#set yrange[0.0:1.0]
pl '../autocorrelation_m.dat' u 0:1 w l, '../autocorrelation.dat' u 0:1 w l,
# '../autocorrelation_p.dat' u 0:1 w l

