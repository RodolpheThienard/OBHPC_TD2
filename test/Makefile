CC=gcc
BIN=test
DOT=../dotprod/kernels.c
REDUC=../reduc/kernels.c
DGEMM=../dgemm/kernels.c

.PHONY: test

all: test
	./test

test:
	$(CC) -o $(BIN) test.c $(DOT) $(REDUC) $(DGEMM) -lcblas

clean: 
	$(RM) $(BIN)