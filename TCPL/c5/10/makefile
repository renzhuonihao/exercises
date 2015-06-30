cal : main.o stack.o
	gcc main.o stack.o -o cal -lm
main.o: main.c cal.h
	gcc -c main.c
stack.o:stack.c cal.h
	gcc -c stack.c
.PHONY:clean
clean:
	rm -f cal main.o stack.o
