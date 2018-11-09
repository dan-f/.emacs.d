(setq custom-safe-themes t)

(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-city-lights))

(use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))

(set-frame-font "Fira Code 14")

(global-hl-line-mode)

(provide 'init-appearance)
