;; emacs lisp

;; load other set
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/develop/git/personal/emacs/")

;; large kill-ring
(setq kill-ring-max 400)
(setq make-backup-files nil)
(add-to-list 'auto-mode-alist
               '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
               '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))
