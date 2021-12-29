
;;----------------------------------------------------------------------------
;; Shell Enhancements
;;----------------------------------------------------------------------------
;; 
;; Shell Enhancements

(set-variable 'shall-command-switch "-ic")

(setq explicit-shell-file-name "c:/cygwin64/bin/bash.exe")

(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(load-file "~/.emacs.d/private/custom-layer/cygwin-support.el")

;; Make prompt read only
(setq comint-prompt-read-only t)

;; Set Ansi Color for shell
;; https://www.emacswiki.org/emacs/AnsiColor
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)


;;
;; Let's use CYGWIN bash... 
;;
;; http://www.khngai.com/emacs/
;; https://www.emacswiki.org/emacs/Cygwin
;; https://stackoverflow.com/questions/2075504/how-to-best-integrate-emacs-and-cygwin
;; Launching cygwin version of emacs
;; XWin -multiwindow
;; export DISPLAY=:0.0
;; emacs&
;; In cygwin / dir, create a link to your C drive (or any other drive):
;; ln -s /cygdrive/c /c
(setenv "PATH" 
	(concat "c:/cygwin64/bin/;" 
		(getenv "PATH")))
(setq exec-path 
      (cons "c:/cygwin64/bin/" exec-path))

;; If windows environment is detected
(if (or (eq system-type 'windows-nt)
    (eq system-type 'cygwin))
  ;;
  ;;  Windows Command Prompt
  ;;
  (defun cmd ()
    (interactive)
    (let ((shell-file-name "cmd.exe"))
      (shell "*Windows Command*")))
  
  ;;
  ;;  Windows Command Prompt
  ;;
  (defun powershell ()
    (interactive)
    (let ((shell-file-name "powershell.exe"))
      (shell "*Power Shell*")))
  )

	  
	  
;; https://serverfault.com/questions/411307/cannot-set-terminal-process-group-during-su-to-another-user-as-login-shell
;; https://unix.stackexchange.com/questions/324986/bash-cannot-set-terminal-process-group-1-inappropriate-ioctl-for-device

(provide 'init-shell)
