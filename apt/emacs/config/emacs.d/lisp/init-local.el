;;; package -- Summery
;;; Commentary:

;;; Code:
;; Normal settings
(global-linum-mode 1)
(desktop-save-mode 0)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Spark Core
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode) ("\\.cpp$" . c++-mode) ("\\.ino$" . c++-mode)) auto-mode-alist))

(provide 'init-local)
;;; init-local.el ends here