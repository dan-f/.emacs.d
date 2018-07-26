(setq custom-safe-themes t)

(use-package seoul256-theme
  :ensure t
  :init (load-theme 'seoul256))

(set-frame-font "Fira Code 14")

(global-hl-line-mode)

(provide 'init-appearance)
