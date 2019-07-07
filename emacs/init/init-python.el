
(setq auto-mode-alist      
      (append '
       (
	("SConstruct\\'" . python-mode)                
	("SConscript\\'" . python-mode))              auto-mode-alist))

(require-package 'pip-requirements)

(when 
    (maybe-require-package 'anaconda-mode)  
  (with-eval-after-load 'python    
    (add-hook 'python-mode-hook 'anaconda-mode)    
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))  
  (when 
      (maybe-require-package 'company-anaconda)    
    (with-eval-after-load 'company      
      (add-hook 'python-mode-hook                
		(lambda 
		  () 
		  (sanityinc/local-push-company-backend 'company-anaconda))))))

;; Removed as obsolate package
;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Python Setup
;; http://elpy.readthedocs.io/en/latest/index.html
;; http://page.sourceforge.net/tricks.html
;; 
(load-theme 'material t) 
;; load material theme
(elpy-enable)
(defvar myPackages  '
  (better-defaults    elpy    flycheck    material-theme    py-autopep8)) 
;; add the autopep8 package
;; Setup Company Jedi Mode
;; https://github.com/syohex/emacs-company-jedi
(defun my/python-mode-hook 
    ()  
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; https://www.python.org/dev/peps/pep-0008/

;; Enable pdb
;; https://www.emacswiki.org/emacs/PdbNotes
;; https://realpython.com/blog/python/emacs-the-best-python-editor/
;; https://stackoverflow.com/questions/2324758/debugging-python-programs-in-emacs
;; https://stackoverflow.com/questions/9167614/python-mode-in-emacs-no-such-file-or-directory-pdb
;; http://page.sourceforge.net/tricks.html#Running_pdb_under_emacs
;; PDB command line
(defun user-python-debug-buffer 
    ()  "Run python debugger on current buffer."  
    (interactive)  
    (setq command 
	  (format "python -u -m pdb %s " 
		  (file-name-nondirectory buffer-file-name)))  
    (let 
	(
	 (command-with-args 
	  (read-string "Debug command: " command nil nil nil)))    
      (pdb command-with-args)))
;;pdb setup, note the python version
;;
(setq gud-pdb-command-name "python -m pdb")
;;
(setq pdb-path 'C:/Python27/Lib/pdb.py
      ;;       gud-pdb-command-name 
      (symbol-name pdb-path))
(defadvice pdb 
    (before gud-query-cmdline activate)  "Provide a better default command line when called interactively."  
    (interactive   
     (list 
      (gud-query-cmdline pdb-path        
			 (file-name-nondirectory buffer-file-name)))))

(provide 'init-python)
