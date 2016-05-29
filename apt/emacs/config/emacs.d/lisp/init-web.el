;; PHP

(maybe-require-package 'ac-php)
(maybe-require-package 'php-mode)

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(require 'cl)
(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda ()
                       (auto-complete-mode t)
                                    (require 'ac-php)
                                                 (setq ac-sources  '(ac-source-php ) )
                                                              (yas-global-mode 1)
                                                                           (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
                                                                                        (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
                                                                                                     ))

;; JavaScript setup
(maybe-require-package 'json-mode)
(maybe-require-package 'js2-mode)
(maybe-require-package 'ac-js2)

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;; js2-mode
;; Change some defaults: customize them to override
(setq-default js2-basic-offset 2
              js2-bounce-indent-p t
	      js2-pretty-multiline-declarations t)
(after-load 'js2-mode
  ;; Disable js2 mode's syntax error highlighting by default...
  (setq-default js2-mode-show-parse-errors nil
                js2-mode-show-strict-warnings nil)
  ;; ... but enable it if flycheck can't handle javascript
  (autoload 'flycheck-get-checker-for-buffer "flycheck")
  (defun sanityinc/disable-js2-checks-if-flycheck-active ()
    (unless (flycheck-get-checker-for-buffer)
      (set (make-local-variable 'js2-mode-show-parse-errors) t)
      (set (make-local-variable 'js2-mode-show-strict-warnings) t)))
  (add-hook 'js2-mode-hook 'sanityinc/disable-js2-checks-if-flycheck-active)

  (add-hook 'js2-mode-hook (lambda () (setq mode-name "JS2")))

  (after-load 'js2-mode
    (js2-imenu-extras-setup)))

;; js-mode
(setq-default js-indent-level 2)

(provide 'init-web)
