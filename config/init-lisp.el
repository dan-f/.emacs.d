(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
            pretty-parens  ; different paren styles for different modes.
            evil           ; If you use Evil.
            smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
            smart-yank))))   ; Yank behavior depend on mode.

(use-package cider
  :ensure t)

(defun lispy-mode-hooks ()
  (eldoc-mode)
  (parinfer-mode))

(add-hook 'emacs-lisp-mode-hook 'lispy-mode-hooks)
(add-hook 'scheme-mode-hook 'lispy-mode-hooks)
(add-hook 'common-lisp-mode-hook 'lispy-mode-hooks)
(add-hook 'clojure-mode-hook 'lispy-mode-hooks)
(add-hook 'lisp-mode-hook #'parinfer-mode)

(provide 'init-lisp)
