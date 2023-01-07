default: run

run: build
	cabal run site watch

build:
	cabal build
	cabal run site rebuild

clean:
	cabal run site clean
