#!/bin/bash

# REDUC O3
make -C reduc CC=gcc 

taskset -c 2 ./reduc/reduc 128 1000 > data/reduc_gcc_O3.dat
taskset -c 2 ./reduc/reduc 512 1000 >> data/reduc_gcc_O3.dat
taskset -c 2 ./reduc/reduc 1280 1000 >> data/reduc_gcc_O3.dat
taskset -c 2 ./reduc/reduc 12800 1000 >> data/reduc_gcc_O3.dat

make -C reduc CC=icx

taskset -c 2 ./reduc/reduc 128 1000 > data/reduc_icx_O3.dat
taskset -c 2 ./reduc/reduc 512 1000 >> data/reduc_icx_O3.dat
taskset -c 2 ./reduc/reduc 1280 1000 >> data/reduc_icx_O3.dat
taskset -c 2 ./reduc/reduc 12800 1000 >> data/reduc_icx_O3.dat

make -C reduc CC=clang

taskset -c 2 ./reduc/reduc 128 1000 > data/reduc_clang_O3.dat
taskset -c 2 ./reduc/reduc 512 1000 >> data/reduc_clang_O3.dat
taskset -c 2 ./reduc/reduc 1280 1000 >> data/reduc_clang_O3.dat
taskset -c 2 ./reduc/reduc 12800 1000 >> data/reduc_clang_O3.dat



# REDUC O1
make -C reduc CC=gcc OFLAGS=-O1

taskset -c 2 ./reduc/reduc 128 1000 > data/reduc_gcc_O1.dat
taskset -c 2 ./reduc/reduc 512 1000 >> data/reduc_gcc_O1.dat
taskset -c 2 ./reduc/reduc 1280 1000 >> data/reduc_gcc_O1.dat
taskset -c 2 ./reduc/reduc 12800 1000 >> data/reduc_gcc_O1.dat

make -C reduc CC=icx OFLAGS=-O1

taskset -c 2 ./reduc/reduc 128 1000 > data/reduc_icx_O1.dat
taskset -c 2 ./reduc/reduc 512 1000 >> data/reduc_icx_O1.dat
taskset -c 2 ./reduc/reduc 1280 1000 >> data/reduc_icx_O1.dat
taskset -c 2 ./reduc/reduc 12800 1000 >> data/reduc_icx_O1.dat

make -C reduc CC=clang OFLAGS=-O1

taskset -c 2 ./reduc/reduc 128 1000 > data/reduc_clang_O1.dat
taskset -c 2 ./reduc/reduc 512 1000 >> data/reduc_clang_O1.dat
taskset -c 2 ./reduc/reduc 1280 1000 >> data/reduc_clang_O1.dat
taskset -c 2 ./reduc/reduc 12800 1000 >> data/reduc_clang_O1.dat



# DOTPROD O3
make -C dotprod CC=gcc 

taskset -c 2 ./dotprod/dotprod 128 1000 > data/dotprod_gcc_O3.dat
taskset -c 2 ./dotprod/dotprod 512 1000 >> data/dotprod_gcc_O3.dat
taskset -c 2 ./dotprod/dotprod 1280 1000 >> data/dotprod_gcc_O3.dat
taskset -c 2 ./dotprod/dotprod 12800 1000 >> data/dotprod_gcc_O3.dat

make -C dotprod CC=icx

taskset -c 2 ./dotprod/dotprod 128 1000 > data/dotprod_icx_O3.dat
taskset -c 2 ./dotprod/dotprod 512 1000 >> data/dotprod_icx_O3.dat
taskset -c 2 ./dotprod/dotprod 1280 1000 >> data/dotprod_icx_O3.dat
taskset -c 2 ./dotprod/dotprod 12800 1000 >> data/dotprod_icx_O3.dat

make -C dotprod CC=clang

taskset -c 2 ./dotprod/dotprod 128 1000 > data/dotprod_clang_O3.dat
taskset -c 2 ./dotprod/dotprod 512 1000 >> data/dotprod_clang_O3.dat
taskset -c 2 ./dotprod/dotprod 1280 1000 >> data/dotprod_clang_O3.dat
taskset -c 2 ./dotprod/dotprod 12800 1000 >> data/dotprod_clang_O3.dat



# DOTPROD O1
make -C dotprod CC=gcc OFLAGS=-O1

taskset -c 2 ./dotprod/dotprod 128 1000 > data/dotprod_gcc_O1.dat
taskset -c 2 ./dotprod/dotprod 512 1000 >> data/dotprod_gcc_O1.dat
taskset -c 2 ./dotprod/dotprod 1280 1000 >> data/dotprod_gcc_O1.dat
taskset -c 2 ./dotprod/dotprod 12800 1000 >> data/dotprod_gcc_O1.dat

make -C dotprod CC=icx OFLAGS=-O1

taskset -c 2 ./dotprod/dotprod 128 1000 > data/dotprod_icx_O1.dat
taskset -c 2 ./dotprod/dotprod 512 1000 >> data/dotprod_icx_O1.dat
taskset -c 2 ./dotprod/dotprod 1280 1000 >> data/dotprod_icx_O1.dat
taskset -c 2 ./dotprod/dotprod 12800 1000 >> data/dotprod_icx_O1.dat

make -C dotprod CC=clang OFLAGS=-O1

taskset -c 2 ./dotprod/dotprod 128 1000 > data/dotprod_clang_O1.dat
taskset -c 2 ./dotprod/dotprod 512 1000 >> data/dotprod_clang_O1.dat
taskset -c 2 ./dotprod/dotprod 1280 1000 >> data/dotprod_clang_O1.dat
taskset -c 2 ./dotprod/dotprod 12800 1000 >> data/dotprod_clang_O1.dat



# dgemm O3
make -C dgemm CC=gcc 

taskset -c 2 ./dgemm/dgemm 16 100 > data/dgemm_gcc_O3.dat
taskset -c 2 ./dgemm/dgemm 32 100 >> data/dgemm_gcc_O3.dat
taskset -c 2 ./dgemm/dgemm 64 100 >> data/dgemm_gcc_O3.dat
taskset -c 2 ./dgemm/dgemm 128 100 >> data/dgemm_gcc_O3.dat

make -C dgemm CC=icx

taskset -c 2 ./dgemm/dgemm 16 100 > data/dgemm_icx_O3.dat
taskset -c 2 ./dgemm/dgemm 32 100 >> data/dgemm_icx_O3.dat
taskset -c 2 ./dgemm/dgemm 64 100 >> data/dgemm_icx_O3.dat
taskset -c 2 ./dgemm/dgemm 128 100 >> data/dgemm_icx_O3.dat

make -C dgemm CC=clang

taskset -c 2 ./dgemm/dgemm 16 100 > data/dgemm_clang_O3.dat
taskset -c 2 ./dgemm/dgemm 32 100 >> data/dgemm_clang_O3.dat
taskset -c 2 ./dgemm/dgemm 64 100 >> data/dgemm_clang_O3.dat
taskset -c 2 ./dgemm/dgemm 128 100 >> data/dgemm_clang_O3.dat



# dgemm O1
make -C dgemm CC=gcc OFLAGS=-O1

taskset -c 2 ./dgemm/dgemm 16 100 > data/dgemm_gcc_O1.dat
taskset -c 2 ./dgemm/dgemm 32 100 >> data/dgemm_gcc_O1.dat
taskset -c 2 ./dgemm/dgemm 64 100 >> data/dgemm_gcc_O1.dat
taskset -c 2 ./dgemm/dgemm 128 100 >> data/dgemm_gcc_O1.dat

make -C dgemm CC=icx OFLAGS=-O1

taskset -c 2 ./dgemm/dgemm 16 100 > data/dgemm_icx_O1.dat
taskset -c 2 ./dgemm/dgemm 32 100 >> data/dgemm_icx_O1.dat
taskset -c 2 ./dgemm/dgemm 64 100 >> data/dgemm_icx_O1.dat
taskset -c 2 ./dgemm/dgemm 128 100 >> data/dgemm_icx_O1.dat

make -C dgemm CC=clang OFLAGS=-O1

taskset -c 2 ./dgemm/dgemm 16 100 > data/dgemm_clang_O1.dat
taskset -c 2 ./dgemm/dgemm 32 100 >> data/dgemm_clang_O1.dat
taskset -c 2 ./dgemm/dgemm 64 100 >> data/dgemm_clang_O1.dat
taskset -c 2 ./dgemm/dgemm 128 100 >> data/dgemm_clang_O1.dat

