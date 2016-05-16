(defun lispy-mode-hooks ()
  (eldoc-mode))

(add-hook 'emacs-lisp-mode-hook 'lispy-mode-hooks)

(provide 'init-lisp)
