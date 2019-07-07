
(require 'company)
(require 'color)
;; https://www.emacswiki.org/emacs/CompanyMode
;; https://github.com/company-mode/company-mode/wiki/Switching-from-AC
;;
(use-package company :ensure t :pin melpa)

(add-hook 'after-init-hook 'global-company-mode)
;; customize company-mode 
(setq company-idle-delay 0) 
(setq company-echo-delay 0) 
(setq company-minimum-prefix-length 1) 

(provide 'init-company)
