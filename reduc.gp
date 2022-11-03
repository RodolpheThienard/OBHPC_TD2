set terminal png
set xtics rotate by 45 right
set style fill solid 1 border 0
set style data histograms
set datafile separator ';'
set yrange [0:*]
set ylabel "Bandwidth (MiB/s)"
set xlabel "N"
set key font ",8"
set boxwidth 0.9

set title 'GCC'
set output "reduc_gcc".ARG2.".png"
plot 'data/reduc_gcc.dat' every 5::1 using 12:xtic(5) ti "base", \
'data/reduc_gcc.dat' every 5::2 using 12 ti 'unroll', \
'data/reduc_gcc.dat' every 5::3 using 12 ti 'asm', \
'data/reduc_gcc.dat' every 5::4 using 12 ti 'cblas', \

set title 'CLANG'
set output "reduc_clang".ARG2.".png"
plot 'data/reduc_gcc.dat' every 5::1 using 12:xtic(5) ti "base", \
'data/reduc_clang.dat' every 5::2 using 12 ti 'unroll', \
'data/reduc_clang.dat' every 5::3 using 12 ti 'asm', \
'data/reduc_clang.dat' every 5::4 using 12 ti 'cblas', \

set title 'ICX'
set output "reduc_icx".ARG2.".png"
plot 'data/reduc_icx.dat' every 5::1 using 12:xtic(5) ti "base", \
'data/reduc_icx.dat' every 5::2 using 12 ti 'unroll', \
'data/reduc_icx.dat' every 5::3 using 12 ti 'asm', \
'data/reduc_icx.dat' every 5::4 using 12 ti 'cblas', \

set terminal png 
set xtics norotate center 
set output ARG1 

set multiplot layout 2, 2 rowsfirst
set title 'base'
plot 'data/reduc_gcc.dat' every 5::1 using 12:xtic(5) t "gcc", \
     'data/reduc_clang.dat' every 5::1 using 12:xtic(5) t "clang", \
     'data/reduc_icx.dat' every 5::1 using 12:xtic(5) t "icx"

set title 'unroll'
plot 'data/reduc_gcc.dat' every 5::2 using 12:xtic(5) t "gcc",\
     'data/reduc_clang.dat' every 5::2 using 12:xtic(5) t "clang", \
     'data/reduc_icx.dat' every 5::2  using 12:xtic(5) t "icx"

set title 'asm'
plot 'data/reduc_gcc.dat' every 5::3 using 12:xtic(5) t "gcc",\
     'data/reduc_clang.dat' every 5::3  using 12:xtic(5) t "clang", \
     'data/reduc_icx.dat' every 5::3 using 12:xtic(5) t "icx"

set title 'cblas'
plot 'data/reduc_gcc.dat' every 5::4 using 12:xtic(5) t "gcc",\
     'data/reduc_clang.dat' every 5::4  using 12:xtic(5) t "clang", \
     'data/reduc_icx.dat' every 5::4 using 12:xtic(5) t "icx"
unset multiplot