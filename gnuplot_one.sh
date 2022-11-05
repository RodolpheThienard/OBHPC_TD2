if [ $# -eq 0 ]
then 
    echo "missing CPU name"
else

gnuplot -c dgemm_one.gp "O1" $1
gnuplot -c dgemm_one.gp "O3" $1

gnuplot -c dotprod_one.gp "O1" $1
gnuplot -c dotprod.gp "O3" $1

gnuplot -c reduc_one.gp "O1" $1
gnuplot -c reduc_one.gp "O3" $1

fi