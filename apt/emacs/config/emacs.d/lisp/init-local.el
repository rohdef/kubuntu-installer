;;; package -- Summery
;;; Commentary:

;;; Code:
;; Normal settings
(global-linum-mode 1)
(desktop-save-mode 0)
(setq display-time-24hr-format t)
(display-time-mode 1)
(setq-default show-trailing-whitespace nil)

;; Full screen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; AucTex
(load "auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; Spark Core
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode) ("\\.cpp$" . c++-mode) ("\\.ino$" . c++-mode)) auto-mode-alist))

;; Coq
(setq proof-three-window-mode-policy 'hybrid)

(provide 'init-local)
;;; init-local.el ends here
