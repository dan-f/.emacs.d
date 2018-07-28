(require 'init-commands)

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

(dolist (state '(normal motion visual))
  (evil-global-set-key state (kbd "SPC") dan-f/command-map))

(use-package key-chord
  :ensure t
  :config
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode t))

(evil-mode 1)

(provide 'init-evil)
