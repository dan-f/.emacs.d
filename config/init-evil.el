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
  (setq evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-set-toggle-key "C-S-z")
  :config
  (dolist (state '(normal motion visual))
    (evil-global-set-key state (kbd "SPC") dan-f/command-map)))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-magit
  :after evil
  :ensure t)

(use-package evil-commentary
  :after evil
  :ensure t
  :config (evil-commentary-mode))

(use-package key-chord
  :after evil
  :ensure t
  :config
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode t))

(use-package general
  :after evil
  :ensure t
  :config
  (setq general-override-states '(insert
                                  emacs
                                  hybrid
                                  normal
                                  visual
                                  motion
                                  operator
                                  replace))
  (general-override-mode)
  (general-define-key
   :states '(normal visual motion)
   :keymaps 'override
   "SPC" dan-f/command-map))

(eval-after-load 'evil-mode
  (evil-mode 1))

(provide 'init-evil)
