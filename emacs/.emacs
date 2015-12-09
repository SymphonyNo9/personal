;; emacs lisp

;; load other set
;;(require 'load-relative)
;;(load-relative ".emacs.d/rinari")
(add-to-list 'load-path "./.emacs.d/rinari")
(require 'rinari)

;; large kill-ring
(setq kill-ring-max 400)
(setq make-backup-files nil)
