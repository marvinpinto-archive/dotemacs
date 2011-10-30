;; ==============================================
;;  Enable PS and PDF printing from within emacs
;; ==============================================


;; -------------------------
;; Setup printed output page
;; -------------------------
(defun set-printer-preferences () ; ps-print settings
  "Setup print preferences."
  (set 'ps-font-size '(9 . 9)) ; body font size
  (set 'ps-header-font-size '(6 . 6)) ; don't need big fonts here
  (set 'ps-header-title-font-size '(7 . 7)) ; don't need big fonts here
  (set 'ps-landscape-mode nil)
  (set 'ps-line-number t)
  (set 'ps-number-of-columns 1)
  (set 'ps-print-header t)
  (set 'ps-print-header-frame t)
  (set 'ps-header-lines 3)
  (set 'ps-show-n-of-n t)
  (set 'ps-font-family 'Courier)
  (set 'ps-header-font-family 'Helvetica )
  (message "Printing preferences are set."))
(set-printer-preferences)



;; ----------------------------
;; Pretty print in color to PDF
;; ----------------------------
(defun print-color-pdf ()
  (interactive)
  (setq ps-print-color-p t)
  (ps-spool-buffer-with-faces)
  (switch-to-buffer "*PostScript*")
  (write-file "/tmp/tmp.ps")
  (kill-buffer "tmp.ps")
  (setq cmd (concat "ps2pdf14 /tmp/tmp.ps " (buffer-name) ".pdf"))
  (shell-command cmd)
  (shell-command "rm /tmp/tmp.ps")
  (message (concat "Saved to:  " (buffer-name) ".pdf")))


;; -------------------------
;; Pretty print in bw to PDF
;; -------------------------
(defun print-bw-pdf ()
  (interactive)
  (setq ps-print-color-p nil)
  (ps-spool-buffer-with-faces)
  (switch-to-buffer "*PostScript*")
  (write-file "/tmp/tmp.ps")
  (kill-buffer "tmp.ps")
  (setq cmd (concat "ps2pdf14 /tmp/tmp.ps " (buffer-name) ".pdf"))
  (shell-command cmd)
  (shell-command "rm /tmp/tmp.ps")
  (message (concat "Saved to:  " (buffer-name) ".pdf")))




;; ;; --------------------------------
;; ;; Windows Printing
;; ;; --------------------------------
;; (setenv "GS_LIB" "C:/Program Files (x86)/gs/gs9.00/lib")
;; (setq ps-lpr-command "C:/Program Files (x86)/gs/gs9.00/bin/gswin32c.exe")
;; (setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH" "-sDEVICE=mswinpr2"))
;; (setq ps-printer-name t)






;; ;; --------------------------------
;; ;; Setup printed output page
;; ;; --------------------------------
;; (setq ps-print-header t)
;; (setq ps-header-lines 2)
;; (setq ps-left-header (list 'buffer-name))
;; (setq ps-right-header (list 'ps-time-stamp-mon-dd-yyyy
;; 			    "/pagenumberstring load"))
;; (setq ps-line-number t)

;; -------------------
;; Pretty print to PDF
;; -------------------
(defun print-to-pdf ()
  (interactive)
  (ps-spool-buffer-with-faces)
  (switch-to-buffer "*PostScript*")
  (write-file "/tmp/tmp.ps")
  (kill-buffer "tmp.ps")
  (setq cmd (concat "ps2pdf14 /tmp/tmp.ps " (buffer-name) ".pdf"))
  (shell-command cmd)
  (shell-command "rm /tmp/tmp.ps")
  (message (concat "Saved to:  " (buffer-name) ".pdf"))
)


;; ;; ------------------
;; ;; Pretty print to PS
;; ;; ------------------
;; (defun print-to-ps ()
;;   (interactive)
;;   (ps-spool-buffer-with-faces)
;;   (switch-to-buffer "*PostScript*")
;;   (write-file "/tmp/tmp.ps")
;;   (kill-buffer "tmp.ps")
;;   (setq cmd (concat "mv /tmp/tmp.ps " (buffer-name) ".ps"))   
;;   (shell-command cmd)
;;   (message (concat "Saved to:  " (buffer-name) ".ps"))
;; )

