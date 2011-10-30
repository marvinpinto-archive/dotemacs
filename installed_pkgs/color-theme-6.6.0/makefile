all: compile

clean:
	rm -f *.elc
	rm -f themes/*.elc

compile:
	emacs -batch -q -no-site-file -eval "(progn (add-to-list (quote load-path) (expand-file-name \"./\")) )" -f batch-byte-compile color-theme.el
	emacs -batch -q -no-site-file -eval "(progn (add-to-list (quote load-path) (expand-file-name \"./\")) )" -f batch-byte-compile themes/*.el

