;; ======================================================
;;  Settings for searching, replacing, and spellchecking
;; ======================================================

;; ;; Load rxvt bindings
;; (load-file "~/configs/emacs/installed_pkgs/rxvt.el")

;; Load the xterm-extras package
;(require 'xterm-extras)
;(xterm-extra-keys)


;; --------------
;; Spell Checking
;; --------------
(setq-default ispell-program-name "/opt/local/bin/aspell")
(setq text-mode-hook '(lambda()
                         (flyspell-mode t)
                         ))

;; ---------------
;; Home & End Keys
;; ---------------
(global-set-key [home] `beginning-of-line)
(global-set-key [end] `end-of-line)



;; --------------------------
;; Play nice in terminal mode 
;; --------------------------
(global-unset-key "\C-s")
;; (global-unset-key "\C-q")
(global-set-key "\C-xs" `save-buffer)
(global-set-key (kbd "M-s") 'isearch-forward)
(global-set-key (kbd "M-S") 'isearch-backward)
(add-hook 'isearch-mode-hook
	  (lambda ()
	    (define-key isearch-mode-map (kbd "M-s") 'isearch-repeat-forward)
	    (define-key isearch-mode-map (kbd "M-S") 'isearch-repeat-backward) ))


;; -------------------------------
;; "Select All" function
;; -------------------------------
(global-unset-key "\C-xa")
(global-set-key "\C-xa" `mark-whole-buffer)
(global-set-key "\C-x\C-a" `mark-whole-buffer)


;; -------------------------------
;; Highlight matches from searches
;; -------------------------------
(setq isearch-highlight t)
(setq search-highlight t)
(setq-default transient-mark-mode t)

;; --------------------------
;; Highlight during searching
;; --------------------------
(setq query-replace-highlight t)

;; ----------------------------
;; Highlight incremental search
;; ----------------------------
(setq search-highlight t)


