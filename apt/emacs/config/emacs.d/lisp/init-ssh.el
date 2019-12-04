;;; Code:
(maybe-require-package 'ssh)

(require 'ssh)

(add-hook 'ssh-mode-hook
	  (lambda ()
	    (setq ssh-directory-tracking-mode t)
	    (shell-dirtrack-mode t)
	    (setq dirtrackp nil)))

(provide 'init-ssh)
