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
set output "dgemm_gcc".ARG1.".png"
plot \
'data/dgemm_gcc_'.ARG1.'.dat' every 7::1 using 12:xtic(5) ti "IJK", \
'data/dgemm_gcc_'.ARG1.'.dat' every 7::2 using 12 ti 'IKJ', \
'data/dgemm_gcc_'.ARG1.'.dat' every 7::3 using 12 ti 'IEX', \
'data/dgemm_gcc_'.ARG1.'.dat' every 7::4 using 12 ti 'UNROLL4', \
'data/dgemm_gcc_'.ARG1.'.dat' every 7::5 using 12 ti 'UNROLL8', \
'data/dgemm_gcc_'.ARG1.'.dat' every 7::6 using 12 ti 'CBLAS', \
'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::1 using 12 ti "IJK i5-3570", \
'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::2 using 12 ti 'IKJ i5-3570', \
'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::3 using 12 ti 'IEX i5-3570', \
'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::4 using 12 ti 'UNROLL4 i5-3570', \
'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::5 using 12 ti 'UNROLL8 i5-3570', \
'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::6 using 12 ti 'CBLAS i5-3570'

set title 'CLANG'
set output "dgemm_clang".ARG1.".png"
plot \
'data/dgemm_clang_'.ARG1.'.dat' every 7::1 using 12:xtic(5) ti "IJK i7-1165G7", \
'data/dgemm_clang_'.ARG1.'.dat' every 7::2 using 12 ti 'IKJ i7-1165G7', \
'data/dgemm_clang_'.ARG1.'.dat' every 7::3 using 12 ti 'IEX i7-1165G7', \
'data/dgemm_clang_'.ARG1.'.dat' every 7::4 using 12 ti 'UNROLL4 i7-1165G7', \
'data/dgemm_clang_'.ARG1.'.dat' every 7::5 using 12 ti 'UNROLL8 i7-1165G7', \
'data/dgemm_clang_'.ARG1.'.dat' every 7::6 using 12 ti 'CBLAS i7-1165G7', \
'output/data/dgemm_clang'.ARG1.'.dat' every 7::1 using 12 ti "IJK i5-3570", \
'output/data/dgemm_clang'.ARG1.'.dat' every 7::2 using 12 ti 'IKJ i5-3570', \
'output/data/dgemm_clang'.ARG1.'.dat' every 7::3 using 12 ti 'IEX i5-3570', \
'output/data/dgemm_clang'.ARG1.'.dat' every 7::4 using 12 ti 'UNROLL4 i5-3570', \
'output/data/dgemm_clang'.ARG1.'.dat' every 7::5 using 12 ti 'UNROLL8 i5-3570', \
'output/data/dgemm_clang'.ARG1.'.dat' every 7::6 using 12 ti 'CBLAS i5-3570'

set title 'ICX'
set output "dgemm_icx".ARG1.".png"
plot \
'data/dgemm_icx_'.ARG1.'.dat' every 7::1 using 12:xtic(5) ti "IJK i7-1165G7", \
'data/dgemm_icx_'.ARG1.'.dat' every 7::2 using 12 ti 'IKJ i7-1165G7', \
'data/dgemm_icx_'.ARG1.'.dat' every 7::3 using 12 ti 'IEX i7-1165G7', \
'data/dgemm_icx_'.ARG1.'.dat' every 7::4 using 12 ti 'UNROLL4 i7-1165G7', \
'data/dgemm_icx_'.ARG1.'.dat' every 7::5 using 12 ti 'UNROLL8 i7-1165G7', \
'data/dgemm_icx_'.ARG1.'.dat' every 7::6 using 12 ti 'CBLAS i7-1165G7', \
'output/data/dgemm_icx_'.ARG1'dat' every 7::1 using 12 ti "IJK i5-3570", \
'output/data/dgemm_icx_'.ARG1'dat' every 7::2 using 12 ti 'IKJ i5-3570', \
'output/data/dgemm_icx_'.ARG1'dat' every 7::3 using 12 ti 'IEX i5-3570', \
'output/data/dgemm_icx_'.ARG1'dat' every 7::4 using 12 ti 'UNROLL4 i5-3570', \
'output/data/dgemm_icx_'.ARG1'dat' every 7::5 using 12 ti 'UNROLL8 i5-3570', \
'output/data/dgemm_icx_'.ARG1'dat' every 7::6 using 12 ti 'CBLAS i5-3570'

set xtics norotate center 
set output 'Dgemm_'.ARG1.'.png' 

set multiplot layout 3, 2 rowsfirst
set title 'IJK'
plot 'data/dgemm_gcc'.ARG1.'.dat' every 7::1 using 12:xtic(5) t "gcc i7-1165G7", \
     'data/dgemm_clang'.ARG1.'.dat' every 7::1 using 12:xtic(5) t "clang i7-1165G7", \
     'data/dgemm_icx'.ARG1.'.dat' every 7::1 using 12:xtic(5) t "icx i7-1165G7", \
     'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::1 using 12:xtic(5) t "gcc i5-3570", \
     'output/data/dgemm_clang_'.ARG1.'.dat' every 7::1 using 12:xtic(5) t "clang i5-3570", \
     'output/data/dgemm_icx_'.ARG1.'.dat' every 7::1 using 12:xtic(5) t "icx i5-3570"

set title 'IKJ'
plot 'data/dgemm_gcc_'.ARG1.'.dat' every 7::2 using 12:xtic(5) t "gcc i7-1165G7",\
     'data/dgemm_clang_'.ARG1.'.dat' every 7::2 using 12:xtic(5) t "clang i7-1165G7", \
     'data/dgemm_icx_'.ARG1.'.dat' every 7::2  using 12:xtic(5) t "icx i7-1165G7", \
     'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::2 using 12:xtic(5) t "gcc i5-3570",\
     'output/data/dgemm_clang_'.ARG1.'.dat' every 7::2 using 12:xtic(5) t "clang i5-3570", \
     'output/data/dgemm_icx_'.ARG1.'.dat' every 7::2  using 12:xtic(5) t "icx i5-3570"

set title 'IEX'
plot 'data/dgemm_gcc'.ARG1.'.dat' every 7::3 using 12:xtic(5) t "gcc i7-1165G7", \
     'data/dgemm_clang'.ARG1.'.dat' every 7::3 using 12:xtic(5) t "clang i7-1165G7", \
     'data/dgemm_icx'.ARG1.'.dat' every 7::3 using 12:xtic(5) t "icx i7-1165G7", \
     'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::3 using 12:xtic(5) t "gcc i5-3570", \
     'output/data/dgemm_clang_'.ARG1.'.dat' every 7::3 using 12:xtic(5) t "clang i5-3570", \
     'output/data/dgemm_icx_'.ARG1.'.dat' every 7::3 using 12:xtic(5) t "icx i5-3570"

set title 'UNROLL4'
plot 'data/dgemm_gcc_'.ARG1.'.dat' every 7::4 using 12:xtic(5) t "gcc i7-1165G7",\
     'data/dgemm_clang_'.ARG1.'.dat' every 7::4 using 12:xtic(5) t "clang i7-1165G7", \
     'data/dgemm_icx_'.ARG1.'.dat' every 7::4  using 12:xtic(5) t "icx i7-1165G7", \
     'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::4 using 12:xtic(5) t "gcc i5-3570",\
     'output/data/dgemm_clang_'.ARG1.'.dat' every 7::4 using 12:xtic(5) t "clang i5-3570", \
     'output/data/dgemm_icx_'.ARG1.'.dat' every 7::4  using 12:xtic(5) t "icx i5-3570"

set title 'UNROLL8'
plot 'data/dgemm_gcc'.ARG1.'.dat' every 7::5 using 12:xtic(5) t "gcc i7-1165G7", \
     'data/dgemm_clang'.ARG1.'.dat' every 7::5 using 12:xtic(5) t "clang i7-1165G7", \
     'data/dgemm_icx'.ARG1.'.dat' every 7::5 using 12:xtic(5) t "icx i7-1165G7", \
     'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::5 using 12:xtic(5) t "gcc i5-3570", \
     'output/data/dgemm_clang_'.ARG1.'.dat' every 7::5 using 12:xtic(5) t "clang i5-3570", \
     'output/data/dgemm_icx_'.ARG1.'.dat' every 7::5 using 12:xtic(5) t "icx i5-3570"

set title 'CBLAS'
plot 'data/dgemm_gcc_'.ARG1.'.dat' every 7::6 using 12:xtic(5) t "gcc i7-1165G7",\
     'data/dgemm_clang_'.ARG1.'.dat' every 7::6 using 12:xtic(5) t "clang i7-1165G7", \
     'data/dgemm_icx_'.ARG1.'.dat' every 7::6  using 12:xtic(5) t "icx i7-1165G7", \
     'output/data/dgemm_gcc_'.ARG1.'.dat' every 7::6 using 12:xtic(5) t "gcc i5-3570",\
     'output/data/dgemm_clang_'.ARG1.'.dat' every 7::6 using 12:xtic(5) t "clang i5-3570", \
     'output/data/dgemm_icx_'.ARG1.'.dat' every 7::6  using 12:xtic(5) t "icx i5-3570"

unset multiplot