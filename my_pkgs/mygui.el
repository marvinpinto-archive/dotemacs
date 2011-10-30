;; ==============
;;  GUI Settings 
;; ==============

;; Remove the toolbar
(tool-bar-mode -1)

;; format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")

;; disable the menu bar
(menu-bar-mode -1)

;; lose the scrollbar
(scroll-bar-mode -1)

;; initial frame position
;; (setq initial-frame-alist '((top . 145) (left . 60)))
;; (setq initial-frame-alist '((top . 145) (left . 60)))

;; frame dimensions
(if (window-system)
    (set-frame-size (selected-frame) 85 45))
    ;; (set-frame-size (selected-frame) 90 55))


;; ;; Swap the control and caps-lock keys
;; (if (eq window-system 'x)
;;     (shell-command "xmodmap -e 'remove Lock = Caps_Lock' -e 'remove Control = Control_L' -e 'keysym Control_L = Caps_Lock' -e 'keysym Caps_Lock = Control_L' -e 'add Lock = Caps_Lock' -e 'add Control = Control_L'"))
;; (global-set-key [f13] 'execute-extended-command)


;; ;; Function to toggle the menubar
;; (defun toggle-menubar ()
;;   (interactive)
;;   (set-specifier
;;    menubar-visible-p
;;    (not (specifier-instance menubar-visible-p))))




