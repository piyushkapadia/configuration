
;; Add file association with major mode
;; setup files ending in ".tab/view/per/proc/pks/pkb" to open in sql-mode
(add-to-list 'auto-mode-alist '
	     ("\\.tab\\'" . sql-mode))
(add-to-list 'auto-mode-alist '
	     ("\\.view\\'" . sql-mode))
(add-to-list 'auto-mode-alist '
	     ("\\.per\\'" . sql-mode))
(add-to-list 'auto-mode-alist '
	     ("\\.proc\\'" . sql-mode))
(add-to-list 'auto-mode-alist '
	     ("\\.pks\\'" . sql-mode))
(add-to-list 'auto-mode-alist '
	     ("\\.pkb\\'" . sql-mode))

(add-to-list 'auto-mode-alist '
	     ("\\.csv\\'" . csv-mode))
;; To associate file extension to a mode
;; http://ergoemacs.org/emacs/emacs_auto-activate_a_major-mode.html
;; setup files ending in “.js” to open in js2-mode
(add-to-list 'auto-mode-alist '
	     ("\\.js\\'" . js2-mode))
;; To remove any file name suffix associated with js-mode
;; 
(setq auto-mode-alist 
      (rassq-delete-all 'js-mode auto-mode-alist))
;;   http://ergoemacs.org/emacs/emacs_auto-activate_a_major-mode.html

(add-to-list 'auto-mode-alist '
	     ("\\.jade$" . jade-mode))

;;
(add-to-list 'auto-mode-alist '
	     (
	      (concat "\\."
		      ;;         
		      (regexp-opt
		       ;;          '
		       ("xml" "xsd" "sch" "rng" "xslt" "svg" "rss"
			;;            "gpx" "tcx" "plist"))
			;;         "\\'") . nxml-mode))

			(provide 'init-file-ext)
