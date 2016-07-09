(use-package ttl-mode
  :ensure t)

(use-package sparql-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.sparql$" . sparql-mode)))

(provide 'init-linkeddata)
