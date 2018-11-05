(use-package tuareg
  :ensure t)

(use-package lsp-ocaml
  :ensure t
  :init
  (add-hook 'tuareg-mode-hook #'lsp-ocaml-enable))

(provide 'init-ocaml)
