
(require 'tramp)
(set-default 'tramp-auto-save-directory "c:/Users/UID/AppData/Local/Temp")
(set-default 'tramp-default-method "plink")

;; 
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\
(\[[0-9;]*[a-zA-Z] *\\)*")
    ;; 
    (eval-after-load 'tramp '
      (setenv "SHELL" "/bin/bash"))

    (setq tramp-default-method "plink")

    (defun host1 
	()  
      (interactive)  
      (dired "/plink:uid@hostname.fqdn:/home/uid"))

    (defun host2 
	()  
      (interactive)  
      (dired "/plink:uid@hostname.fqdn:/home/uid"))

    (provide 'init-tramp)
