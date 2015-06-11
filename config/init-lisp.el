(defun lispy-mode-hooks ()
  (smartparens-strict-mode)
  (eldoc-mode))

(add-hook 'emacs-lisp-mode-hook 'lispy-mode-hooks)

(provide 'init-lisp)
