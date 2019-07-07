

;;(require 'fullframe)
;;
;;(fullframe list-packages quit-window)

;;

(require 'cl-lib)

(set-face-attribute 'default nil :height 140)

					; To set to home 
;;(getenv "HOME")

;; Default Directory
(setq default-directory "~/")

;;net view \\127.0.0.1

(setq printer-name "//127.0.0.1/ET-2750Series")

;;https://stackoverflow.com/questions/569758/how-do-i-print-from-emacs-on-win32

;; https://www.emacswiki.org/emacs/MsWindowsNetworkPrinter



;; Change Directory to
;;(cd "C:/Users/Name/Desktop")
;;(message "%s" default-directory)


;; (defun sanityinc/set-tabulated-list-column-width 
;;     (col-name width)  "Set any column with name COL-NAME to the given WIDTH."  
;;     (when 
;; 	(> width 
;; 	   (length col-name))    
;;       (cl-loop for column across tabulated-list-format             when 
;; 	       (string= col-name 
;; 			(car column))             do 
;; 			(setf 
;; 			 (elt column 1) width))))

;; (defun sanityinc/maybe-widen-package-menu-columns 
;;     ()  "Widen some columns of the package menu table to avoid truncation."  
;;     (when 
;; 	(boundp 'tabulated-list-format)    
;;       (sanityinc/set-tabulated-list-column-width "Version" 13)    
;;       (let 
;; 	  (
;; 	   (longest-archive-name 
;; 	    (apply 'max 
;; 		   (mapcar 'length 
;; 			   (mapcar 'car package-archives)))))      
;; 	(sanityinc/set-tabulated-list-column-width "Archive" longest-archive-name))))

;; (add-hook 'package-menu-mode-hook 'sanityinc/maybe-widen-package-menu-columns)


;; (setq url-proxy-services '
;;       (
;;        ("no_proxy" . "^\\
;; (localhost\\|10.*\\)") 
;; ("http" . "proxy.host.fqdn:port") 
;; ("https" . "proxy.host.fqdn:port")))


;; ;; Call 
;; ;; •benchmark-init/show-durations-tabulated  
;; ;; •benchmark-init/show-durations-tree  
;; ;; setq is the same as set but quotes automatically the first argument
;; ;; t is for `true’ 
;; (and nil is for `false’)
;; ;; Hide 
;; (setq inhibit-splash-screen t)
;; (setq inhibit-startup-message t) 
;; ;; hide the startup message  
;; (setq inhibit-startup-message t)
;; (setq save-abbrevs nil)
;; (setq show-trailing-whitespace t)
;; (setq suggest-key-bindings t)


;; CUA Mode turned on.
(cua-mode 1)


;; Show matching parens
(add-hook 'after-init-hook 'show-paren-mode)
;; M-x describe-variable RETURN" and then type "load-path"
;; Navigating
;; Show Paren Mode
;; Remove small delay in showing matching parenthesis
(setq show-paren-delay 0)	; how long to wait?
;; Make Emacs highlight paired parentheses, turn paren-mode on
(show-paren-mode t)
(setq show-paren-style 'parenthesis) ; alternatives are 'expression 'parenthesis' and 'mixed'
(setq blink-matching-paren t)
(set-face-background 'show-paren-match-face "#aaaaaa")
(set-face-attribute 'show-paren-match-face nil
		    :weight 'bold :underline nil :overline nil :slant 'normal)
(set-face-foreground 'show-paren-mismatch-face "red")
(set-face-attribute 'show-paren-mismatch-face nil
		    :weight 'bold :underline t :overline nil :slant 'normal)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %." (interactive "p")
  (cond ((looking-at "\\s(") (forward-list 1) (backward-char 1)) ((looking-at "\\s)") (forward-char 1) (backward-list 1)) (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)

;; https://www.gnu.org/software/emacs/manual/html mono/efaq.html#Matching-parentheses
;; https://www.gnu.org/savannah-checkouts/gnu/emacs/manual/html node/emacs/Moving-by-Parens.html
;; C-M-f, or M-x forward-sexp, goes forward to the closing brace,
;; or to the opening brace in the next set of braces.
;; C-M-b, or M-x backward-sexp, goes backward to the opening brace,
;; or to the closing brace in the next set of braces. These
;; parenthetical groupings
;; C-M-n Move forward over a parenthetical group (forward-list).
;; C-M-p Move backward over a parenthetical group (backward-list).
;; C-M-u Move up in parenthesis structure (backward-up-list).
;; C-M-d Move down in parenthesis structure (down-list).
;; The list commands C-M-n (forward-list) and C-M-p (backward-list) move forward or
;; backward over one (or n).
;; C-M-u moves backward up past one unmatched opening delimiter. A positive argument serves as a repeat count; a negative argument reverses the direction of motion,
;; so tht the command moves forward and up one or more levels.
;; C-M-d (down-list) moves forward .
;; In Emacs 25+ to suppress all mini buffer messages ; ; (let ( (inhibit-message t))
;;	(message "Listen to me, you!"))
;; Load configs for specific features and modes
;;(require 'cl)
					; ; (require 'buffer-move)
;; setq is the same as set but quotes automatically the first argument
;; t is for true' (and nil is for -false')
;; Hide
(setq inhibit-startup-message t) ;; hide the startup message
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
;; CUA Mode turned on. (cua-mode 1)
;; auto-refresh all buffers when files have changed on disk
(global-auto-revert-mode t)
;; Theme
;;(load-theme 'material t)

;; load material theme ;;(load-theme 'dracula t) ;; load dracula theme ;;(add-to-list 'custom-theme-load-path "-/.emacs.d/themes")
;;(load-theme 'darkplus t) ;; load material theme
;; set default file encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
;; regex re-builder (require 're-builder)
(setq reb-re-syntax 'string)
;;(require 'regex-tool) ;;(require 'dotenv-mode)
;; Set value of emacs home to use elsewhere in this file
;;(defvar emacs home (getenv "EMACS HOME"))
;; Below does not work on Windows Shortcut
;;(setq default-directory "h:/")
;; Force change to specific directory
;;(cd "h:/")
;; Flycheck
;; Flycheck is a modern on-the-fly syntax checking extension ;; http://www.flycheck.org/en/latest/
					;(use-package flycheck :ensure t
					;  :init
					;  (global-flycheck-mode))
;; Helm
;; Helm is an Emacs framework for incremental completions and narrowing selections ;; https://emacs-helm.github.io/helm/
;; https://github.com/emacs-helm/helm/wiki
					;(use-package helm
					;:ensure t
					;:init
					;(global-flycheck-mode))
					;(global-set-key (kbd "M-x") 'helm-M-x)
;; C-h m pops an org buffer with detailed documentation about current command ;; (helm-mode 1)
					;(require 'helm-config)
					; ;
					;(require 'ansi-color)
					;(require 'whitespace)
					;(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Change Frame Title
;; The file name and the major mode as window name (my conf)
;; (setq-default frame-title-format '("%f [96m]"))
;; Make emacs' window title show path of current file
(setq-default frame-title-format
	      '(:eval
		(format "%s@%s: %s %s"
			(or (file-remote-p default-directory 'user)
			    user-real-login-name)
			(or (file-remote-p default-directory 'host)
			    system-name)
			(buffer-name)
			(cond
			 (buffer-file-truename
			  (concat "(" buffer-file-truename ")"))
			 (dired-directory
			  (concat "{" dired-directory "}"))
			 (t  "[no file]")))))
;; C-n add new lines at the end of buffer
(setq next-line-add-newlines t)
;; open emacs full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Add cygwin to path to make unix tools available
;;(setenv "PATH" (concat "c:/cygwin64/bin/;" (getenv "PATH")))
;; http://ergoemacs.org/emacs/emacs set default browser.html ;; Does not work on 25.x & Windows NT/7
;; https://www.emacswiki.org/emacs/BrowseUrl
(defun browse-url-goglech (url &optional new-window)
  (shell-command
   (concat "start chrome " url)))
(setq browse-url-browser-function 'browse-url-goglech)
;; Default font size : The value is in 1/10pt, so 100 will give you lOpt, etc. (set-face-attribute 'default nil :height 140)

(defun new-empty-buffer-kill-buffer-query-function ()
  (when (and (buffer-modified-p)
	     (yes-or-no--p (format "Buffer %s is modified; save? "
				   (buffer-name))))
    (save-buffer))
  ;; don't abort kill-buffer:
  t)
;; Create New Empty buffer
(defun new-empty-buffer ()
  "Opens a new empty buffer, untitled or untitled<2>, untitled<3>, etc."
  ( interactive)
  (switch-to-buffer (generate-new-buffer "untitled"))
  (org-mode)
  (put 'buffer-offer-save 'permanent-local t)
  (setq buffer-offer-save t)
  ;; protect against kill-buffer:
  (add-hook 'kill-buffer-query-functions
	    'new-empty-buffer-kill-buffer-query-function
	    nil
	    t))
(global-set-key (kbd "C-c n") #'new-empty-buffer)

(when (featurep 'menu-bar)
  (setq menu-bar-buffers-menu-command-entries
	(append menu-bar-buffers-menu-command-entries
		(list (list 'new-empty-buffer
			    'menu-item
			    "Select New Buffer"
			    'new-empty-buffer
			    :help "Create a new buffer and select it in the current window")))))
;; Suppress Org Mode markers
(setq org-hide-emphasis-markers t)
;; (setq initial-major-mode (quote org-mode)) ;; examples text-mode, emacs-lisp-mode, lisp-interaction-mode
;; (defadvice kill-buffer (around kill-buffer-ask activate)
;; "If -buffer-offer-save' is non-nil and a buffer is modified, prompt before closing."
;;(if (and buffer-offer-save (buffer-modified-p)
;;	 (when (yes-or-no-p "The document isn't saved. Quit? ")
;;	   ad-do-it)
;;	 ad-do-it)))


;; regex re-builder
(require 're-builder)
(setq reb-re-syntax 'string)

;;(require 'regex-tool)
;;(require 'dotenv-mode)
;;
;;
;;
;;
;;
;;
;;
;;
;;
;;
;;
;;
;; IDO Mode Load
;;
;;
;;(require 'ido)
;;
;;(require 'ido-ubiquitous)
;;
;;(require 'ido-hacks)
;;
;;(require 'flx-ido)
;;
;;(require 'ido-everywhere)
;;
;;(require 'ido-vertical-mode)
;;
;; Enable IDO
;;
;;
;;(ido-mode 1)
;;
;;(ido-ubiquitous 1)
;;
;;(ido-hacks-mode 1)
;;
;;(flx-ido-mode 1)
;;
;;(ido-everywhere 1)
;;
;;(ido-vertical-mode 1)
;;
;; IDO mode specific settings
;;
;;
;;(setq ido-enable-flex-matching t
;;      ido-use-filename-at-point 'guess
;;      ido-vertical-define-keys 'C-n-C-p-up-down-left-right))
;; 
					;    (setq ido-use-virtual-buffers t) ; ; ;

;;
;;
;;
;;
;;
;;
;;
;;
;;
;;
;;
;;
;; HELM Mode Load
;;
;; https://github.com/emacs-helm/helm/wiki
;; https://sam217pa.github.io/2016/09/13/from-helm-to-ivy/
;; https://emacs.stackexchange.com/questions/2867/how-should-i-change-my-workflow-when-moving-from-ido-to-helm
;; https://tuhdo.github.io/helm-intro.html
;;
;;       (require 'helm)
;;       (require 'helm-config)
;;       ;; Extended config
;;       ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;;       ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;;       ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;;       (global-set-key 
;;        (kbd "C-c h") 'helm-command-prefix)
;;       (global-unset-key 
;;        (kbd "C-x c"))
;; 
;;       (define-key helm-map 
;; 	(kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;;       (define-key helm-map 
;; 	(kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
;;       (define-key helm-map 
;; 	(kbd "C-z")  'helm-select-action) ; list actions using C-z
;; 
;;       (when 
;; 	  (executable-find "curl")  
;; 	(setq helm-google-suggest-use-curl-p t))
;; 
;;       (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;;      helm-move-to-line-cycle-in-source     t; ; move to end or beginning of source when reaching top or bottom of source.
;;       helm-ff-search-library-in-sexp        t 
;; search for library in `require' and `declare-function' sexp.      helm-scroll-amount                    8 
;;  scroll 8 lines other window using M-<next>/M-<prior>      helm-ff-file-name-history-use-recentf t      helm-echo-input-in-header-line t)
;; 
;; 	    (defun spacemacs//helm-hide-minibuffer-maybe 
;; 		()  "Hide minibuffer in Helm session if we use the header line as input field."  
;; 		(when 
;; 		    (with-helm-buffer helm-echo-input-in-header-line)    
;; 		  (let 
;; 		      (
;; 		       (ov 
;; 			(make-overlay 
;; 			 (point-min) 
;; 			 (point-max) nil nil t)))      
;; 		    (overlay-put ov 'window 
;; 				 (selected-window))      
;; 		    (overlay-put ov 'face                   
;; 				 (let 
;; 				     (
;; 				      (bg-color 
;; 				       (face-background 'default nil)))                     `
;; 				   (:background ,bg-color :foreground ,bg-color)))      
;; 		    (setq-local cursor-type nil))))
;; 
;; 	    (add-hook 'helm-minibuffer-set-up-hook          'spacemacs//helm-hide-minibuffer-maybe)
;; 
;; 	    (setq helm-autoresize-max-height 0)
;; 	    (setq helm-autoresize-min-height 20)
;; 	    (helm-autoresize-mode 1)
;; 
;; 	    (helm-mode 1)
;; 
;; 	    ;; Set value of emacs_home to use elsewhere in this file
;; 	    (defvar emacs_home 
;; 	      (getenv "EMACS_HOME"))
;; 	    ;; Below does not work on Windows Shortcut
;; 	    (setq default-directory "h:/")
;; 	    ;; Force change to specific directory
;; 	    (cd "h:/")
;; 
;; 	    ;; Show file details
;; 	    ;; https://emacs.stackexchange.com/questions/22671/can-i-view-within-emacs-the-properties-of-a-file-which-i-already-opened
;; 	    (defun file-info 
;; 		()  
;; 	      (interactive)  
;; 	      (let 
;; 		  (
;; 		   (dired-listing-switches "-alh"))    
;; 		(dired-other-window buffer-file-name)))
;; 
(global-set-key 
 (kbd "C-c d") 'file-info)
;; 

;; 	    ;;----------------------------------------------------------------------------  
;; 	    ;; Show matching parens  
;; 	    ;;----------------------------------------------------------------------------  
(add-hook 'after-init-hook 'show-paren-mode)
;; 	    ;; M-x describe-variable RETURN” and then type “load-path”
;; 	    ;; Navigating
;; 	    ;; https://www.emacswiki.org/emacs/NavigatingParentheses
;; 	    ;; Show Paren Mode
;; 	    ;; https://www.emacswiki.org/emacs/ShowParenMode
;; 	    ;; http://emacs-fu.blogspot.com/2009/01/balancing-your-parentheses.html
;; 	    ;; Remove small delay in showing matching parenthesis
(setq show-paren-delay 0)           ; how long to wait?
;; 	    ;; Make Emacs highlight paired parentheses, turn paren-mode on
(show-paren-mode t)                
(setq show-paren-style 'parenthesis) ; alternatives are 'expression 'parenthesis' and 'mixed'
(setq blink-matching-paren t)
;; 
(set-face-background 'show-paren-match-face "#aaaaaa")
(set-face-attribute 'show-paren-match-face nil       :weight 'bold :underline nil :overline nil :slant 'normal)
;; 
(set-face-foreground 'show-paren-mismatch-face "red") 
(set-face-attribute 'show-paren-mismatch-face nil                     :weight 'bold :underline t :overline nil :slant 'normal)
;; 
;; 	    ;; In Emacs 25+ to suppress all mini buffer messages
;; 	    ;;
;; 	    (let 
;; 		(
;; 		 (inhibit-message t))
;; 	      ;;  
;; 	      (message "Listen to me, you!"))
;; 
;; 	    ;;----------------------------------------------------------------------------
;; 	    ;; Load configs for specific features and modes
;; 	    ;;----------------------------------------------------------------------------
;; 
;; 
;; 	    (require 'cl)
;; 	    (require 'buffer-move)
;; 	    (require 'ansi-color)
;; 
;; 	    (require 'whitespace)
;; 
;; 	    ;; PDF Support
;; 	    ;; https://emacs.stackexchange.com/questions/27293/your-emacs-does-not-come-with-xwidget-support-windows-10
;; 	    ;; https://tuhdo.github.io/setup-emacs-windows.html
;; 	    ;; ORG Mode
;; 	    ;; https://orgmode.org/features.html
;; 	    ;; https://orgmode.org/
;; 	    ;; http://sachachua.com/blog/2015/02/learn-take-notes-efficiently-org-mode/
;; 	    ;; https://orgmode.org/#docs
;; 
;; 	    ;;
;; 	    (require 'linum)
;; 	    ;;
;; 	    (require 'smooth-scrolling)
;; 	    (require 'whitespace)
;; 	    ;;
;; 	    (require 'dired-x)
;; 	    (require 'compile)
;; 	    ;;
;; 	    (ido-mode t)
;; 	    (normal-erase-is-backspace-mode 1)
;; 	    (put 'downcase-region 'disabled nil)
;; 	    (put 'upcase-region 'disabled nil)     ;
;; 	    (setq column-number-mode t)
;; 	    (setq vc-follow-symlinks t)
;; 
;; 	    ;; Naviation of brackets
;; 	    ;; https://www.emacswiki.org/emacs/NavigatingParentheses
;; 
;; 	    ;; Emacs Rocks,
;; 	    ;; http://emacsrocks.com/
;; 	    ;; Graphene
;; 	    ;; https://github.com/rdallasgray/graphene
;; 
;; 	    (add-hook 'text-mode-hook 
;; 		      (lambda
;; 			() 
;; 			(flyspell-mode 1)))
;; 
;; 	    ;; C-n add new lines at the end of buffer
;; 	    (setq next-line-add-newlines t)
;; 	    ;; open emacs full screen
;; 	    (add-to-list 'default-frame-alist '
;; 			 (fullscreen . maximized))
;; 
;; 	    ;; set specific browser to open links
;; 	    ;;
;; 	    (setq browse-url-browser-function 'browse-url-firefox)
;; 	    ;;
;; 	    (setq browse-url-browser-function 'browse-url-chromium) ; google's browser
;; 	    ;;
;; 	    (setq browse-url-browser-function 'eww-browse-url) ; emacs browser
;; 
;; 	    ;; use browser depending on url
;; 	    ;;
;; 	    (setq
;; 	     ;; browse-url-browser-function
;; 	     ;; '
;; 	     (
;; 	      ;;  
;; 	      ("wikipedia\\.org" . browse-url-firefox)
;; 	      ;;  
;; 	      ("github" . browse-url-chromium)
;; 	      ;;  
;; 	      ("thefreedictionary\\.com" . eww-browse-url)
;; 	      ;;  
;; 	      ("." . browse-url-default-browser)
;; 	      ;;  ))
;; 
;; 	      ;; Run Emacs as server/daemon
;; 	      ;; https://www.emacswiki.org/emacs/EmacsAsDaemon
;; 	      (ido-mode -1)

(provide 'init-system-defaults)
;; 	    ;;
