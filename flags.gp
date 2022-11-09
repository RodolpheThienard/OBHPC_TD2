set terminal png size 1920,1080
set xtics rotate by 45 right
set style fill solid 1 border 0
set style data histograms
set datafile separator ';'
set yrange [0:*]
set ylabel "Bandwidth (MiB/s)"
set xlabel "N"
# set key font ""
set boxwidth 0.9
set xtics norotate center 

set output 'dgemm_gcc_flags.png' 

set multiplot layout 2,2 rowsfirst

set title 'O0'
plot \
'data/dgemm_gcc/O0.dat' every 7::1 using 11:xtic(5) ti "IJK i7-1165G7", \
'data/dgemm_gcc/O0.dat' every 7::2 using 11 ti "IKJ i7-1165G7", \
'data/dgemm_gcc/O0.dat' every 7::3 using 11 ti "IEX i7-1165G7", \
'data/dgemm_gcc/O0.dat' every 7::4 using 11 ti 'unroll4 i7-1165G7', \
'data/dgemm_gcc/O0.dat' every 7::5 using 11 ti 'unroll8 i7-1165G7', \
'data/dgemm_gcc/O0.dat' every 7::6 using 11 ti 'cblas i7-1165G7'

set title 'O1'
plot \
'data/dgemm_gcc/O1.dat' every 7::1 using 11:xtic(5) ti "IJK i7-1165G7", \
'data/dgemm_gcc/O1.dat' every 7::2 using 11 ti "IKJ i7-1165G7", \
'data/dgemm_gcc/O1.dat' every 7::3 using 11 ti "IEX i7-1165G7", \
'data/dgemm_gcc/O1.dat' every 7::4 using 11 ti 'unroll4 i7-1165G7', \
'data/dgemm_gcc/O1.dat' every 7::5 using 11 ti 'unroll8 i7-1165G7', \
'data/dgemm_gcc/O1.dat' every 7::6 using 11 ti 'cblas i7-1165G7'

set title 'O2'
plot \
'data/dgemm_gcc/O2.dat' every 7::1 using 11:xtic(5) ti "IJK i7-1165G7", \
'data/dgemm_gcc/O2.dat' every 7::2 using 11 ti "IKJ i7-1165G7", \
'data/dgemm_gcc/O2.dat' every 7::3 using 11 ti "IEX i7-1165G7", \
'data/dgemm_gcc/O2.dat' every 7::4 using 11 ti 'unroll4 i7-1165G7', \
'data/dgemm_gcc/O2.dat' every 7::5 using 11 ti 'unroll8 i7-1165G7', \
'data/dgemm_gcc/O2.dat' every 7::6 using 11 ti 'cblas i7-1165G7'

set title 'O3'
plot \
'data/dgemm_gcc/O3.dat' every 7::1 using 11:xtic(5) ti "IJK i7-1165G7", \
'data/dgemm_gcc/O3.dat' every 7::2 using 11 ti "IKJ i7-1165G7", \
'data/dgemm_gcc/O3.dat' every 7::3 using 11 ti "IEX i7-1165G7", \
'data/dgemm_gcc/O3.dat' every 7::4 using 11 ti 'unroll4 i7-1165G7', \
'data/dgemm_gcc/O3.dat' every 7::5 using 11 ti 'unroll8 i7-1165G7', \
'data/dgemm_gcc/O3.dat' every 7::6 using 11 ti 'cblas i7-1165G7'

unset multiplot

set output 'dotprod_gcc_flags.png' 

set multiplot layout 2,2 rowsfirst

set title 'O0'
plot \
'data/dotprod_gcc/O0.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/dotprod_gcc/O0.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/dotprod_gcc/O0.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/dotprod_gcc/O0.dat' every 5::4 using 12 ti 'cblas i7-1165G7'

set title 'O1'
plot \
'data/dotprod_gcc/O1.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/dotprod_gcc/O1.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/dotprod_gcc/O1.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/dotprod_gcc/O1.dat' every 5::4 using 12 ti 'cblas i7-1165G7'

set title 'O2'
plot \
'data/dotprod_gcc/O2.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/dotprod_gcc/O2.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/dotprod_gcc/O2.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/dotprod_gcc/O2.dat' every 5::4 using 12 ti 'cblas i7-1165G7'

set title 'O3'
plot \
'data/dotprod_gcc/O3.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/dotprod_gcc/O3.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/dotprod_gcc/O3.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/dotprod_gcc/O3.dat' every 5::4 using 12 ti 'cblas i7-1165G7'


unset multiplot

set output 'reduc_gcc_flags.png' 

set multiplot layout 2,2 rowsfirst

set title 'O0'
plot \
'data/reduc_gcc/O0.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/reduc_gcc/O0.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/reduc_gcc/O0.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/reduc_gcc/O0.dat' every 5::4 using 12 ti 'cblas i7-1165G7'

set title 'O1'
plot \
'data/reduc_gcc/O1.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/reduc_gcc/O1.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/reduc_gcc/O1.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/reduc_gcc/O1.dat' every 5::4 using 12 ti 'cblas i7-1165G7'

set title 'O2'
plot \
'data/reduc_gcc/O2.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/reduc_gcc/O2.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/reduc_gcc/O2.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/reduc_gcc/O2.dat' every 5::4 using 12 ti 'cblas i7-1165G7'

set title 'O3'
plot \
'data/reduc_gcc/O3.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/reduc_gcc/O3.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/reduc_gcc/O3.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/reduc_gcc/O3.dat' every 5::4 using 12 ti 'cblas i7-1165G7'

unset multiplot