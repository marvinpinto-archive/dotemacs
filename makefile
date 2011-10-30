# MAKE = make

all:
	@echo "choose <init> or <macmini>"

init: clean byte_compile

clean:
	cd installed_pkgs; $(MAKE) clean;
	cd my_pkgs; $(MAKE) clean;

byte_compile:
	cd installed_pkgs; $(MAKE);
	cd my_pkgs; $(MAKE);

macmini:
	rm -f ~/.emacs
	rm -f ~/.ido.last
	rm -rf ~/.emacs.d
	ln -s ~/configs/emacs/dotemacs.el ~/.emacs

