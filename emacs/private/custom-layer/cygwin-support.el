(fset 'yes-or-no-p 'y-or-n-p)
(setq epg-gpg-program "gpg") (custom-set-variables
'(gnutls-algorithm-priority "normal:-vers-t1s1.3"))
;; https://www.emacswiki.org/emacs/NTEmacsWithCygwin#toc1
;; https://sourceware.org/legacy-ml/cygwin/2012-05/msg00114.html
;; bash: cannot set terminal process group (-1): Inappropriate ioctl for device
;; bash: no job control in this shell
;; https://stackoverflow.com/questions/11821378/what-does-bashno-job-control-in-this-shell-mean/11824420
;; https://cygwin.cygwin.narkive.com/DtP2JgPQ/bash-under-emacs-gives-cannot-set-terminal-process-group
;; https://sourceware.org/legacy-ml/cygwin/2012-02/msg00831.html
;; https://stackoverflow.com/questions/9471341/emacs-shell-command-outputting-cannot-set-terminal-process-group-and-no-job-c/9500684
;; https://emacs.stackexchange.com/questions/3447/cannot-set-terminal-process-group-error-when-running-bash-script
;; https://www.johndcook.com/blog/2016/11/30/setting-up-emacs-shell-on-a-mac/
;; https://stackoverflow.com/questions/6532998/how-to-run-multiple-shells-on-emacs
;; https://www.masteringemacs.org/article/running-shells-in-emacs-overview
;; https://develop.spacemacs.org/layers/+tools/shell/README.html
;; Set Cygwin
;; you must have mount.exe on path

(add-to-list 'exec-path "C:/cygwin64/bin")
(setq cygwin-root-directory "c:/cygwin64")
(setq explicit-shell-file-name "c:/cygwin64/bin/bash.exe")
;;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq shell-file-name "bash")
;; https://stackoverflow.com/questions/9670209/cygwin-bash-does-not-display-correctly-in-emacs-shell
;; Change prmompt
;; if [ "$EMACS" == "t" ]; then
;;    PS1='\u \w>'
;;fi
(set-variable 'shell-command-switch "-ic")
(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(require 'setup-cygwin)
(let* ((cygwin-root "c:/cygwin64") (cygwin-bin (concat cygwin-root "/bin"))) (when (and (eq 'windows-nt system-type)
(file-readable-p cygwin-root))
(setq exec-path (cons cygwin-bin exec-path))
(setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))
;; By default use the Windows HOME.
;; Otherwise, uncomment below to set a HOMO
;;	(setenv "HOME" (concat cygwin-root "/home/o367425"))
;; NT-emacs assumes a Windows shell. Change to bash. (setq shell-file-name "bash")
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)
;; This removes unsightly "M characters that would otherwise ;; appear in the output of java applications.
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))

