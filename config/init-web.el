(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" "\\.underscore\\'")
  :init
  (defun dan-f/web-mode-hook ()
    (turn-off-smartparens-mode)
    (if (equal (file-name-extension (buffer-file-name)) "underscore")
        (web-mode-set-engine "underscore")))
  (add-hook 'web-mode-hook 'dan-f/web-mode-hook))

(use-package sass-mode
  :ensure t
  :mode "\\.scss\\'")

(provide 'init-web)
