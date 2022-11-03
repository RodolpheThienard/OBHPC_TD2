#!/bin/bash

# REDUC O3
make -C reduc CC=gcc 

./reduc/reduc 128 1000 > data/reduc_gcc.dat
./reduc/reduc 512 1000 >> data/reduc_gcc.dat
./reduc/reduc 1280 1000 >> data/reduc_gcc.dat
./reduc/reduc 12800 1000 >> data/reduc_gcc.dat

make -C reduc CC=icx

./reduc/reduc 128 1000 > data/reduc_icx.dat
./reduc/reduc 512 1000 >> data/reduc_icx.dat
./reduc/reduc 1280 1000 >> data/reduc_icx.dat
./reduc/reduc 12800 1000 >> data/reduc_icx.dat

make -C reduc CC=clang

./reduc/reduc 128 1000 > data/reduc_clang.dat
./reduc/reduc 512 1000 >> data/reduc_clang.dat
./reduc/reduc 1280 1000 >> data/reduc_clang.dat
./reduc/reduc 12800 1000 >> data/reduc_clang.dat

gnuplot -c reduc.gp "reduc_O3.png" "O3"

# REDUC O1
make -C reduc CC=gcc OFLAGS=-O1

./reduc/reduc 128 1000 > data/reduc_gcc.dat
./reduc/reduc 512 1000 >> data/reduc_gcc.dat
./reduc/reduc 1280 1000 >> data/reduc_gcc.dat
./reduc/reduc 12800 1000 >> data/reduc_gcc.dat

make -C reduc CC=icx OFLAGS=-O1

./reduc/reduc 128 1000 > data/reduc_icx.dat
./reduc/reduc 512 1000 >> data/reduc_icx.dat
./reduc/reduc 1280 1000 >> data/reduc_icx.dat
./reduc/reduc 12800 1000 >> data/reduc_icx.dat

make -C reduc CC=clang OFLAGS=-O1

./reduc/reduc 128 1000 > data/reduc_clang.dat
./reduc/reduc 512 1000 >> data/reduc_clang.dat
./reduc/reduc 1280 1000 >> data/reduc_clang.dat
./reduc/reduc 12800 1000 >> data/reduc_clang.dat

gnuplot -c reduc.gp "reduc_O1.png" "O3"

# DOTPROD O3
make -C dotprod CC=gcc 

taskset -c 0 ./dotprod/dotprod 128 1000 > data/dotprod_gcc.dat
taskset -c 0 ./dotprod/dotprod 512 1000 >> data/dotprod_gcc.dat
taskset -c 0 ./dotprod/dotprod 1280 1000 >> data/dotprod_gcc.dat
taskset -c 0 ./dotprod/dotprod 12800 1000 >> data/dotprod_gcc.dat

make -C dotprod CC=icx

taskset -c 0 ./dotprod/dotprod 128 1000 > data/dotprod_icx.dat
taskset -c 0 ./dotprod/dotprod 512 1000 >> data/dotprod_icx.dat
taskset -c 0 ./dotprod/dotprod 1280 1000 >> data/dotprod_icx.dat
taskset -c 0 ./dotprod/dotprod 12800 1000 >> data/dotprod_icx.dat

make -C dotprod CC=clang

taskset -c 0 ./dotprod/dotprod 128 1000 > data/dotprod_clang.dat
taskset -c 0 ./dotprod/dotprod 512 1000 >> data/dotprod_clang.dat
taskset -c 0 ./dotprod/dotprod 1280 1000 >> data/dotprod_clang.dat
taskset -c 0 ./dotprod/dotprod 12800 1000 >> data/dotprod_clang.dat

gnuplot -c dotprod.gp "dotprod_O3.png"

# DOTPROD O1
make -C dotprod CC=gcc OFLAGS=-O1

taskset -c 0 ./dotprod/dotprod 128 1000 > data/dotprod_gcc.dat
taskset -c 0 ./dotprod/dotprod 512 1000 >> data/dotprod_gcc.dat
taskset -c 0 ./dotprod/dotprod 1280 1000 >> data/dotprod_gcc.dat
taskset -c 0 ./dotprod/dotprod 12800 1000 >> data/dotprod_gcc.dat

make -C dotprod CC=icx OFLAGS=-O1

taskset -c 0 ./dotprod/dotprod 128 1000 > data/dotprod_icx.dat
taskset -c 0 ./dotprod/dotprod 512 1000 >> data/dotprod_icx.dat
taskset -c 0 ./dotprod/dotprod 1280 1000 >> data/dotprod_icx.dat
taskset -c 0 ./dotprod/dotprod 12800 1000 >> data/dotprod_icx.dat

make -C dotprod CC=clang OFLAGS=-O1

taskset -c 0 ./dotprod/dotprod 128 1000 > data/dotprod_clang.dat
taskset -c 0 ./dotprod/dotprod 512 1000 >> data/dotprod_clang.dat
taskset -c 0 ./dotprod/dotprod 1280 1000 >> data/dotprod_clang.dat
taskset -c 0 ./dotprod/dotprod 12800 1000 >> data/dotprod_clang.dat

gnuplot -c dotprod.gp "dotprod_O1.png"

mv *.png plots