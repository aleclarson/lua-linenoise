OS=$(shell uname)

ifeq ($(LIBLINENOISE),)
LIBLINENOISE=linenoiselib.o
endif

ifeq ($(OS),Darwin)
linenoise.dylib: linenoise.o $(LIBLINENOISE)
	gcc -o $@ -bundle -undefined dynamic_lookup $^
else
CFLAGS=-fPIC -I/usr/include/lua5.1
linenoise.so: linenoise.o $(LIBLINENOISE)
	gcc -o $@ -shared $^
endif

clean:
	rm -f *.o *.so *.dylib
