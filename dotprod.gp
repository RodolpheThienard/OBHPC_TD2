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
set output "dotprod_gcc_".ARG1.".png"
plot \
'data/dotprod_gcc_'.ARG1.'.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/dotprod_gcc_'.ARG1.'.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/dotprod_gcc_'.ARG1.'.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/dotprod_gcc_'.ARG1.'.dat' every 5::4 using 12 ti 'cblas i7-1165G7', \
'output/data/dotprod_gcc'.ARG1.'.dat' every 5::1 using 12 ti "base i5-3570", \
'output/data/dotprod_gcc'.ARG1.'.dat' every 5::2 using 12 ti 'unroll i5-3570', \
'output/data/dotprod_gcc'.ARG1.'.dat' every 5::3 using 12 ti 'asm i5-3570', \
'output/data/dotprod_gcc'.ARG1.'.dat' every 5::4 using 12 ti 'cblas i5-3570'

set title 'CLANG'
set output "dotprod_clang_".ARG1.".png"
plot \
'data/dotprod_clang_'.ARG1.'.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/dotprod_clang_'.ARG1.'.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/dotprod_clang_'.ARG1.'.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/dotprod_clang_'.ARG1.'.dat' every 5::4 using 12 ti 'cblas i7-1165G7', \
'output/data/dotprod_clang'.ARG1.'.dat' every 5::1 using 12 ti "base i5-3570", \
'output/data/dotprod_clang'.ARG1.'.dat' every 5::2 using 12 ti 'unroll i5-3570', \
'output/data/dotprod_clang'.ARG1.'.dat' every 5::3 using 12 ti 'asm i5-3570', \
'output/data/dotprod_clang'.ARG1.'.dat' every 5::4 using 12 ti 'cblas i5-3570'

set title 'ICX'
set output "dotprod_icx_".ARG1.".png"
plot \
'data/dotprod_icx_'.ARG1.'.dat' every 5::1 using 12:xtic(5) ti "base i7-1165G7", \
'data/dotprod_icx_'.ARG1.'.dat' every 5::2 using 12 ti 'unroll i7-1165G7', \
'data/dotprod_icx_'.ARG1.'.dat' every 5::3 using 12 ti 'asm i7-1165G7', \
'data/dotprod_icx_'.ARG1.'.dat' every 5::4 using 12 ti 'cblas i7-1165G7', \
'output/data/dotprod_icx'.ARG1.'.dat' every 5::1 using 12 ti "base i5-3570", \
'output/data/dotprod_icx'.ARG1.'.dat' every 5::2 using 12 ti 'unroll i5-3570', \
'output/data/dotprod_icx'.ARG1.'.dat' every 5::3 using 12 ti 'asm i5-3570', \
'output/data/dotprod_icx'.ARG1.'.dat' every 5::4 using 12 ti 'cblas i5-3570'

set terminal png 
set xtics norotate center 
set output 'dotprod_'.ARG1.'.png' 

set multiplot layout 2, 2 rowsfirst
set title 'base'
plot 'data/dotprod_gcc_'.ARG1.'.dat' every 5::1 using 12:xtic(5) t "gcc i7-1165G7", \
     'data/dotprod_clang_'.ARG1.'.dat' every 5::1 using 12:xtic(5) t "clang i7-1165G7", \
     'data/dotprod_icx_'.ARG1.'.dat' every 5::1 using 12:xtic(5) t "icx i7-1165G7", \
     'output/data/dotprod_gcc_'.ARG1.'.dat' every 5::1 using 12:xtic(5) t "gcc i5-3570", \
     'output/data/dotprod_clang_'.ARG1.'.dat' every 5::1 using 12:xtic(5) t "clang i5-3570", \
     'output/data/dotprod_icx_'.ARG1.'.dat' every 5::1 using 12:xtic(5) t "icx i5-3570"

set title 'unroll'
plot 'data/dotprod_gcc_'.ARG1.'.dat' every 5::2 using 12:xtic(5) t "gcc i7-1165G7", \
     'data/dotprod_clang_'.ARG1.'.dat' every 5::2 using 12:xtic(5) t "clang i7-1165G7", \
     'data/dotprod_icx_'.ARG1.'.dat' every 5::2 using 12:xtic(5) t "icx i7-1165G7", \
     'output/data/dotprod_gcc_'.ARG1.'.dat' every 5::2 using 12:xtic(5) t "gcc i5-3570", \
     'output/data/dotprod_clang_'.ARG1.'.dat' every 5::2 using 12:xtic(5) t "clang i5-3570", \
     'output/data/dotprod_icx_'.ARG1.'.dat' every 5::2 using 12:xtic(5) t "icx i5-3570"

set title 'asm'
plot 'data/dotprod_gcc_'.ARG1.'.dat' every 5::3 using 12:xtic(5) t "gcc i7-1165G7", \
     'data/dotprod_clang_'.ARG1.'.dat' every 5::3 using 12:xtic(5) t "clang i7-1165G7", \
     'data/dotprod_icx_'.ARG1.'.dat' every 5::3 using 12:xtic(5) t "icx i7-1165G7", \
     'output/data/dotprod_gcc_'.ARG1.'.dat' every 5::3 using 12:xtic(5) t "gcc i5-3570", \
     'output/data/dotprod_clang_'.ARG1.'.dat' every 5::3 using 12:xtic(5) t "clang i5-3570", \
     'output/data/dotprod_icx_'.ARG1.'.dat' every 5::3 using 12:xtic(5) t "icx i5-3570"

set title 'cblas'
plot 'data/dotprod_gcc_'.ARG1.'.dat' every 5::4 using 12:xtic(5) t "gcc i7-1165G7", \
     'data/dotprod_clang_'.ARG1.'.dat' every 5::4 using 12:xtic(5) t "clang i7-1165G7", \
     'data/dotprod_icx_'.ARG1.'.dat' every 5::4 using 12:xtic(5) t "icx i7-1165G7", \
     'output/data/dotprod_gcc_'.ARG1.'.dat' every 5::4 using 12:xtic(5) t "gcc i5-3570", \
     'output/data/dotprod_clang_'.ARG1.'.dat' every 5::4 using 12:xtic(5) t "clang i5-3570", \
     'output/data/dotprod_icx_'.ARG1.'.dat' every 5::4 using 12:xtic(5) t "icx i5-3570"

unset multiplot