# Navneet Agarwal
# 2018348
CC=gcc

all: prog-add
	./prog-add
prog-add: prog-add.o
	$(CC) prog-add.o  -static addfunction.o -o prog-add

prog-add.o: prog-add.s
	$(CC) -c prog-add.s

prog-add.s: prog-add.i
	$(CC) -S prog-add.i

prog-add.i: assemble
	$(CC) -E prog-add.c > prog-add.i

assemble:
	nasm -f elf64 addfunction.asm -o addfunction.o

clean:
	rm -rf prog-add.o prog-add.i prog-add.s addfunction.o prog-add