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
set output "dotprod_gcc".ARG2.".png"
plot 'data/dotprod_gcc.dat' every 5::1 using 12:xtic(5) ti "base", \
'data/dotprod_gcc.dat' every 5::2 using 12 ti 'unroll', \
'data/dotprod_gcc.dat' every 5::3 using 12 ti 'asm', \
'data/dotprod_gcc.dat' every 5::4 using 12 ti 'cblas', \

set title 'CLANG'
set output "dotprod_clang".ARG2.".png"
plot 'data/dotprod_gcc.dat' every 5::1 using 12:xtic(5) ti "base", \
'data/dotprod_clang.dat' every 5::2 using 12 ti 'unroll', \
'data/dotprod_clang.dat' every 5::3 using 12 ti 'asm', \
'data/dotprod_clang.dat' every 5::4 using 12 ti 'cblas', \

set title 'ICX'
set output "dotprod_icx".ARG2.".png"
plot 'data/dotprod_icx.dat' every 5::1 using 12:xtic(5) ti "base", \
'data/dotprod_icx.dat' every 5::2 using 12 ti 'unroll', \
'data/dotprod_icx.dat' every 5::3 using 12 ti 'asm', \
'data/dotprod_icx.dat' every 5::4 using 12 ti 'cblas', \

set terminal png 
set xtics norotate center 
set output ARG1 

set multiplot layout 2, 2 rowsfirst
set title 'base'
plot 'data/dotprod_gcc.dat' every 5::1 using 12:xtic(5) t "gcc", \
     'data/dotprod_clang.dat' every 5::1 using 12:xtic(5) t "clang", \
     'data/dotprod_icx.dat' every 5::1 using 12:xtic(5) t "icx"

set title 'unroll'
plot 'data/dotprod_gcc.dat' every 5::2 using 12:xtic(5) t "gcc",\
     'data/dotprod_clang.dat' every 5::2 using 12:xtic(5) t "clang", \
     'data/dotprod_icx.dat' every 5::2  using 12:xtic(5) t "icx"

set title 'asm'
plot 'data/dotprod_gcc.dat' every 5::3 using 12:xtic(5) t "gcc",\
     'data/dotprod_clang.dat' every 5::3  using 12:xtic(5) t "clang", \
     'data/dotprod_icx.dat' every 5::3 using 12:xtic(5) t "icx"

set title 'cblas'
plot 'data/dotprod_gcc.dat' every 5::4 using 12:xtic(5) t "gcc",\
     'data/dotprod_clang.dat' every 5::4  using 12:xtic(5) t "clang", \
     'data/dotprod_icx.dat' every 5::4 using 12:xtic(5) t "icx"
unset multiplot