READ = read -p
GIT = git
ADD = add .
COMMIT = commit -m
PUSH = push

git :
	@$(READ) "Enter the message to set up the commit : " message; \
	$(GIT) $(ADD) && $(GIT) $(COMMIT) "$$message" && $(GIT) $(PUSH)

