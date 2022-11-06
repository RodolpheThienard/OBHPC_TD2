if [ $# -eq 0 ]
then 
    echo "missing CPU name"
else

gnuplot -c gnuplot/dgemm_one.gp "O1" $1
gnuplot -c gnuplot/dgemm_one.gp "O3" $1

gnuplot -c gnuplot/dotprod_one.gp "O1" $1
gnuplot -c gnuplot/dotprod.gp "O3" $1

gnuplot -c gnuplot/reduc_one.gp "O1" $1
gnuplot -c gnuplot/reduc_one.gp "O3" $1

fi