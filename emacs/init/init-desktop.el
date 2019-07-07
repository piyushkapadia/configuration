
;; Enable Desktop mode to reload same files on restart
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html
;; https://www.emacswiki.org/emacs/Desktop
;; https://www.emacswiki.org/emacs/EmacsSession
;; save a list of open files in ~/.emacs.d/.emacs.desktop
;; use only one desktop

(require 'desktop)

(setq desktop-path '
      ("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")
(setq desktop-path 
      (list user-emacs-directory)      desktop-auto-save-timeout 600)  
(desktop-save-mode 1)
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)

;; Save Minibuffer history
(savehist-mode 1)
;; Persists specific variables across-sessions
(setq savehist-additional-variables '
      (kill-ring search-ring regexp-search-ring))
;; Customize savehist-file to pick location where all stuff is saved.
(setq savehist-file "~/.emacs.d/savehist")

;; Specifying Files Not to be Opened
(setq desktop-buffers-not-to-save       
      (concat "\\
("               "^nn\\.a[0-9]+\\|\\.log\\|
 (ftp)\\|^tags\\|^TAGS"               "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"         "\\)$"))  
(add-to-list 'desktop-modes-not-to-save 'dired-mode)  
(add-to-list 'desktop-modes-not-to-save 'Info-mode)  
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)  
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;;----------------------------------------------------------------------------
;; Restore histories and registers after saving
;;----------------------------------------------------------------------------
;;
(setq-default history-length 1000)
;;
(add-hook 'after-init-hook 'savehist-mode)
;; https://www.emacswiki.org/emacs/EmacsSession
;;
(require-package 'session)

;;
(setq session-save-file 
      (expand-file-name ".session" user-emacs-directory))
;;
(setq session-name-disable-regexp "\\
(?:\\`'/tmp\\|\\.git/[A-Z_]+\\'\\)")
;;
(setq session-save-file-coding-system 'utf-8)

;;
(add-hook 'after-init-hook 'session-initialize)

;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
;;
(setq desktop-globals-to-save
      ;;      
      (append '
       (
	(comint-input-ring        . 50)
	;;                
	(compile-history          . 30)
	;;                desktop-missing-file-warning
	;;                
	(dired-regexp-history     . 20)
	;;                
	(extended-command-history . 30)
	;;                
	(face-name-history        . 20)
	;;                
	(file-name-history        . 100)
	;;                
	(grep-find-history        . 30)
	;;                
	(grep-history             . 30)
	;;                
	(ido-buffer-history       . 100)
	;;                
	(ido-last-directory-list  . 100)
	;;                
	(ido-work-directory-list  . 100)
	;;                
	(ido-work-file-list       . 100)
	;;                
	(ivy-history              . 100)
	;;                
	(magit-read-rev-history   . 50)
	;;                
	(minibuffer-history       . 50)
	;;                
	(org-clock-history        . 50)
	;;                
	(org-refile-history       . 50)
	;;                
	(org-tags-history         . 50)
	;;                
	(query-replace-history    . 60)
	;;                
	(read-expression-history  . 60)
	;;                
	(regexp-history           . 60)
	;;                
	(regexp-search-ring       . 20)
	;;                register-alist
	;;                
	(search-ring              . 20)
	;;                
	(shell-command-history    . 50)
	;;                tags-file-name
	;;                tags-table-list)))

	(provide 'init-desktop)
