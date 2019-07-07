;; https://github.com/emacs-tw/awesome-emacs#interface-enhancement
;; -*- lexical-binding: t -*-
;;----------------------------------------------------------------------------
;; Enable Debugger
;;----------------------------------------------------------------------------
(setq debug-on-error t)

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(add-to-list 'load-path 
	     (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* t) 
;; Enable with t if you prefer
(defconst *is-a-mac* 
  (eq system-type 'darwin))

(setq visible-bell 1)
(require 'cygwin-support)
(require 'cygwin-mount)
(require 'setup-cygwin)

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(require 'init-optimize)
(require 'init-package)
(require 'init-themes)
(require 'init-utils)
;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
;; Order of load is important
;; Load critical components
;;(require 'init-site-lisp) 


;; Machinery for installing required packages
(require 'init-path) 
;; Set up $PATH
(require 'init-system-defaults)
;; (require 'init-company)
;; (require 'init-css)
;; (require 'init-csv)
;; (require 'init-desktop)
;; (require 'init-dired)
;; ;;
;; (require 'init-docker)
;; (require 'init-flycheck)
;; (require 'init-folding)
;; ;;
;; (require 'init-fonts);
;; (require 'init-frame-hooks)
;; (require 'init-hippie-expand)
;; ;; Load language modes.
;; ;;
 (require 'init-javascript)
;; (require 'init-nxml);
;; (require 'init-python)
;; ;;
;; (require 'init-projectile)
;; ;;
;; (require 'init-sql)
;; ;; Utils
;; (require 'init-recentf)
;; (require 'init-shell)

;; (require 'init-mmm)
;; (require 'init-tramp)

;; (require 'init-vc)
;; (require 'init-windows)
;; (require 'init-yas)
;; ;; Load at the end
;; (require 'init-editing-utils)
;; (require 'init-file-ext)
;; (require 'init-keys)

;; https://stackoverflow.com/questions/21064916/auto-install-emacs-packages-with-melpa/21065066
;; https://stackoverflow.com/questions/28386299/how-to-make-the-package-column-of-emacs-elpa-list-packages-screen-wider
;; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/
;; http://pages.sachachua.com/.emacs.d/Sacha.html
;; https://caiorss.github.io/Emacs-Elisp-Programming/Org-mode-recipes.html
;; https://caiorss.github.io/Emacs-Elisp-Programming/Utilities.html
;; https://caiorss.github.io/Emacs-Elisp-Programming/Packages.html
;; https://caiorss.github.io/Emacs-Elisp-Programming/Keybindings.html
;; https://emacs.stackexchange.com/questions/2520/organize-the-content-of-emacs-d-init-el-and-emacs-d
;; http://sachachua.com/blog/2015/02/learn-take-notes-efficiently-org-mode/

;; Extra packages which don't require any configuration

;;
;;(when *is-a-mac*
;;  
;;(require-package 'osx-location))
;;
;;(unless 
;;  (eq system-type 'windows-nt)
;;  
;;(maybe-require-package 'daemons))

;;----------------------------------------------------------------------------
;; Locales 
;; (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file 
      (expand-file-name "custom.el" user-emacs-directory))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when 
    (file-exists-p custom-file)  
  (load custom-file))

(provide 'init-all)
