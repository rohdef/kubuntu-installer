(maybe-require-package 'auto-complete)

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'auto-complete-config)
(ac-config-default)

(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)

(setq ac-dwim t)

(provide 'init-auto-complete)
