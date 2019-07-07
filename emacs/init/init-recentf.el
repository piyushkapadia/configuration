;; Recent Files List
;; https://www.emacswiki.org/emacs/RecentFiles

(use-package recentf
  :bind (("C-c T w" . whitespace-mode))
  :init
  (dolist (hook '(prog-mode-hook text-mode-hooki
                  conf-mode-hook))
    (add-hook hook #'whitespace-mode))
  :config (setq recentf-max-menu-items 500)
  ;;:diminish whitespace-mode
  )


(recentf-mode t)


;; save recent file list every 5 minutes
;; 
(run-at-time nil 
	     (* 5 60) 'recentf-save-list)

(add-hook 'after-init-hook 'recentf-mode)

(setq-default recentf-max-saved-items 1000 recentf-exclude '
				      ("/tmp/" "/ssh:"))

;; https://gist.github.com/masutaka/1325654/955277113028eb7b968453a5b7802b74b51b393d  
;; 
(defvar my-recentf-list-prev nil)    
;; 
(defun my-recentf-save-list 
    ()  
  ;;   "If recentf-list and previous recentf-list is equal,  
  ;; do nothing"  
  ;;   
  (unless 
      (equal recentf-list my-recentf-list-prev)  
    ;;     
    (recentf-save-list)  
    ;;     
    (setq my-recentf-list-prev recentf-list)))    
(defadvice write-region    
    (around recentf-no-message)    
  (ad-set-arg 4 'nomsg)    ad-do-it    
  (set-buffer-modified-p nil))    
(defadvice recentf-save-list    
    (around no-message activate)    "suppress the output from message
() and write-region
() to  minibuffer"    
(let 
    (
     (activated 
      (ad-is-active 'write-region)))      
  (ad-enable-advice 'write-region 'around 'recentf-no-message)      
  (ad-activate 'write-region)      
  (unwind-protect   
      (cl-flet 
	  (
	   (message 
	    (format-string &rest args)     
	    (eval `
	     (format ,format-string ,@args))))     ad-do-it)        
    (ad-disable-advice 'write-region 'around 'recentf-no-message)        
    (if activated     
	(ad-activate 'write-region)   
      (ad-deactivate 'write-region)))))        
(defadvice recentf-cleanup    
    (around no-message activate)    "suppress the output from message
() to minibuffer"    
(cl-flet 
    (
     (message 
      (format-string &rest args)      
      (eval `
       (format ,format-string ,@args))))      ad-do-it))    
(setq recentf-save-file 
      (expand-file-name ".recentf" user-emacs-directory))  
(setq recentf-max-saved-items 2000)  
(setq recentf-exclude '
      (".recentf"))  
(setq recentf-auto-cleanup 10) 
;; 
(run-with-idle-timer 30 t 'my-recentf-save-list)  

(provide 'init-recentf)
