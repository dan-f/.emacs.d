(use-package tuareg
  :ensure t)

(use-package lsp-ocaml
  :config
  (add-hook 'tuareg-mode-hook #'lsp-ocaml-enable))

(provide 'init-ocaml)
