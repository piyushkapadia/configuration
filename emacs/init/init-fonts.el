
;;; Changing font sizes

(require 'default-text-scale)
;;
(add-hook 'after-init-hook 'default-text-scale-mode)

(defun maybe-adjust-visual-fill-column 
    ()  "Readjust visual fill column when the global font size is modified.This is helpful for writeroom-mode, in particular."  
    ;; TODO: submit as patch  
    (if visual-fill-column-mode      
	(add-hook 'after-setting-font-hook 'visual-fill-column--adjust-window nil t)    
      (remove-hook 'after-setting-font-hook 'visual-fill-column--adjust-window t)))

(add-hook 'visual-fill-column-mode-hook          'maybe-adjust-visual-fill-column)


(provide 'init-fonts)
