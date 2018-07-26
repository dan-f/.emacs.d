(use-package evil
  :ensure t
  :bind (:map evil-normal-state-map
              ("C-h" . evil-window-left)
              ("C-j" . evil-window-down)
              ("C-k" . evil-window-up)
              ("C-l" . evil-window-right)
              ("C-h" . evil-window-left)
              ("C-j" . evil-window-down)
              ("C-k" . evil-window-up)
              ("C-l" . evil-window-right))
  :bind (:map evil-motion-state-map
              ("C-h" . evil-window-left)
              ("C-j" . evil-window-down)
              ("C-k" . evil-window-up)
              ("C-l" . evil-window-right)
              ("C-h" . evil-window-left)
              ("C-j" . evil-window-down)
              ("C-k" . evil-window-up)
              ("C-l" . evil-window-right))
  :init
  (setq evil-want-C-u-scroll t
        evil-set-toggle-key "C-S-z"))

(use-package evil-magit
  :ensure t)

(use-package evil-commentary
  :ensure t
  :config (evil-commentary-mode))

(use-package evil-leader
  :ensure t
  :config
  (setq evil-leader/leader "SPC")
  (evil-leader/set-key
    "a" 'org-agenda
    "b" 'switch-to-buffer
    "f" 'find-file
    "h" 'helm-command-prefix
    "m" 'magit-status
    "n" 'dan-f/capture-note
    "p" 'projectile-command-map
    "q" 'evil-quit
    "r" 'counsel-bookmark)
  (global-evil-leader-mode))

(use-package key-chord
  :ensure t
  :config
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode t))

(evil-mode 1)

(provide 'init-evil)
