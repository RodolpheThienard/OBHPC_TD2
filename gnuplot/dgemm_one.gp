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
set output "dgemm_gcc_".ARG1.".png"
plot "data/dgemm_gcc_".ARG1.".dat" every 7::1 using 11:xtic(5) ti "IJK  ".ARG2 ,\
'data/dgemm_gcc_'.ARG1.'.dat' every 7::2 using 11 ti 'IKJ '.ARG2 ,\
'data/dgemm_gcc_'.ARG1.'.dat' every 7::3 using 11 ti 'IEX '.ARG2 ,\
'data/dgemm_gcc_'.ARG1.'.dat' every 7::4 using 11 ti 'UNROLL4 '.ARG2 ,\
'data/dgemm_gcc_'.ARG1.'.dat' every 7::5 using 11 ti 'UNROLL8 '.ARG2 ,\
'data/dgemm_gcc_'.ARG1.'.dat' every 7::6 using 11 ti 'CBLAS '.ARG2

set title 'CLANG'
set output "dgemm_clang_".ARG1.".png"
plot "data/dgemm_clang_".ARG1.".dat" every 7::1 using 11:xtic(5) ti "IJK  ".ARG2 ,\
'data/dgemm_clang_'.ARG1.'.dat' every 7::2 using 11 ti 'IKJ '.ARG2 ,\
'data/dgemm_clang_'.ARG1.'.dat' every 7::3 using 11 ti 'IEX '.ARG2 ,\
'data/dgemm_clang_'.ARG1.'.dat' every 7::4 using 11 ti 'UNROLL4 '.ARG2 ,\
'data/dgemm_clang_'.ARG1.'.dat' every 7::5 using 11 ti 'UNROLL8 '.ARG2 ,\
'data/dgemm_clang_'.ARG1.'.dat' every 7::6 using 11 ti 'CBLAS '.ARG2

set title 'ICX'
set output "dgemm_icx_".ARG1.".png"
plot "data/dgemm_icx_".ARG1.".dat" every 7::1 using 11:xtic(5) ti "IJK  ".ARG2 ,\
'data/dgemm_icx_'.ARG1.'.dat' every 7::2 using 11 ti 'IKJ '.ARG2 ,\
'data/dgemm_icx_'.ARG1.'.dat' every 7::3 using 11 ti 'IEX '.ARG2 ,\
'data/dgemm_icx_'.ARG1.'.dat' every 7::4 using 11 ti 'UNROLL4 '.ARG2 ,\
'data/dgemm_icx_'.ARG1.'.dat' every 7::5 using 11 ti 'UNROLL8 '.ARG2 ,\
'data/dgemm_icx_'.ARG1.'.dat' every 7::6 using 11 ti 'CBLAS '.ARG2

set terminal png size 1000,1000
set xtics norotate center 
set output 'Dgemm_'.ARG1.'.png' 

set multiplot layout 3, 2 rowsfirst
set title 'IJK'
plot 'data/dgemm_gcc_'.ARG1.'.dat' every 7::1 using 11:xtic(5) t "gcc ".ARG2 ,\
     'data/dgemm_clang_'.ARG1.'.dat' every 7::1 using 11:xtic(5) t "clang ".ARG2 ,\
     'data/dgemm_icx_'.ARG1.'.dat' every 7::1 using 11:xtic(5) t "icx ".ARG2 

set title 'IKJ'
plot 'data/dgemm_gcc_'.ARG1.'.dat' every 7::2 using 11:xtic(5) t "gcc ".ARG2 ,\
     'data/dgemm_clang_'.ARG1.'.dat' every 7::2 using 11:xtic(5) t "clang ".ARG2 ,\
     'data/dgemm_icx_'.ARG1.'.dat' every 7::2  using 11:xtic(5) t "icx ".ARG2 

plot 'data/dgemm_gcc_'.ARG1.'.dat' every 7::3 using 11:xtic(5) t "gcc ".ARG2 ,\
     'data/dgemm_clang_'.ARG1.'.dat' every 7::3 using 11:xtic(5) t "clang ".ARG2 ,\
     'data/dgemm_icx_'.ARG1.'.dat' every 7::3 using 11:xtic(5) t "icx ".ARG2 

set title 'UNROLL4'
plot 'data/dgemm_gcc_'.ARG1.'.dat' every 7::4 using 11:xtic(5) t "gcc ".ARG2 ,\
     'data/dgemm_clang_'.ARG1.'.dat' every 7::4 using 11:xtic(5) t "clang ".ARG2 ,\
     'data/dgemm_icx_'.ARG1.'.dat' every 7::4  using 11:xtic(5) t "icx ".ARG2 

set title 'UNROLL8'
plot 'data/dgemm_gcc_'.ARG1.'.dat' every 7::5 using 11:xtic(5) t "gcc ".ARG2 ,\
     'data/dgemm_clang_'.ARG1.'.dat' every 7::5 using 11:xtic(5) t "clang ".ARG2 ,\
     'data/dgemm_icx_'.ARG1.'.dat' every 7::5  using 11:xtic(5) t "icx ".ARG2 

set title 'CBLAS'
plot 'data/dgemm_gcc_'.ARG1.'.dat' every 7::6 using 11:xtic(5) t "gcc ".ARG2 ,\
     'data/dgemm_clang_'.ARG1.'.dat' every 7::6 using 11:xtic(5) t "clang ".ARG2 ,\
     'data/dgemm_icx_'.ARG1.'.dat' every 7::6  using 11:xtic(5) t "icx ".ARG2 

unset multiplot