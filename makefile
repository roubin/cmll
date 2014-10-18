
all: main.exe

main.exe: main.o cmll.h chrono.h
	@g++ main.o -o main.exe

main.o: main.cpp cmll.h chrono.h
	@g++ -c main.cpp

clean:
	@rm -fv *.o
	@rm -fv *.exe
	@rm -fv *~