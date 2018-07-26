(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'"
  :hook (markdown-mode . auto-fill-mode))

(use-package yaml-mode
  :ensure t
  :mode "\\.yaml\\'")

(provide 'init-markdown)
