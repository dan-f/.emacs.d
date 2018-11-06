(setq custom-safe-themes t)

(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-dracula))

(use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))

(set-frame-font "Fira Code")

(global-hl-line-mode)

(provide 'init-appearance)
