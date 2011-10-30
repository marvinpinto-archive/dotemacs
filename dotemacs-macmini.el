;; =======================================
;;  ~/.emacs config file for the Mac Mini
;; =======================================

;; Load custom config files
(add-to-list 'load-path "~/configs/emacs/installed_pkgs/")
(add-to-list 'load-path "~/configs/emacs/my_pkgs/")

(load "myprinting")			;; PS/PDF printing
(load "myindentation")			;; Indents/Tabs
(load "myediting")			;; Search/Replace/Spellcheck
(load "mybuffers")			;; Buffer settings
(load "mygui")				;; GUI settings
(load "myprogramming")			;; Dev settings
(load "mycolors")			;; color theme settings
(load "myosx")				;; osx settings


