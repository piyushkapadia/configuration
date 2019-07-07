
;; Add JSLInt

(require 'json-mode)
(require 'js2-mode)
(require 'js2-refactor) 


;;;;;;;;;;;;;;;;;
 (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
 (add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-hook 'js2-mode-hook #'js2-refactor-mode) 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Typescript
;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;;;;;
(add-hook 'js2-mode-hook #'setup-tide-mode)
;; configure javascript-tide checker to run after your default javascript checker
;;(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)


(provide 'init-javascript)
