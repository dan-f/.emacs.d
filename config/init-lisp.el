(defun lispy-mode-hooks ()
  (eldoc-mode)
  (use-package smartparens
    :ensure t
    :config (smartparens-strict-mode)))

(add-hook 'emacs-lisp-mode-hook 'lispy-mode-hooks)

(use-package cider
  :ensure t
  :config (add-hook 'clojure-mode-hook 'lispy-mode-hooks))

(provide 'init-lisp)
