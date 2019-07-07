
;; YAS Snippents
(use-package yasnippet  :ensure t  :init  
  (yas-global-mode 1)  :config  
  (add-to-list 'yas-snippet-dirs 
	       (locate-user-emacs-file "snippets")))

;; https://emacs.stackexchange.com/questions/36677/how-to-use-yasnippets-tab-expansion-in-minibuffer
;;
(add-hook 'minibuffer-setup-hook 'yas-minor-mode)

;;
(yas--define-parents 'minibuffer-inactive-mode '
		     (lisp-interaction-mode))
;; not to block tab
;;
(define-key minibuffer-local-map [tab] 'yas-expand)
;;
(define-key minibuffer-local-map [tab] 'yas-maybe-expand)

(provide 'init-yas)
