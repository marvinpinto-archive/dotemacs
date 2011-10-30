;; =================
;;  Buffer Settings
;; =================

;; View line as well as column numbers in the modeline
(setq line-number-mode t)
(setq column-number-mode t)

;; Show line numbers in the left margin
(global-linum-mode 1)
;; (setq linum-format "%d ")

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Remove the startup "banner"
(setq inhibit-startup-message t)

;; Make Text mode the default mode for new buffers
(setq default-major-mode 'text-mode)
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq default-fill-column 80)	;; 80 columns
;(set-default 'truncate-lines t)

;; Shut off the message buffer
(setq message-log-max nil)
(kill-buffer "*Messages*")

;; Provide a useful error trace if loading this .emacs fails.
(setq debug-on-error t)

;; This sets garbage collection to hundred times of the default. 
;; Supposedly significantly speeds up startup time. (Seems to work
;; for me,  but my computer is pretty modern. Disable if you are on 
;; anything less than 1 ghz).
(setq gc-cons-threshold 50000000)

;; ;; ;; Use ANSI colors within shell-mode
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ;; "I always compile my .emacs, saves me about two seconds
;; ;; startuptime. But that only helps if the .emacs.elc is newer
;; ;; than the .emacs. So compile .emacs if it's not."
;; (defun autocompile nil
;;   "compile itself if ~/.emacs"
;;   (interactive)
;;   (require 'bytecomp)
;;   (if (string= (buffer-file-name) (expand-file-name (concat
;; default-directory ".emacs")))
;;       (byte-compile-file (buffer-file-name))))
;; (add-hook 'after-save-hook 'autocompile)


;; Go to the next line >80 chars long
(defun next-long-line (arg)
  "Move to the ARGth next long line greater than `fill-column'."
  (interactive "p")
  (or arg (setq arg 1))
  (let ((opoint (point))
	(line-length 0))
    ;; global-variable: fill-column
    (while (and (<= line-length fill-column)
		(zerop (forward-line (if (< arg 0) -1 1))))
      (setq line-length (save-excursion
			  (end-of-line)
			  (current-column))))
    ;; Stop, end of buffer reached.
    (if (> line-length fill-column)
	(if (> arg 1)
	    (my-next-long-line (1- arg))
	  (if (< arg -1)
	      (my-next-long-line (1+ arg))
	    (message (format "Long line of %d columns found"
			     line-length))))
      (goto-char opoint)
      (message "Long line not found"))))
(global-unset-key [?\C-l])
(define-key global-map [?\C-l] 'next-long-line) 


;; reload current buffer
(defun refresh ()
  (interactive)
  (revert-buffer t t t)
)


; overwrite selection with typing
(delete-selection-mode t)


;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the
;; right under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char) 
(global-set-key [kp-delete] 'delete-char)


;; Enable wheelmouse support by default
(cond (window-system
       (mwheel-install)
))



;; alias y to yes and n to no
(defalias 'yes-or-no-p 'y-or-n-p)


;; Smooth copy/paste
;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;; C-x k is a command I use often, but C-x C-k (an easy mistake) is
;; bound to nothing!
;; Set C-x C-k to same thing as C-x k.
(global-set-key "\C-x\C-k" 'kill-this-buffer)


;; ;; Cycle between buffers (compatible with term mode)
;; (global-set-key [?\C-c right] 'next-buffer)
;; (global-set-key [?\C-c left] 'previous-buffer)


;; ;; Show line numbers down the left side
;; (require 'linum)
;; (global-linum-mode)


;; Completely disable backups and autosaves
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq make-backup-files nil)


;; Disallow Ctrl-Z from backgrounding emacs
(global-set-key [?\C-z] nil)


;; Modify the scratch buffer
(setq initial-scratch-message
(format ";; scratch buffer created %s\n;; happy hacking!\n\n"
(format-time-string "%Y-%m-%d at %T")))


;;; A interactive function for replacing all dos
;;; carriage returns (^M) with Unix 
;;; line feeds in a selected buffer. 
(defun dos2unix (buffer)
  "Automate M-% C-q C-m RET C-q C-j RET"
  (interactive "b buffer to convert" )
  (goto-char (point-min))
  (while (search-forward (string ?\C-m) nil t)
    (replace-match "" nil t)))


;; Tramp for remote editing
(require 'tramp)
(add-to-list 'backup-directory-alist
	     (cons tramp-file-name-regexp nil))


;; ;; Elscreen setup
;; (load "elscreen" "ElScreen")
;; ;; F9 creates a new elscreen, Ctrl-F9 kills it                               
;; (global-set-key (kbd "<f9>"    ) 'elscreen-create)                            
;; (global-set-key (kbd "<C-f9>"  ) 'elscreen-kill)                              
;; ;; Ctrl+PgUP/PgDown switches between elscreens                          
;; (global-set-key (kbd "<C-prior>") 'elscreen-previous)                         
;; (global-set-key (kbd "<C-next>")  'elscreen-next)


;; IDO mode for buffers
(require 'ido)
(ido-mode t)


;; BS-mode for buffers
(require 'bs)
(global-set-key (kbd "C-x C-b") 'bs-show)


(defun scroll-up-one-line()
  (interactive)
  (scroll-up 1))

(defun scroll-down-one-line()
  (interactive)
  (scroll-down 1))

(global-set-key [?\C-.] 'scroll-down-one-line)
(global-set-key [?\C-,] 'scroll-up-one-line)


;; Uniquify multiple buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


