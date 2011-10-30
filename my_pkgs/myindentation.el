;; ===================================
;;  Settings for tabs and indentation
;; ===================================


;; ------------
;; Tab Settings
;; ------------
;(setq basic-offset 2)
(setq c-basic-offset 4)
(setq tab-width 4)
;(setq-default indent-tabs-mode nil)	;; insert spaces instead of tabs
(global-set-key (kbd "TAB") 'self-insert-command)


;; --------------------------------
;; Function: Convert tabs to spaces
;; --------------------------------
(defun untabify-buffer ()
  "Untabify the whole (accessible part of the) current buffer"
  (interactive)
  (save-excursion
    (untabify (point-min) (point-max))))


;; --------------------------------
;; Function: Convert spaces to tabs
;; --------------------------------
(defun tabify-buffer ()
  "Tabify the whole (accessible part of the) current buffer"
  (interactive)
  (save-excursion
    (tabify (point-min) (point-max))))



;; --------------------------------
;; Functions: Block Indent/Unindent
;; --------------------------------
(defun indent-block()
	(interactive)
	(shift-region tab-width)
	(setq deactivate-mark nil))


(defun unindent-block()
	(interactive)
	(shift-region -2)
	(setq deactivate-mark nil))


(defun shift-region(numcols)
; my trick to expand the region to the beginning and end of the area selected
; a convenient feature to which I was used, from the Dreamweaver editor
(if (< (point)(mark))
(if (not(bolp)) 
	(progn (beginning-of-line)(exchange-point-and-mark) (end-of-line)))
	(progn (end-of-line)(exchange-point-and-mark)(beginning-of-line)))
	(setq region-start (region-beginning))
	(setq region-finish (region-end))
	(save-excursion
		(if (< (point) (mark)) (exchange-point-and-mark))
		(let ((save-mark (mark)))
			(indent-rigidly region-start region-finish numcols))))


(defun indent-or-complete () 
"Indent region selected as a block; if no selection present either indent
 according to mode, or expand the word preceding point. "
	(interactive)
	(if  mark-active
			(indent-block)
		(if (looking-at "\\>")
				(hippie-expand nil)
			(insert "\t"))))

(defun my-unindent()
	"Unindent line, or block if it's a region selected"
	(interactive)
	(if mark-active
			(unindent-block)
		(if(not(bolp))(delete-backward-char 2))))


(add-hook 'find-file-hooks (function (lambda ()
(local-set-key (kbd "<tab>") 'indent-or-complete))))
;; Now remember to force tab (C-q-tab) if you want to simply insert a tab
(define-key global-map [f3] 'indent-or-complete) 
(define-key global-map [(shift f3)] 'my-unindent)

