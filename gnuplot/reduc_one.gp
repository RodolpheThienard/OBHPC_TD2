set terminal png size 1000,1000
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
set output "reduc_gcc_".ARG1.".png"
plot \
'data/reduc_gcc_'.ARG1.'.dat' every 5::1 using 12:xtic(5) ti "base ".ARG2 , \
'data/reduc_gcc_'.ARG1.'.dat' every 5::2 using 12 ti 'unroll '.ARG2 , \
'data/reduc_gcc_'.ARG1.'.dat' every 5::3 using 12 ti 'asm '.ARG2 , \
'data/reduc_gcc_'.ARG1.'.dat' every 5::4 using 12 ti 'cblas '.ARG2

set title 'CLANG'
set output "reduc_clang_".ARG1.".png"
plot \
'data/reduc_clang_'.ARG1.'.dat' every 5::1 using 12:xtic(5) ti "base ".ARG2 , \
'data/reduc_clang_'.ARG1.'.dat' every 5::2 using 12 ti 'unroll '.ARG2 , \
'data/reduc_clang_'.ARG1.'.dat' every 5::3 using 12 ti 'asm '.ARG2 , \
'data/reduc_clang_'.ARG1.'.dat' every 5::4 using 12 ti 'cblas '.ARG2

set title 'ICX'
set output "reduc_icx_".ARG1.".png"
plot \
'data/reduc_icx_'.ARG1.'.dat' every 5::1 using 12:xtic(5) ti "base ".ARG2 , \
'data/reduc_icx_'.ARG1.'.dat' every 5::2 using 12 ti 'unroll '.ARG2 , \
'data/reduc_icx_'.ARG1.'.dat' every 5::3 using 12 ti 'asm '.ARG2 , \
'data/reduc_icx_'.ARG1.'.dat' every 5::4 using 12 ti 'cblas '.ARG2

set terminal png size 1000,1000
set xtics norotate center 
set output 'reduc_'.ARG1.'.png' 

set multiplot layout 2, 2 rowsfirst
set title 'base'
plot 'data/reduc_gcc_'.ARG1.'.dat' every 5::1 using 12:xtic(5) t "gcc ".ARG2 , \
     'data/reduc_clang_'.ARG1.'.dat' every 5::1 using 12:xtic(5) t "clang ".ARG2 , \
     'data/reduc_icx_'.ARG1.'.dat' every 5::1 using 12:xtic(5) t "icx ".ARG2

set title 'unroll'
plot 'data/reduc_gcc_'.ARG1.'.dat' every 5::2 using 12:xtic(5) t "gcc ".ARG2 , \
     'data/reduc_clang_'.ARG1.'.dat' every 5::2 using 12:xtic(5) t "clang ".ARG2 , \
     'data/reduc_icx_'.ARG1.'.dat' every 5::2 using 12:xtic(5) t "icx ".ARG2

set title 'asm'
plot 'data/reduc_gcc_'.ARG1.'.dat' every 5::3 using 12:xtic(5) t "gcc ".ARG2 , \
     'data/reduc_clang_'.ARG1.'.dat' every 5::3 using 12:xtic(5) t "clang ".ARG2 , \
     'data/reduc_icx_'.ARG1.'.dat' every 5::3 using 12:xtic(5) t "icx ".ARG2

set title 'cblas'
plot 'data/reduc_gcc_'.ARG1.'.dat' every 5::4 using 12:xtic(5) t "gcc ".ARG2 , \
     'data/reduc_clang_'.ARG1.'.dat' every 5::4 using 12:xtic(5) t "clang ".ARG2 , \
     'data/reduc_icx_'.ARG1.'.dat' every 5::4 using 12:xtic(5) t "icx ".ARG2

unset multiplot