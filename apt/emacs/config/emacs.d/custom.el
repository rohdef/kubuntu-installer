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
