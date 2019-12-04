;;; Code:
(maybe-require-package 'feature-mode)

(dolist (hook '(org-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(provide 'init-feature)
