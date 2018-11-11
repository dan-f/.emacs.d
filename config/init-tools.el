(require 'init-commands)

(use-package exec-path-from-shell
  :ensure t
  :config (when window-system
            (exec-path-from-shell-initialize)))

(use-package dired-hide-dotfiles
  :ensure t
  :init
  (defun dired-mode-hook-dotfiles ()
    "Enables `dired-hide-dotfiles-mode'"
    (dired-hide-dotfiles-mode)
    (define-key dired-mode-map "." #'dired-hide-dotfiles-mode))
  (add-hook 'dired-mode-hook #'dired-mode-hook-dotfiles))

(use-package projectile
  :ensure t
  :init
  (setq projectile-switch-project-action #'projectile-dired)
  :config
  (projectile-global-mode)
  (define-key dan-f/command-map "p" projectile-command-map))

(use-package ivy
  :after projectile
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t
        projectile-completion-system 'ivy)
  :config
  (ivy-mode t))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         :map read-expression-map
         ("C-r" . counsel-expression-history)
         ("C-c t" . counsel-load-theme)
         :map dan-f/command-map
         ("r" . counsel-bookmark)
         :map dan-f/command-map
         ("t" . counsel-load-theme)))

(use-package swiper
  :after counsel
  :ensure t
  :bind (("C-s" . swiper)))

(use-package magit
  :ensure t
  :bind (:map dan-f/command-map
              ("m" . magit-status))
  :init
  ;; (add-hook 'magit-status-mode-hook 'magit-filenotify-mode)
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
  (setq company-idle-delay 0.1
        company-dabbrev-downcase nil)
  :config
  (global-company-mode))

(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :after lsp-mode
  :ensure t
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package company-lsp
  :after (lsp-mode company)
  :ensure t
  :config
  (push 'company-lsp company-backend))

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
