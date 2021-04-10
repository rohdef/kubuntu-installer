;;; Code:
;(maybe-require-package 'org-mode)

;; Enable org tempo module
(custom-set-variables
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus ol-info ol-irc ol-mhe ol-rmail org-tempo ol-w3m)))

;; Disable ident after headline
(custom-set-variables
 '(org-adapt-indentation nil))

;; Color highlighting
(custom-set-variables
 '(org-src-fontify-natively t))

(provide 'init-org-mode)
