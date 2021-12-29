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

;; (require 'epa-file)
;;    (epa-file-enable)

;;(setq load-path (cons (expand-file-name "D:/Dev/emacs/.emacs.d/private/custom-layer") load-path))
;;(load-file "D:/Dev/emacs/.emacs.d/private/custom-layer/cygwin-support.el")

;; https://www.emacswiki.org/emacs/MsWindowsNetworkPrinter
;; Printer Name "ET-2750 Series(Network)"
;; Port EP41FD39ET-2750 SERIES


;; if you map to the tcp/ip port, then once the printer
;; is installed, share it from the printer properties dialog, and
;; assign the SHARE name to 'MyPrinter' or similar
(defconst PRINTER_NAME "ET-2750Series"
  "printer to use within emacs")

;; now build the network printer name
(defconst MY_PRINTER  (concat "//" (getenv "COMPUTERNAME") "/" PRINTER_NAME)
  "Point to the printer emacs is to use. Defaults to host/`PRINTER_NAME'")

(defconst MY_PS_PRINTER MY_PRINTER
  "Point to the ps printer emacs is to use. Defaults to `MY_PRINTER'")

(setq printer-name MY_PRINTER)
;;(setq realgud:pdb-command-name "python -m pdb")

;; Enable Defaults
(cua-mode t)
(cua-selection-mode t)
(cua-rectangle-mark-mode t)
(show-paren-mode t)
;;(tab-bar-mode t)
;;(menu-bar-mode t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq next-line-add-newlines t)
(fset 'yes-or-no-p 'y-or-n-p)
(fset 'yes-or-no-p 'y-or-n-p)
(setq epg-gpg-program "gpg")
;; on Windows or Windows Subsystem Linux (WSL) the local gnutls-utils may not support TLS1.3
;; https://emacs.stackexchange.com/questions/54427/failed-to-update-packages-getting-error-gnutls-error-process-elpa-gnu-org-5
;; (setq gnutls-algorithm-priority "normal:-vers-t1s1.3")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.2")
(require 'server)
(unless (server-running-p) (server-start))
(add-to-list 'exec-path  "D:/Dev/Tools/bin/bin")
(add-to-list 'exec-path  "D:/Dev/Tools/msys64/mingw64/bin")
;; try hunspell at first
;; if hunspell does NOT exist, use aspell
;;(executable-find "hunspell")
(setq ispell-program-name "hunspell")
;; "en_US" is key to lookup in `ispell-local-dictionary-alist'.
;; Please note it will be passed as default value to hunspell CLI `-d` option
;; if you don't manually setup `-d` in `ispell-local-dictionary-alist`
(setq ispell-local-dictionary "en_US")
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
(setq ispell-hunspell-dict-paths-alist
      '(("en_US" "D:/Dev/Tools/dict/en_US.aff")))
(setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)
(flyspell-mode 1)

;;(setq load-path (cons (expand-file-name "D:/Dev/Home/.emacs.d/private/custom-layer") load-path))
;;(load-file "D:/Dev/Home/.emacs.d/private/custom-layer/cygwin-support.el")

(setq flycheck-python-pycompile-executable "D:/Dev/anaconda3/python.exe")
(custom-set-variables
 '(flycheck-python-flake8-executable "python")
 '(flycheck-python-pycompile-executable "python")
 '(flycheck-python-pylint-executable "python"))

;; https://www.reddit.com/r/emacs/comments/bjrd3f/how_can_i_unlock_folder_from_lspmode_blacklist/
;; M-x lsp-workspace-folders-add 
;;(setf (lsp-session-folders-blacklist (lsp-session)) nil)
;;(lsp--persist-session (lsp-session))

(message "Ending ~/Home/private/custom-layer/custom.el %s" (format-time-string "%Y-%m-%dTT"))

