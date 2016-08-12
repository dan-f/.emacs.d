(setq custom-safe-themes t)

(use-package helm-themes
  :ensure t)

(use-package plan9-theme
  :ensure t
  :init (load-theme 'plan9))

(provide 'init-appearance)
