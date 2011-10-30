;; ==================================
;;  Load the appropriate .emacs file
;; ==================================

(cond 
 ((string-match "macmini.local" (system-name))
  (message "Loading MACMINI config files.")
  (load-file "~/configs/emacs/dotemacs-macmini.el")))


