set terminal png size 800,500 
set xtics rotate by 45 right
set style data histograms
set output 'curve.png'
set datafile separator ';'
set yrange [0:500]

set multiplot layout 3, 2 rowsfirst
plot 'data/IJK.dat' using 5:xtic(1) t "IJK"
plot 'data/IKJ.dat' using 5:xtic(1) t "IKJ"
plot 'data/IEX.dat' using 5:xtic(1) t "IEX"
plot 'data/UNROLL4.dat' using 5:xtic(1) t "UNROOL4"
plot 'data/UNROLL8.dat' using 5:xtic(1) t "UNROOL8"
plot 'data/CBLAS.dat' using 5:xtic(1) t "CBLAS"
unset multiplot