default: run

run: build
	stack exec site watch

build:
	stack build
	stack exec site rebuild

clean:
	stack exec site clean
