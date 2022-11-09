make -C reduc CC=gcc OFLAGS="-O3"
taskset -c 2 ./reduc/reduc 12800 1000 > data/reduc_gcc/O3.dat
make -C reduc CC=gcc OFLAGS="-O2"
taskset -c 2 ./reduc/reduc 12800 1000 > data/reduc_gcc/O2.dat
make -C reduc CC=gcc OFLAGS="-O1"
taskset -c 2 ./reduc/reduc 12800 1000 > data/reduc_gcc/O1.dat
make -C reduc CC=gcc OFLAGS="-O0"
taskset -c 2 ./reduc/reduc 12800 1000 > data/reduc_gcc/O0.dat
make -C dgemm CC=gcc OFLAGS="-O3"
taskset -c 2 ./reduc/reduc 12800 1000 > data/dgemm_gcc/O3.dat
make -C dgemm CC=gcc OFLAGS="-O2"
taskset -c 2 ./reduc/reduc 12800 1000 > data/dgemm_gcc/O2.dat
taskset -c 2 ./dgemm/dgemm 128 100 > data/dgemm_gcc/O3.dat
make -C dgemm CC=gcc OFLAGS="-O3"
taskset -c 2 ./dgemm/dgemm 128 100 > data/dgemm_gcc/O3.dat
make -C dgemm CC=gcc OFLAGS="-O2"
taskset -c 2 ./dgemm/dgemm 128 100 > data/dgemm_gcc/O2.dat
make -C dgemm CC=gcc OFLAGS="-O1"
taskset -c 2 ./dgemm/dgemm 128 100 > data/dgemm_gcc/O1.dat
make -C dgemm CC=gcc OFLAGS="-O0"
taskset -c 2 ./dgemm/dgemm 128 100 > data/dgemm_gcc/O0.dat
make -C dotprod CC=gcc OFLAGS="-O0"
taskset -c 2 ./dotprod/dotprod 128 100 > data/dotprod_gcc/O0.dat
make -C dotprod CC=gcc OFLAGS="-O1"
taskset -c 2 ./dotprod/dotprod 128 100 > data/dotprod_gcc/O1.dat
make -C dotprod CC=gcc OFLAGS="-O0"
taskset -c 2 ./dotprod/dotprod 12800 1000 > data/dotprod_gcc/O0.dat
make -C dotprod CC=gcc OFLAGS="-O1"
taskset -c 2 ./dotprod/dotprod 12800 1000 > data/dotprod_gcc/O1.dat
make -C dotprod CC=gcc OFLAGS="-O2"
taskset -c 2 ./dotprod/dotprod 12800 1000 > data/dotprod_gcc/O2.dat
make -C dotprod CC=gcc OFLAGS="-O3"
taskset -c 2 ./dotprod/dotprod 12800 1000 > data/dotprod_gcc/O3.dat