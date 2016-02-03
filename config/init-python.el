(use-package python-mode
  :init
  (setq python-fill-docstring-style 'symmetric))

;; (use-package anaconda-mode
;;   :ensure t
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode))

;; (use-package company-anaconda
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends 'company-anaconda))

(provide 'init-python)
