(use-package js2-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))

(use-package coffee-mode
  :ensure t)

(provide 'init-js)
