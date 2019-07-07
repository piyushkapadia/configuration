;;; Colourise CSS colour literals
(when 
    (maybe-require-package 'rainbow-mode)  
  (dolist 
      (hook '
       (css-mode-hook html-mode-hook sass-mode-hook))    
    (add-hook hook 'rainbow-mode)))

;;; SASS and SCSS
(require-package 'sass-mode)
(require-package 'scss-mode)
(setq-default scss-compile-at-save nil)
;;; LESS
(require-package 'less-css-mode)
(when 
    (maybe-require-package 'skewer-less)  
  (add-hook 'less-css-mode-hook 'skewer-less-mode))
;; Skewer CSS
(when 
    (maybe-require-package 'skewer-mode)  
  (add-hook 'css-mode-hook 'skewer-css-mode))

(provide 'init-css)
