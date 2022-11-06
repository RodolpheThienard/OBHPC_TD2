gnuplot -c gnuplot/dgemm.gp "O1"
gnuplot -c gnuplot/dgemm.gp "O3"

gnuplot -c gnuplot/dotprod.gp "O1"
gnuplot -c gnuplot/dotprod.gp "O3"

gnuplot -c gnuplot/reduc.gp "O1"
gnuplot -c gnuplot/reduc.gp "O3"

mv *.png plots