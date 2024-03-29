
(when 
    (fboundp 'electric-pair-mode)  
  (add-hook 'after-init-hook 'electric-pair-mode))
(when 
    (eval-when-compile 
      (version< "24.4" emacs-version))  
  (add-hook 'after-init-hook 'electric-indent-mode))

(maybe-require-package 'list-unicode-display)

;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default blink-cursor-interval 0.4 bookmark-default-file 
				    (expand-file-name ".bookmarks.el" user-emacs-directory) 
				    buffers-menu-max-size 30 
				    case-fold-search t 
				    column-number-mode t 
				    delete-selection-mode t 
				    ediff-split-window-function 'split-window-horizontally 
				    ediff-window-setup-function 
				    'ediff-setup-windows-plain 
				    indent-tabs-mode nil make-backup-files nil mouse-yank-at-point t save-interprogram-paste-before-kill t scroll-preserve-screen-position 'always set-mark-command-repeat-pop t tooltip-delay 1.5 truncate-lines nil truncate-partial-width-windows nil)

(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t      auto-revert-verbose nil)

(add-hook 'after-init-hook 'transient-mark-mode)



(when 
    (maybe-require-package 'beacon)  
  (setq-default beacon-lighter "")  
  (setq-default beacon-size 5)  
  (add-hook 'after-init-hook 'beacon-mode))

;;; Newline behaviour

(global-set-key 
 (kbd "RET") 'newline-and-indent)
(defun newline-at-end-of-line 
    ()  "Move to end of line, enter a newline, and reindent."  
    (interactive)  
    (move-end-of-line 1)  
    (newline-and-indent))

(global-set-key 
 (kbd "S-<return>") 'newline-at-end-of-line)


;;
(with-eval-after-load 'subword
  ;;  
  (diminish 'subword-mode))


(unless 
    (fboundp 'display-line-numbers-mode)  
  (require-package 'nlinum))

(when 
    (require-package 'rainbow-delimiters)  
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


(when 
    (fboundp 'global-prettify-symbols-mode)  
  (add-hook 'after-init-hook 'global-prettify-symbols-mode))

;;
(require-package 'undo-tree)
;;
(add-hook 'after-init-hook 'global-undo-tree-mode)

;; After Load is not working
;;
(with-eval-after-load 'undo-tree
  ;;  
  (diminish 'undo-tree-mode))

(require-package 'browse-kill-ring)
(setq browse-kill-ring-separator "\f")
(global-set-key 
 (kbd "M-Y") 'browse-kill-ring)
(with-eval-after-load 'browse-kill-ring  
  (define-key browse-kill-ring-mode-map 
    (kbd "C-g") 'browse-kill-ring-quit)  
  (define-key browse-kill-ring-mode-map 
    (kbd "M-n") 'browse-kill-ring-forward)  
  (define-key browse-kill-ring-mode-map 
    (kbd "M-p") 'browse-kill-ring-previous))
(with-eval-after-load 'page-break-lines  
  (push 'browse-kill-ring-mode page-break-lines-modes))

;;----------------------------------------------------------------------------
;; Don't disable narrowing commands
;;----------------------------------------------------------------------------
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;;----------------------------------------------------------------------------
;; Expand region
;;----------------------------------------------------------------------------
(require-package 'expand-region)
(global-set-key 
 (kbd "C-=") 'er/expand-region)

;;----------------------------------------------------------------------------
;; Don't disable case-change functions
;;----------------------------------------------------------------------------
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;----------------------------------------------------------------------------
;; Rectangle selections, and overwrite text when the selection is active
;;----------------------------------------------------------------------------
(cua-selection-mode t)                  ; for rectangles, CUA is nice

;;----------------------------------------------------------------------------
;; Handy key bindings
;;----------------------------------------------------------------------------
(global-set-key 
 (kbd "C-.") 'set-mark-command)
(global-set-key 
 (kbd "C-x C-.") 'pop-global-mark)

(when 
    (maybe-require-package 'avy)  
  (global-set-key 
   (kbd "C-;") 'avy-goto-char-timer))

(require-package 'multiple-cursors)
;; multiple-cursors
(global-set-key 
 (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key 
 (kbd "C->") 'mc/mark-next-like-this)
(global-set-key 
 (kbd "C-+") 'mc/mark-next-like-this)
(global-set-key 
 (kbd "C-c C-<") 'mc/mark-all-like-this)
;; From active region to multiple cursors:
(global-set-key 
 (kbd "C-c m r") 'set-rectangular-region-anchor)
(global-set-key 
 (kbd "C-c m c") 'mc/edit-lines)
(global-set-key 
 (kbd "C-c m e") 'mc/edit-ends-of-lines)
(global-set-key 
 (kbd "C-c m a") 'mc/edit-beginnings-of-lines)

;; Train myself to use M-f and M-b instead
(global-unset-key [M-left])
(global-unset-key [M-right])


(defun kill-back-to-indentation 
    ()  "Kill from point back to the first non-whitespace character on the line."  
    (interactive)  
    (let 
	(
	 (prev-pos 
	  (point)))    
      (back-to-indentation)    
      (kill-region 
       (point) prev-pos)))

(global-set-key 
 (kbd "C-M-<backspace>") 'kill-back-to-indentation)

;;----------------------------------------------------------------------------
;; Page break lines
;;----------------------------------------------------------------------------
;;
(when 
    (maybe-require-package 'page-break-lines)
  ;;  
  (add-hook 'after-init-hook 'global-page-break-lines-mode)
  ;;  
  (with-eval-after-load 'page-break-lines
    ;;    
    (diminish 'page-break-lines-mode)))

;;----------------------------------------------------------------------------
;; Shift lines up and down with M-up and M-down. When paredit is enabled,
;; it will use those keybindings. For this reason, you might prefer to
;; use M-S-up and M-S-down, which will work even in lisp modes.
;;----------------------------------------------------------------------------
(require-package 'move-dup)
(global-set-key [M-up] 'md/move-lines-up)
(global-set-key [M-down] 'md/move-lines-down)
(global-set-key [M-S-up] 'md/move-lines-up)
(global-set-key [M-S-down] 'md/move-lines-down)

(global-set-key 
 (kbd "C-c d") 'md/duplicate-down)
(global-set-key 
 (kbd "C-c u") 'md/duplicate-up)

;;----------------------------------------------------------------------------
;; Fix backward-up-list to understand quotes, see http://bit.ly/h7mdIL
;;----------------------------------------------------------------------------
(defun backward-up-sexp 
    (arg)  "Jump up to the start of the ARG'th enclosing sexp."  
    (interactive "p")  
    (let 
	(
	 (ppss 
	  (syntax-ppss)))    
      (cond 
       (
	(elt ppss 3)           
	(goto-char 
	 (elt ppss 8))           
	(backward-up-sexp 
	 (1- arg)))          
       (
	(backward-up-list arg)))))

(global-set-key [remap backward-up-list] 'backward-up-sexp) ; C-M-u, C-M-up


(defun open-line-with-reindent 
    (n)  "A version of `open-line' which reindents the start and end positions.If there is a fill prefix and/or a `left-margin', insert themon the new line if the line would have been blank.With arg N, insert N newlines."  
    (interactive "*p")  
    (let* 
	(
	 (do-fill-prefix 
	  (and fill-prefix 
	       (bolp)))         
	 (do-left-margin 
	  (and 
	   (bolp) 
	   (> 
	    (current-left-margin) 0)))         
	 (loc 
	  (point-marker))         
	 ;; Don't expand an abbrev before point.         
	 (abbrev-mode nil))    
      (delete-horizontal-space t)    
      (newline n)    
      (indent-according-to-mode)    
      (when 
	  (eolp)      
	(delete-horizontal-space t))    
      (goto-char loc)    
      (while 
	  (> n 0)      
	(cond 
	 (
	  (bolp)             
	  (if do-left-margin 
	      (indent-to 
	       (current-left-margin)))             
	  (if do-fill-prefix 
	      (insert-and-inherit fill-prefix))))      
	(forward-line 1)      
	(setq n 
	      (1- n)))    
      (goto-char loc)    
      (end-of-line)    
      (indent-according-to-mode)))

(global-set-key 
 (kbd "C-o") 'open-line-with-reindent)

;;----------------------------------------------------------------------------
;; Random line sorting
;;----------------------------------------------------------------------------
(defun sort-lines-random 
    (beg end)  "Sort lines in region randomly."  
    (interactive "r")  
    (save-excursion    
     (save-restriction      
      (narrow-to-region beg end)      
      (goto-char 
       (point-min))      
      (let 
	  ;; To make `end-of-line' and etc. to ignore fields.          
	  (
	   (inhibit-field-text-motion t))        
	(sort-subr nil 'forward-line 'end-of-line nil nil                   
		   (lambda 
		     (s1 s2) 
		     (eq 
		      (random 2) 0)))))))


(require-package 'highlight-escape-sequences)
(add-hook 'after-init-hook 'hes-mode)

(require-package 'guide-key)
(setq guide-key/guide-key-sequence '
      ("C-x" "C-c" "C-x 4" "C-x 5" "C-c ;" "C-c ; f" "C-c ' f" "C-x n" "C-x C-r" "C-x r" "M-s" "C-h" "C-c C-a"))
(add-hook 'after-init-hook 'guide-key-mode)
;;
(with-eval-after-load 'guide-key
  ;;  
  (diminish 'guide-key-mode))

(provide 'init-editing-utils)
