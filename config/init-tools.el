(use-package exec-path-from-shell
  :ensure t
  :init (when (memq window-system '(mac ns))
	  (exec-path-from-shell-initialize)))

(use-package projectile
  :ensure t
  :init (projectile-global-mode))

(use-package helm
  :ensure t
  :config (progn
            (require 'helm-config)
            (setq helm-split-window-in-side-p t
                  helm-quick-update t))
  :bind ("C-c h" . helm-command-prefix)
  :bind ("M-x" . helm-M-x)
  :bind ("C-x C-f" . helm-find-files)
  :init (progn
          (helm-mode 1)
          (helm-adaptive-mode 1)
          (helm-push-mark-mode 1)))

(use-package helm-projectile
  :ensure t
  :init (helm-projectile-on))

(use-package helm-themes
  :ensure t)

;; (use-package flx-ido
;;   :ensure t
;;   :init
;;   (require 'flx-ido)
;;   (ido-mode 1)
;;   (ido-everywhere 1)
;;   (flx-ido-mode)
;;   (setq ido-enable-flex-matching t)
;;   (setq ido-use-faces nil)
;;   (setq flx-ido-threshold 500)
;;   (setq ido-auto-merge-work-directories-length -1)) ; Don't show me options in other directories

;; (use-package ido-ubiquitous
;;   :ensure t
;;   :init (ido-ubiquitous-mode 1))

;; (use-package smex
;;   :ensure t
;;   :config (global-set-key (kbd "M-x") 'smex))

(use-package magit
  :ensure t
  :bind ("C-c m" . magit-status)
  :bind ("<f5>" . magit-status)
  :init (setq magit-last-seen-setup-instructions "1.4.0")
  :config
  (setq magit-push-always-verify nil)
  (setq magit-completing-read-function 'magit-ido-completing-read))

(use-package git-gutter
  :ensure t
  :init (global-git-gutter-mode +1))

;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode))

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-idle-delay 0.1))

(use-package org
  :ensure t
  :config
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (define-key global-map (kbd "C-c c") 'org-capture)
  (auto-fill-mode))

(setq rcirc-server-alist
      '(("irc.freenode.net" :port 6697 :encryption tls
	 :channels ("#emacs"))))

;; Emacs shell mode and fish don't get along
(use-package shell
  :config
  (setq explicit-shell-file-name "zsh"))

(provide 'init-tools)
