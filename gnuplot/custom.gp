set terminal png size 1920,1080
set xtics rotate by 45 right
set style fill solid 1 border 0
set style data histograms
set datafile separator ';'
set yrange [0:*]
set ylabel "Bandwidth (MiB/s)"
set xlabel "N"
set key font ",8"
set boxwidth 0.9

set xtics norotate center 
set output 'custom_dgemm_'.ARG1.'.png' 

set multiplot layout 1,3 rowsfirst
set title 'GCC'
plot "data/dgemm_gcc_".ARG1.".dat" every 60::22 using 11:xtic(5) ti "IJK i7-1165G7",\
'data/dgemm_gcc_'.ARG1.'.dat' every 60::23 using 11 ti 'IKJ i7-1165G7',\
'data/dgemm_gcc_'.ARG1.'.dat' every 60::24 using 11 ti 'IEX i7-1165G7',\
'data/dgemm_gcc_'.ARG1.'.dat' every 60::25 using 11 ti 'UNROLL4 i7-1165G7',\
'data/dgemm_gcc_'.ARG1.'.dat' every 60::26 using 11 ti 'UNROLL8 i7-1165G7',\
'data/dgemm_gcc_'.ARG1.'.dat' every 60::27 using 11 ti 'CBLAS i7-1165G7',\
'output/data/dgemm_gcc_'.ARG1.'.dat' every 60::22 using 11 ti "IJK i5-3570",\
'output/data/dgemm_gcc_'.ARG1.'.dat' every 60::23 using 11 ti 'IKJ i5-3570',\
'output/data/dgemm_gcc_'.ARG1.'.dat' every 60::24 using 11 ti 'IEX i5-3570',\
'output/data/dgemm_gcc_'.ARG1.'.dat' every 60::25 using 11 ti 'UNROLL4 i5-3570',\
'output/data/dgemm_gcc_'.ARG1.'.dat' every 60::26 using 11 ti 'UNROLL8 i5-3570',\
'output/data/dgemm_gcc_'.ARG1.'.dat' every 60::27 using 11 ti 'CBLAS i5-3570'

set title 'CLANG'
plot 'data/dgemm_clang_'.ARG1.'.dat' every 60::22 using 11:xtic(5) ti "IJK i7-1165G7",\
'data/dgemm_clang_'.ARG1.'.dat' every 60::23 using 11 ti 'IKJ i7-1165G7',\
'data/dgemm_clang_'.ARG1.'.dat' every 60::24 using 11 ti 'IEX i7-1165G7',\
'data/dgemm_clang_'.ARG1.'.dat' every 60::25 using 11 ti 'UNROLL4 i7-1165G7',\
'data/dgemm_clang_'.ARG1.'.dat' every 60::26 using 11 ti 'UNROLL8 i7-1165G7',\
'data/dgemm_clang_'.ARG1.'.dat' every 60::27 using 11 ti 'CBLAS i7-1165G7',\
'output/data/dgemm_clang_'.ARG1.'.dat' every 60::22 using 11 ti "IJK i5-3570",\
'output/data/dgemm_clang_'.ARG1.'.dat' every 60::23 using 11 ti 'IKJ i5-3570',\
'output/data/dgemm_clang_'.ARG1.'.dat' every 60::24 using 11 ti 'IEX i5-3570',\
'output/data/dgemm_clang_'.ARG1.'.dat' every 60::25 using 11 ti 'UNROLL4 i5-3570',\
'output/data/dgemm_clang_'.ARG1.'.dat' every 60::26 using 11 ti 'UNROLL8 i5-3570',\
'output/data/dgemm_clang_'.ARG1.'.dat' every 60::27 using 11 ti 'CBLAS i5-3570'

set title 'ICX'
plot 'data/dgemm_icx_'.ARG1.'.dat' every 60::22 using 11:xtic(5) ti "IJK i7-1165G7",\
'data/dgemm_icx_'.ARG1.'.dat' every 60::23 using 11 ti 'IKJ i7-1165G7',\
'data/dgemm_icx_'.ARG1.'.dat' every 60::24 using 11 ti 'IEX i7-1165G7',\
'data/dgemm_icx_'.ARG1.'.dat' every 60::25 using 11 ti 'UNROLL4 i7-1165G7',\
'data/dgemm_icx_'.ARG1.'.dat' every 60::26 using 11 ti 'UNROLL8 i7-1165G7',\
'data/dgemm_icx_'.ARG1.'.dat' every 60::27 using 11 ti 'CBLAS i7-1165G7',\
'output/data/dgemm_icx_'.ARG1.'.dat' every 60::22 using 11 ti "IJK i5-3570",\
'output/data/dgemm_icx_'.ARG1.'.dat' every 60::23 using 11 ti 'IKJ i5-3570',\
'output/data/dgemm_icx_'.ARG1.'.dat' every 60::24 using 11 ti 'IEX i5-3570',\
'output/data/dgemm_icx_'.ARG1.'.dat' every 60::25 using 11 ti 'UNROLL4 i5-3570',\
'output/data/dgemm_icx_'.ARG1.'.dat' every 60::26 using 11 ti 'UNROLL8 i5-3570',\
'output/data/dgemm_icx_'.ARG1.'.dat' every 60::27 using 11 ti 'CBLAS i5-3570'
unset multiplot

set output 'custom_dotprod_'.ARG1.'.png' 

set multiplot layout 1,3 rowsfirst
set title 'GCC'
plot \
'data/dotprod_gcc_'.ARG1.'.dat' every 5::16 using 12:xtic(5) ti "base i7-1165G7", \
'data/dotprod_gcc_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i7-1165G7', \
'data/dotprod_gcc_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i7-1165G7', \
'data/dotprod_gcc_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i7-1165G7', \
'output/data/dotprod_gcc_'.ARG1.'.dat' every 5::16 using 12 ti "base i5-3570", \
'output/data/dotprod_gcc_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i5-3570', \
'output/data/dotprod_gcc_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i5-3570', \
'output/data/dotprod_gcc_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i5-3570'

set title 'CLANG'
plot \
'data/dotprod_clang_'.ARG1.'.dat' every 5::16 using 12:xtic(5) ti "base i7-1165G7", \
'data/dotprod_clang_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i7-1165G7', \
'data/dotprod_clang_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i7-1165G7', \
'data/dotprod_clang_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i7-1165G7', \
'output/data/dotprod_clang_'.ARG1.'.dat' every 5::16 using 12 ti "base i5-3570", \
'output/data/dotprod_clang_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i5-3570', \
'output/data/dotprod_clang_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i5-3570', \
'output/data/dotprod_clang_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i5-3570'

set title 'ICX'
plot \
'data/dotprod_icx_'.ARG1.'.dat' every 5::16 using 12:xtic(5) ti "base i7-1165G7", \
'data/dotprod_icx_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i7-1165G7', \
'data/dotprod_icx_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i7-1165G7', \
'data/dotprod_icx_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i7-1165G7', \
'output/data/dotprod_icx_'.ARG1.'.dat' every 5::16 using 12 ti "base i5-3570", \
'output/data/dotprod_icx_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i5-3570', \
'output/data/dotprod_icx_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i5-3570', \
'output/data/dotprod_icx_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i5-3570'

unset multiplot

set output 'custom_reduc_'.ARG1.'.png' 

set multiplot layout 1,3 rowsfirst
set title 'GCC'
plot \
'data/reduc_gcc_'.ARG1.'.dat' every 5::16 using 12:xtic(5) ti "base i7-1165G7", \
'data/reduc_gcc_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i7-1165G7', \
'data/reduc_gcc_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i7-1165G7', \
'data/reduc_gcc_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i7-1165G7', \
'output/data/reduc_gcc_'.ARG1.'.dat' every 5::16 using 12 ti "base i5-3570", \
'output/data/reduc_gcc_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i5-3570', \
'output/data/reduc_gcc_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i5-3570', \
'output/data/reduc_gcc_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i5-3570'

set title 'CLANG'
plot \
'data/reduc_clang_'.ARG1.'.dat' every 5::16 using 12:xtic(5) ti "base i7-1165G7", \
'data/reduc_clang_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i7-1165G7', \
'data/reduc_clang_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i7-1165G7', \
'data/reduc_clang_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i7-1165G7', \
'output/data/reduc_clang_'.ARG1.'.dat' every 5::16 using 12 ti "base i5-3570", \
'output/data/reduc_clang_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i5-3570', \
'output/data/reduc_clang_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i5-3570', \
'output/data/reduc_clang_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i5-3570'

set title 'ICX'
plot \
'data/reduc_icx_'.ARG1.'.dat' every 5::16 using 12:xtic(5) ti "base i7-1165G7", \
'data/reduc_icx_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i7-1165G7', \
'data/reduc_icx_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i7-1165G7', \
'data/reduc_icx_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i7-1165G7', \
'output/data/reduc_icx_'.ARG1.'.dat' every 5::16 using 12 ti "base i5-3570", \
'output/data/reduc_icx_'.ARG1.'.dat' every 5::17 using 12 ti 'unroll i5-3570', \
'output/data/reduc_icx_'.ARG1.'.dat' every 5::18 using 12 ti 'asm i5-3570', \
'output/data/reduc_icx_'.ARG1.'.dat' every 5::19 using 12 ti 'cblas i5-3570'

unset multiplot