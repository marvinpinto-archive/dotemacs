;; ======================
;;  Color Theme Settings
;; ======================

(add-to-list 'load-path "~/configs/emacs/installed_pkgs/color-theme-6.6.0")
(add-to-list 'load-path "~/configs/emacs/installed_pkgs/color-theme-6.6.0/themes")
(require 'color-theme)
(color-theme-initialize)

;; Color suggestions:
;; color-theme-charcoal-black
;; color-theme-ld-dark


(if window-system
     (color-theme-tango)
   (color-theme-charcoal-black))

;(color-theme-subdued)
;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)




