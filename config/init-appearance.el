(setq custom-safe-themes t)

(use-package noctilux-theme
  :ensure t
  :config (load-theme 'noctilux))

(use-package helm-themes
  :ensure t)

(use-package smart-mode-line
  :ensure t
  :config (smart-mode-line-enable))

(provide 'init-appearance)
