(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :config
  (rust-enable-format-on-save))

(use-package lsp-rust
  :ensure t
  :config
  (with-eval-after-load 'lsp-mode
    (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls")))
  (add-hook 'rust-mode-hook #'lsp-rust-enable)
  (add-hook 'rust-mode-hook #'flycheck-mode))

(provide 'init-rust)
