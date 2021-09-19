;;; packages.el --- C# Layer configuration File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; variables

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

;; Enable Defaults
;;(cua-mode 1)
;;(cua-selection-mode 1)
;;(cua-rectangle-mark-mode 1)
;;(show-paren-mode t)
(menu-bar-mode t)
(tool-bar-mode 1)
;;(icon-mode 1)
;;(tab-bar-mode t)

(set-face-attribute 'default nil :height 140)
(setq inhibit-splash-screen t)
(setq blink-matching-paren t)
(setq suggest-key-bindings t)

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




