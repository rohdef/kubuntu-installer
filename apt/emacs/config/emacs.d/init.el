(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-utils)
(require 'init-elpa)


(defun maybe-install-package(p)
       (unless (package-installed-p p)
	 (package-refresh-contents)
	 (package-install p)
	 ))

(maybe-install-package 'php-mode)

(require 'init-arduino)
(require 'init-auctex)
(require 'init-auto-complete)
(require 'init-php)
(require 'init-windows)

(when (file-exists-p custom-file)
  (load custom-file))
