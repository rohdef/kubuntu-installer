(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-utils)
(require 'init-elpa)

(setq rf_indent_level 2)
(setq rf_indent_by_tab nil)

(require 'init-global)

;(require 'init-arduino)
;(require 'init-auctex)
(require 'init-auto-complete)
(require 'init-feature)
(require 'init-flyspell)
(require 'init-git)
(require 'init-org-mode)
;(require 'init-php)
;(require 'init-ssh)
(require 'init-web)
(require 'init-windows)

(when (file-exists-p custom-file)
  (load custom-file))

(add-hook 'git-commit-mode-hook
          '(lambda () (auto-fill-mode 0))
          ;; append rather than prepend to git-commit-mode-hook, since the
          ;; thing that turns auto-fill-mode on in the first place is itself
          ;; another hook on git-commit-mode.
          t)
