CC = gcc
LDFLAGS += -L../.libs -lev
CC_OPTS = -Wall -g -Werror -ggdb3 -I./include -Wno-error=unused-but-set-variable

all: obj/array-heap.o bin/unix-echo-server bin/unix-echo-client bin/udp-echo-server

clean:
	rm -f *.o bin/*

bin/array-test: src/array-test.c obj/array-heap.o
	$(CC) $(CC_OPTS) -o $@ $< obj/array-heap.o $(LDFLAGS)

obj/array-heap.o: src/array-heap.c include/array-heap.h
	$(CC) $(CC_OPTS) -o $@ -c $< $(LDFLAGS)

bin/udp-echo-server: src/udp-echo-server.c
	$(CC) $(CC_OPTS) -o $@ $< $(LDFLAGS)

bin/unix-echo-server: src/unix-echo-server.c obj/array-heap.o
	$(CC) $(CC_OPTS) -o $@ $< obj/array-heap.o $(LDFLAGS)

bin/unix-echo-client: src/unix-echo-client.c
	$(CC) $(CC_OPTS) -o $@ $< $(LDFLAGS)
