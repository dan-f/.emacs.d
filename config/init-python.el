(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (setq python-fill-docstring-style 'symmetric))

(provide 'init-python)
