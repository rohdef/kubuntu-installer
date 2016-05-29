(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode) ("\\.cpp$" . c++-mode) ("\\.ino$" . c++-mode)) auto-mode-alist))

(provide 'init-arduino)