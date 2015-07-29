(use-package web-mode
  :ensure t
  :config (progn
            (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
            (add-to-list 'auto-mode-alist '("\\.underscore\\'" . web-mode))
            (defun dan-f/web-mode-hook ()
              (turn-off-smartparens-mode)
              (if (equal (file-name-extension (buffer-file-name)) "underscore")
                  (web-mode-set-engine "underscore")))
            (add-hook 'web-mode-hook 'dan-f/web-mode-hook)))

(provide 'init-web)
