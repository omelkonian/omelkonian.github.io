.PHONY: all run build clean

all:
	make build
	make run

run:
	stack exec site watch

build:
	stack build
	stack exec site rebuild

clean:
	stack exec site clean
