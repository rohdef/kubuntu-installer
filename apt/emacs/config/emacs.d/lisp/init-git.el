;;; Code:
(maybe-require-package 'magit)

;(defun my-enable-smerge-maybe ()
;  (when (and buffer-file-name (vc-backend buffer-file-name))
;    (save-excursion
;      (goto-char (point-min))
;      (when (re-search-forward "^<<<<<<< " nil t)
;        (smerge-mode +1)))))

;(add-hook 'buffer-list-update-hook #'my-enable-smerge-maybe)

(setq smerge-command-prefix (kbd "C-c v"))

(provide 'init-git)
