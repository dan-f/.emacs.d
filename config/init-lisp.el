(require 'init-eval)

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
  :ensure t
  :config
  (dan-f/eval-for-mode clojure
    (sexp . cider-eval-last-sexp)
    (defn . cider-eval-defun-at-point)
    (buff . cider-read-eval-buffer)
    (regn . cider-eval-region)))

(defun lisp-mode-hooks ()
  (eldoc-mode)
  (parinfer-mode))

(add-hook 'emacs-lisp-mode-hook 'lisp-mode-hooks)
(add-hook 'scheme-mode-hook 'lisp-mode-hooks)
(add-hook 'common-lisp-mode-hook 'lisp-mode-hooks)
(add-hook 'clojure-mode-hook 'lisp-mode-hooks)
(add-hook 'lisp-mode-hook #'parinfer-mode)

(provide 'init-lisp)
