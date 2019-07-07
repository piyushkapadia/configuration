;;----------------------------------------------------------------------------
;; Make Org Mode Default mode for all new empty buffers.
;; Possible values org-mode, text-mode, emacs-lisp-mode, lisp-interaction-mode
;;----------------------------------------------------------------------------

(setq initial-major-mode 
      (quote org-mode)) 

;;----------------------------------------------------------------------------
;; Create New Empty buffer
;; https://stackoverflow.com/questions/26979052/how-to-create-a-new-unnamed-file-in-emacs/26979288
;; https://stackoverflow.com/questions/2357881/emacs-cant-get-buffer-offer-save-working/27446395#27446395
;; http://ergoemacs.org/emacs/emacs_new_empty_buffer.html
;; http://www.modernemacs.com/post/major-mode-part-1/
;; https://stackoverflow.com/questions/7539615/emacs-how-do-i-set-a-major-mode-stored-in-a-variable
;;----------------------------------------------------------------------------
(defun new-empty-buffer 
    ()  "Opens a new empty buffer."  
    (interactive)  
    (switch-to-buffer 
     (generate-new-buffer "untitled"))  
    (funcall initial-major-mode)  
    (put 'buffer-offer-save 'permanent-local t)  
    (setq buffer-offer-save t))


;;----------------------------------------------------------------------------
;; Make Org Mode Default mode for all new empty buffers.
;; Possible values org-mode, text-mode, emacs-lisp-mode, lisp-interaction-mode
;;----------------------------------------------------------------------------
;; (defadvice kill-buffer 
;;     (around kill-buffer-ask activate)
;;   "If `buffer-offer-save' is non-nil and a buffer is modified, prompt before closing."
  
;;   (if 
;;       (and buffer-offer-save 
;; 	   (buffer-modified-p)
	   
;; 	   (when 
;; 	       (yes-or-no-p "The document isn't saved. Quit? ")
;; 	     ad-do-it)
;; 	   ad-do-it)))


;; https://superuser.com/questions/669701/emacs-disable-some-minibuffer-messages
;; http://ergoemacs.org/emacs/emacs_new_empty_buffer.html
;; https://emacs.stackexchange.com/questions/16335/create-a-buffer-for-a-new-file-without-naming-the-file
;; Below Allows you to suppress messages from specific function
;; (defun suppress-messages 
;;     (old-fun &rest args)  
;;   (cl-flet 
;;       (
;;        (silence 
;; 	(&rest args1) 
;; 	(ignore)))    
;;     (advice-add 'message :around #'silence)
;;     (unwind-protect 
;;      (apply old-fun args)
;;      (advice-remove 'message #'silence))))

;; (advice-add 'recent-save-list :around #'suppress-messages)
;; (advice-add 'write-file :around #'suppress-messages)

(provide 'init-utils)
