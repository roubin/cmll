

all: main.exe

main.exe: main.o cmll.o
	@g++ main.o cmll.o -o main.exe

main.o: main.cpp
	@g++ -c main.cpp

cmll.o: cmll.cpp
	@g++ -c cmll.cpp

clean:
	@rm -fv *o
	@rm -fv *exe
	@rm -fv *~