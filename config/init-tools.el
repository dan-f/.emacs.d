(use-package exec-path-from-shell
  :ensure t
  :config (when (memq window-system '(mac ns))
            (exec-path-from-shell-initialize)))

(use-package dired-details
  :ensure t
  :init
  (setq dired-details-hidden-string "")
  :config
  (dired-details-install))

(use-package projectile
  :ensure t
  :config (projectile-global-mode))

(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t
        projectile-completion-system 'ivy)
  :config
  (use-package counsel
    :ensure t
    :bind (("M-x" . counsel-M-x)
           :map read-expression-map
           ("C-r" . counsel-expression-history)))
  (use-package swiper
    :ensure t
    :bind ("C-s" . swiper))
  (ivy-mode t))

(use-package magit
  :ensure t
  :bind (("C-c m" . magit-status)
         ("<f5>" . magit-status))
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"
        magit-push-always-verify nil))

(use-package git-gutter
  :ensure t
  :init
  (setq git-gutter:added-sign "+"
        git-gutter:removed-sign "-"
        git-gutter:modified-sign "~")
  :config
  (global-git-gutter-mode))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0.1)
  :config
  (global-company-mode))

(setq rcirc-server-alist
      '(("irc.freenode.net" :port 6697 :encryption tls
	 :channels ("#emacs"))))

;; Emacs shell mode and fish don't get along
(use-package shell
  :config
  (setq explicit-shell-file-name "bash"))

(use-package dtrt-indent
  :ensure t
  :config
  (add-hook 'prog-mode-hook (lambda () (dtrt-indent-mode t))))

(provide 'init-tools)
