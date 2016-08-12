;; Apparently the following has to happen before the call to (require 'evil)
(setq evil-want-C-u-scroll t)

(use-package evil
  :ensure t
  :config (progn
            ;; window navigation
            (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
            (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
            (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
            (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
            (define-key evil-motion-state-map (kbd "C-h") 'evil-window-left)
            (define-key evil-motion-state-map (kbd "C-j") 'evil-window-down)
            (define-key evil-motion-state-map (kbd "C-k") 'evil-window-up)
            (define-key evil-motion-state-map (kbd "C-l") 'evil-window-right)
            ))

(use-package evil-god-state
  :ensure t
  :config (evil-define-key 'normal global-map "," 'evil-execute-in-god-state))

(use-package evil-magit
  :ensure t
  :config (require 'evil-magit))

(use-package evil-commentary
  :ensure t
  :init (evil-commentary-mode))

(use-package evil-leader
  :ensure t
  :init
  (setq evil-leader/leader "SPC")
  (evil-leader/set-key
    "e" 'find-file
    "b" 'switch-to-buffer
    "q" 'evil-quit
    "f" 'projectile-find-file
    "m" 'magit-status
    "h" 'helm-command-prefix
    "p" 'projectile-switch-project
    "a" 'org-agenda)
  :config
  (global-evil-leader-mode))

(use-package key-chord
  :ensure t
  :init
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

(evil-mode 1)
(evil-set-toggle-key "C-S-z")

(provide 'init-evil)
