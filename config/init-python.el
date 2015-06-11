(use-package python-mode
  :config (setq python-fill-docstring-style 'symmetric))

(use-package anaconda-mode
  :ensure t)

(use-package company-anaconda
  :ensure t)

(provide 'init-python)
