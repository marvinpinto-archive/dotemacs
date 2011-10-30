all: compile

clean:
	cd color-theme-6.6.0; $(MAKE) clean;
	rm -f *.elc

compile:
	cd color-theme-6.6.0; $(MAKE);
	emacs -batch -q -no-site-file -f batch-byte-compile *.el


