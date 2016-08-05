;; PHP

(maybe-require-package 'ac-php)
(maybe-require-package 'php-mode)

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(add-hook 'php-mode-hook 'my-php-mode-stuff)

(defun my-php-mode-stuff ()
  (local-set-key (kbd "<f1>") 'my-php-function-lookup)
  (local-set-key (kbd "C-h <f1>") 'my-php-symbol-lookup))

(defun my-php-symbol-lookup ()
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")

      (browse-url (concat "http://php.net/manual-lookup.php?pattern="
                          (symbol-name symbol))))))


(defun my-php-function-lookup ()
  (interactive)
  (let* ((function (symbol-name (or (symbol-at-point)
                                    (error "No function at point."))))
         (buf (url-retrieve-synchronously (concat "http://php.net/manual-lookup.php?pattern=" function))))
    (with-current-buffer buf
      (goto-char (point-min))
      (let (desc)
        (when (re-search-forward "<div class=\"methodsynopsis dc-description\">\\(\\(.\\|\n\\)*?\\)</div>" nil t)
          (setq desc
                (replace-regexp-in-string
                 " +" " "
                 (replace-regexp-in-string
                  "\n" ""
                  (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1)))))

          (when (re-search-forward "<p class=\"para rdfs-comment\">\\(\\(.\\|\n\\)*?\\)</p>" nil t)
            (setq desc
                  (concat desc "\n\n"
                          (replace-regexp-in-string
                           " +" " "
                           (replace-regexp-in-string
                            "\n" ""
                            (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1))))))))

        (if desc
            (message desc)
          (message "Could not extract function info. Press C-F1 to go the description."))))
    (kill-buffer buf)))

;(require 'cl)
;(require 'php-mode)
;(add-hook 'php-mode-hook
;          '(lambda ()
;	     (auto-complete-mode t)
;	     (require 'ac-php)
;	     (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
;	     (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
;	     ))

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
