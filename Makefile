
all:build client1 client2

LIB = awesome.so

build:
	CGO_ENABLED='1' go build -o ${LIB} -buildmode=c-shared awesome.go
	@chmod +x ${LIB}

client1: build
	gcc -o client1 client1.c ./awesome.so

client2: build
	gcc -o client2 client2.c -ldl

clean:
	@rm ${LIB} awesome.h

.PHONY: all build client1 client2 clean

