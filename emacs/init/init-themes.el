;; require-package refershes from melpa
;;
;; Initiate monokai theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(require-package 'monokai)
(setq custom-safe-themes t)
(load-theme 'monokai t)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '
	      (monokai))

;; Ensure that themes will be applied even if they have not been customized
;; (defun reapply-themes 
;;     ()  "Forcibly load the themes listed in `custom-enabled-themes'."  
;;     (dolist 
;; 	(theme custom-enabled-themes)    
;;       (unless 
;; 	  (custom-theme-p theme)      
;; 	(load-theme theme)))  
;;     (custom-set-variables `
;;      (custom-enabled-themes 
;;       (quote ,custom-enabled-themes))))

;; (add-hook 'after-init-hook 'reapply-themes)

;; (when 
;;     (maybe-require-package 'dimmer)  
;;   (setq-default dimmer-fraction 0.1)  
;;   (add-hook 'after-init-hook 'dimmer-mode))

(provide 'init-themes)
