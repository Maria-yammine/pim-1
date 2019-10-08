all : compile run clean

compile : multiplications.adb
	gnatmake -gnatwa multiplications.adb

run : multiplications
	./multiplications

clean : 
	gnatclean multiplications
