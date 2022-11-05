gnuplot -c dgemm.gp "O1"
gnuplot -c dgemm.gp "O3"

gnuplot -c dotprod.gp "O1"
gnuplot -c dotprod.gp "O3"

gnuplot -c reduc.gp "O1"
gnuplot -c reduc.gp "O3"

mv *.png plots