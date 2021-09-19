;; Base init.el starts here

;;----------------------------------------------------------------------------
;; Setup Init Path and execute main file init-all
;;----------------------------------------------------------------------------


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/init")
(require 'init-all)

;; Base init.el ends here

