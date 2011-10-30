all: compile

clean:
	rm -f *.elc

compile:
	emacs -batch -q -no-site-file -f batch-byte-compile mybuffers.el
	emacs -batch -q -no-site-file -eval "(progn (add-to-list (quote load-path) (expand-file-name \"~/configs/emacs/installed_pkgs/color-theme-6.6.0\")) )" -f batch-byte-compile mycolors.el
	emacs -batch -q -no-site-file -f batch-byte-compile myediting.el
	emacs -batch -q -no-site-file -f batch-byte-compile mygui.el
	emacs -batch -q -no-site-file -f batch-byte-compile myindentation.el
	emacs -batch -q -no-site-file -eval "(progn (add-to-list (quote load-path) (expand-file-name \"~/configs/emacs/installed_pkgs/orgmode/lisp/\")) )" -f batch-byte-compile myorgmode.el
	emacs -batch -q -no-site-file -f batch-byte-compile myosx.el
	emacs -batch -q -no-site-file -f batch-byte-compile myprinting.el
	emacs -batch -q -no-site-file -eval "(progn (add-to-list (quote load-path) (expand-file-name \"~/configs/emacs/installed_pkgs/\")) )" -eval "(progn (add-to-list (quote load-path) (expand-file-name \"~/misc/emacs/installed_pkgs/ocaml/\")) )" -f batch-byte-compile myprogramming.el


