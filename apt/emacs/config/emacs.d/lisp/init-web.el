;; JavaScript setup
(maybe-require-package 'json-mode)
(maybe-require-package 'js2-mode)
(maybe-require-package 'ac-js2)

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;; js2-mode
;; Change some defaults: customize them to override
(setq-default js2-basic-offset rf_indent_level
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

  (after-load 'js2-mode
    (js2-imenu-extras-setup)))

;; js-mode
(setq-default js-indent-level rf_indent_level)

(provide 'init-web)
