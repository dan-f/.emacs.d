(use-package exec-path-from-shell
  :ensure t
  :init (when (memq window-system '(mac ns))
	  (exec-path-from-shell-initialize)))

(use-package projectile
  :ensure t
  :init (projectile-global-mode))

(use-package helm
  :ensure t
  :config (setq helm-split-window-in-side-p t
                helm-quick-update t)
  :bind ("C-c h" . helm-command-prefix)
  :init (progn
          (helm-mode 1)))

(use-package helm-projectile
  :ensure t
  :init (helm-projectile-on))

(use-package helm-themes
  :ensure t)

;; (use-package flx-ido
;;   :ensure t
;;   :init (progn
;;           (require 'flx-ido)
;;           (ido-mode 1)
;;           (ido-everywhere 1)
;;           (flx-ido-mode)
;;           (setq ido-enable-flex-matching t)
;;           (setq ido-use-faces nil)))

;; (use-package ido-ubiquitous
;;   :ensure t
;;   :init (ido-ubiquitous-mode 1))

;; (use-package smex
;;   :ensure t
;;   :config (global-set-key (kbd "M-x") 'smex))

(use-package magit
  :ensure t
  :bind ("C-c m" . magit-status)
  :init (setq magit-last-seen-setup-instructions "1.4.0")
  :config (progn
            (setq magit-auto-revert-mode nil)))

(use-package git-gutter
  :ensure t
  :init (global-git-gutter-mode +1))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :init (global-company-mode)
  :config (progn
            (setq company-idle-delay 0.1)))

(provide 'init-tools)
