CFLAGS=-Wall

OFLAGS=-O3

INTEL_LFLAGS=-qmkl
GNU_LFLAGS=-lm -lcblas

FILES=main.c tools.c kernels.c

all: dgemm

perf:
	icx $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(INTEL_LFLAGS)
	./perf 128 100 icx
	rm perf
	gcc $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(GNU_LFLAGS)
	./perf 128 100 gcc
	rm perf
	clang $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(GNU_LFLAGS)
	./perf 128 100 clang
	rm perf

taskset:
	icx $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(INTEL_LFLAGS)
	taskset -c 0 ./taskset 128 100 icx
	rm taskset
	gcc $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(GNU_LFLAGS)
	taskset -c 0 ./taskset 128 100 gcc
	rm taskset
	clang $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(GNU_LFLAGS)
	taskset -c 0 ./taskset 128 100 clang
	rm taskset

dgemm:
ifeq ($(CC),icc)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(INTEL_LFLAGS)
else
ifeq ($(CC),icx)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(INTEL_LFLAGS)
else
ifeq ($(CC),gcc)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(GNU_LFLAGS)
else
ifeq ($(CC),clang)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(GNU_LFLAGS)
else
	@echo "ERROR: no compiler specified using CC. Possible values for CC: gcc, icc, icx, clang"
endif
endif
endif
endif

clean:
	@rm -Rf dgemm perf
	$(RM) *.csv
