(use-package exec-path-from-shell
  :ensure t
  :init (when (memq window-system '(mac ns))
	  (exec-path-from-shell-initialize)))

(use-package dired-details
  :ensure t
  :config
  (setq dired-details-hidden-string "")
  :init
  (require 'dired-details)
  (dired-details-install))

(use-package projectile
  :ensure t
  :init (projectile-global-mode))

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper)
  (define-key evil-normal-state-map (kbd "/") 'swiper))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq projectile-completion-system 'ivy))

(use-package magit
  :ensure t
  :bind ("C-c m" . magit-status)
  :bind ("<f5>" . magit-status)
  :init (setq magit-last-seen-setup-instructions "1.4.0")
  :config
  (setq magit-push-always-verify nil))

;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode))

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-idle-delay 0.1))

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
