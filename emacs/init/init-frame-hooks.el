
(require 'transpose-frame)
(require 'frame-fns)
(require 'frame-cmds)
(require 'zoom-frm)

;; https://www.emacswiki.org/emacs/transpose-frame.el


;; Frames manipulation related files
;; https://www.emacswiki.org/emacs/download/frame-cmds.el
;; https://www.emacswiki.org/emacs/download/frame-fns.el
;; https://www.emacswiki.org/emacs/download/fit-frame.el
;; https://www.emacswiki.org/emacs/download/autofit-frame.el
;; https://www.emacswiki.org/emacs/download/zoom-frm.el
;; https://www.emacswiki.org/emacs/download/doremi-frm.el
;; https://www.emacswiki.org/emacs/Shrink-Wrapping_Frames
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Frame-Geometry.html#Frame-Geometry

;; Swap Buffers
(defun swap-buffers-in-windows 
    ()  "Put the buffer from the selected window in next window, and vice versa"  
    (interactive)  
    (let* 
	(
	 (this 
	  (selected-window))  
	 (other 
	  (next-window))  
	 (this-buffer 
	  (window-buffer this))  
	 (other-buffer 
	  (window-buffer other)))    
      (set-window-buffer other this-buffer)    
      (set-window-buffer this other-buffer)    )  )

;; The file name as window name
;; 
(setq-default frame-title-format '
	      ("%f"))

;; The file name and the major mode as window name 
(my conf)
(setq-default frame-title-format '
	      ("%f [%m]"))

(provide 'init-frame-hooks)
