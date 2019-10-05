READ = read -p
MAKE = make
GNATMAKE = gnatmake
FLAG = -gnata -gnatwa -g
SRC_TP3 = $(wildcard tp/tp3/src/*.adb)
MOVE = mv
BIN_TP3 = tp/tp3/bin/
GNATCLEAN = gnatclean
GIT = git
ADD = add .
COMMIT = commit -m
PUSH = push

all :
	$(READ) "Enter the number of TP that you want compile : " number; \
	$(MAKE) compile_tp$$number -s; \
	$(MAKE) run_tp$$number -s; \
	$(MAKE) clean -s;

compile_tp3 : $(SRC_TP3)
	$(GNATMAKE) $(FLAG) $(SRC_TP3)
	$(MOVE) selection_sort $(BIN_TP3)
				 
run_tp3 :
	./$(BIN_TP3)selection_sort

clean :
	$(GNATCLEAN) selection_sort
	rm $(BIN_TP3)*

git :
	@$(READ) "Enter the message to set up the commit : " message; \
	$(GIT) $(ADD) && $(GIT) $(COMMIT) "$$message" && $(GIT) $(PUSH)

