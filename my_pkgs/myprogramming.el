;; =====================
;;  Programmer Settings
;; =====================

;; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode 1)

;; Git Mode (magit)
(add-to-list 'load-path "~/configs/emacs/installed_pkgs/magit")
(require 'magit)
(global-set-key (kbd "C-x C-g") 'magit-status)
(defun my-magit-log-edit-mode-hook ()
  (setq fill-column 70))
(add-hook 'magit-log-edit-mode-hook 'my-magit-log-edit-mode-hook)

;; ECB setup
(setq ecb-tip-of-the-day nil)
(custom-set-variables '(ecb-options-version "2.32")) 
;; (setq ecb-layout-name "left9")
(setq ecb-layout-name "top2")


;; Hide-show mode setup
(add-hook 'c-mode-common-hook
	  (lambda()
	    (local-set-key (kbd "C-c <right>") 'hs-show-block)
	    (local-set-key (kbd "C-c <left>")  'hs-hide-block)
	    (local-set-key (kbd "C-c <up>")    'hs-hide-all)
	    (local-set-key (kbd "C-c <down>")  'hs-show-all)
	    (hs-minor-mode t)))


;; Treat Java 1.5 @-style annotations as comments
(add-hook 'java-mode-hook 
	  '(lambda () "Treat Java 1.5 @-style annotations as comments."
	     (setq c-comment-start-regexp 
		   "\\(@\\|/\\(/\\|[*][*]?\\)\\)")
	     (modify-syntax-entry ?@ "< b" 
				  java-mode-syntax-table)))


;; comment/uncomment
;; easy commenting out of lines
(defun uncomment-region (beg end)
  "Like `comment-region' invoked with a C-u prefix arg."
  (interactive "r")
  (comment-region beg end -1))
(global-set-key [f2] 'comment-region)
(global-set-key [(shift f2)] 'uncomment-region)


;; ;; full screen toggle using M-[RET]
;; (defun toggle-fullscreen ()
;;   (interactive) 
;;   (set-frame-parameter nil 'fullscreen (if (frame-parameter nil
;;                                            'fullscreen) nil
;;                                            'fullboth)))
;; (global-set-key [(meta return)] 'toggle-fullscreen) 




;; ;; -----------------
;; ;; CEDET System
;; ;; -----------------
;; (load-file "~/misc/emacs/code_browser/cedet-1.0pre6/common/cedet.el")
;; (add-to-list 'load-path "~/misc/emacs/code_browser/ecb-2.40")
;; ;(global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-minimum-features)
;; (global-semantic-tag-folding-mode 1)
;; (require 'semantic-load)
;; (require 'ecb-autoloads)
;; (custom-set-variables
;;  '(ecb-options-version "2.40"))


;; ;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;; ;(global-srecode-minor-mode 1)            ; Enable template insertion menu
;; ;(setq semantic-load-turn-everything-on t)
;; ;(require 'semantic-load)
;; ;(require 'ecb-autoloads)
;; ;(custom-set-variables
;; ; '(ecb-options-version "2.40"))



;; -----------------
;; Programming modes
;; -----------------

;; ;; Prolog
;; (require 'prolog)
;; (setq auto-mode-alist (append '(("\\.pl$" . prolog-mode))
;;                                    auto-mode-alist))


;; C/C++
;;(require 'cc-mode)
(setq auto-mode-alist (append '(("\\.cpp$" . c++-mode))
			      auto-mode-alist))
(setq c-default-style "gnu")
(setq-default c-basic-offset 2)
(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
  (c-set-offset 'cpp-macro 0)
  ;; other customizations can go here
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)



;; ;; Ocaml
;; (add-to-list 'load-path "~/misc/emacs/installed_pkgs/ocaml")
;; (setq auto-mode-alist
;;           (cons '("\\.ml[iylp]?$" . caml-mode) auto-mode-alist))
;; (autoload 'caml-mode "caml" "Major mode for editing Caml code." t)
;; (autoload 'run-caml "inf-caml" "Run an inferior Caml process." t)
;; ;; (if window-system (require 'caml-font))


;; HTML
(setq auto-mode-alist
      (cons '("\\.\\(rng\\|html\\|shtml\\|xhtml\\|jspx\\)\\'" . html-mode)
	    auto-mode-alist))

;; XML mode
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|xsd\\)\\'" . nxml-mode)
	    auto-mode-alist))

;; Eiffel
(add-to-list 'auto-mode-alist '("\\.e\\'" . eiffel-mode))
(autoload 'eiffel-mode "eiffel" "Major mode for Eiffel programs" t)


;; Matlab
(autoload 'matlab-mode "matlab.el" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab.el" "Interactive Matlab mode." t)

;; Flyspell mode for latex
(add-hook 'latex-mode-hook 'flyspell-mode)


;; ;; Haskell
;; (load "~/misc/emacs/installed_pkgs/haskell-mode-2.4/haskell-site-file.el")
;; ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)


;; Javascript
(require 'javascript-mode)
(setq auto-mode-alist (append '(("\\.js$" . javascript-mode))
			      auto-mode-alist))


;; JS2 mode
(require 'js2-mode)
(setq auto-mode-alist (append '(("\\.js2$" . js2-mode))
                                   auto-mode-alist))


;; Batch Files
(require 'dos)
(setq auto-mode-alist
      (cons '("\\.\\(cmd\\|bat\\)\\'" . dos-mode)
	    auto-mode-alist))




;; VBScript
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(add-to-list 'auto-mode-alist '("\\.vbs\\'" . visual-basic-mode)) ;VBscript
(add-to-list 'auto-mode-alist '("\\.wsf\\'" . visual-basic-mode)) ;WScript
;; (add-to-list 'auto-mode-alist '("\\.vb\\'" . visual-basic-mode))  ;visual basic .NET file
;; (add-to-list 'auto-mode-alist '("\\.bas\\'" . visual-basic-mode)) ;visual basic form
;; (add-to-list 'auto-mode-alist '("\\.frm\\'" . visual-basic-mode)) ;basic language source
;; (add-to-list 'auto-mode-alist '("\\.cls\\'" . visual-basic-mode)) ;C++ class definition file



;; PHP
(autoload 'php-mode "php-mode.el" "PHP mode." t)
(add-to-list 'auto-mode-alist
	     '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))


;; Puppet Mode
(autoload 'puppet-mode "puppet-mode.el" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))


;; YAML Mode
(autoload 'yaml-mode "yaml-mode.el" "Major mode for editing YAML files")
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))


;; Apache Mode
(autoload 'apache-mode "apache-mode.el" "Major mode for editing Apache config files")

;; NSIS Mode
(autoload 'nsis-mode "nsis-mode" "NSIS mode" t)
(setq auto-mode-alist (append '(("\\.\\([Nn][Ss][Ii]\\)$" .
                                 nsis-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.\\([Nn][Ss][Hh]\\)$" .
                                 nsis-mode)) auto-mode-alist))


(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))


