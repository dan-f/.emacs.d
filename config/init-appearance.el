(setq custom-safe-themes t)

(use-package flatui-theme
  :ensure t
  :init (load-theme 'flatui))

(set-frame-font "Fira Code 14")

(hl-line-mode)

(provide 'init-appearance)
