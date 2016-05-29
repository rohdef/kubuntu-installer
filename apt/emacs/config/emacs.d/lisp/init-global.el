;;; Code:
;; Normal settings
(global-linum-mode 1)
(desktop-save-mode 0)
(setq display-time-24hr-format t)
(display-time-mode 1)
(setq-default show-trailing-whitespace nil)

;; Full screen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; No toolbars
(tool-bar-mode -1)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)

;; show matching brackets
(show-paren-mode 1)

;; autocomplete paired brackets
(electric-pair-mode 1)

;; Delete selection when typing
(delete-selection-mode 1)

(provide 'init-global)
