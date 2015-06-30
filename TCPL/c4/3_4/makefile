cal: main.o stack.o getop.o
	gcc  main.o stack.o getop.o -o cal -lm
main.o:main.c calc.h
	gcc -c  main.c
stack.o:stack.c calc.h
	gcc -c stack.c
getop.o:getop.c calc.h
	gcc -c getop.c
.PHONY:clean
clean:
	rm cal main.o stack.o getop.o