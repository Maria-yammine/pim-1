READ = read -p
MAKE = make
GNATMAKE = gnatmake
FLAG = -gnata -gnatwa -g
SRC_TP3 = $(wildcard tp/tp3/src/*.adb)
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

run_tp3 :
	./selection_sort

clean :
	$(GNATCLEAN) selection_sort

git :
	@$(READ) "Enter the message to set up the commit : " message; \
	$(GIT) $(ADD) && $(GIT) $(COMMIT) "$$message" && $(GIT) $(PUSH)

