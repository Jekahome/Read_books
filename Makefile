PORT ?= 3005

.PHONY: all

all: commit

pull:
	git pull origin main

commit:  pull
	git add .  
	@git diff --cached --exit-code || git commit --allow-empty-message -m "" 
	git push

run:
	mdbook serve --hostname 127.0.0.1 --port $(PORT) 

stop:
	kill $(shell lsof -t -i :$(PORT)) || echo "No process running on port $(PORT)"


# Use pull + commit + push:
# make

# make run

# make stop