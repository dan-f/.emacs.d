;; global editing settings
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'dan-f/delete-trailing-whitespace)
(setq require-final-newline t)
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq visible-bell t)

;; editing packages
(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package multiple-cursors
  :ensure t
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (setq sp-highlight-pair-overlay nil)
  (sp-with-modes '(js2-mode javascript-mode c-mode c++-mode)
    (sp-local-pair "/*" "*/" :post-handlers '(("| " "SPC") ("* ||\n[i]" "RET"))))
  (dolist (opener '("(" "{" "["))
    (sp-pair opener nil :post-handlers '(("||\n[i]" "RET") ("| " "SPC"))))
  :init
  (setq sp-base-key-bindings 'paredit)
  (smartparens-global-mode)
  (show-smartparens-global-mode))

(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'prog-mode-hook '(lambda () (rainbow-delimiters-mode))))

(use-package highlight-symbol
  :ensure t
  :init (add-hook 'prog-mode-hook '(lambda () (progn (highlight-symbol-mode) (highlight-symbol-nav-mode)))))

(use-package dtrt-indent
  :ensure t
  :config
  (add-hook 'prog-mode-hook (lambda () (dtrt-indent-mode t))))

;; editing commands and minor mode
(defcustom dan-f/auto-save t
  "Non-nil automatically saves buffers as they lose focus.")
(defun dan-f/auto-save-command (&rest args)
  (when (and dan-f/auto-save
             buffer-file-name
             (buffer-modified-p (current-buffer))
             (file-writable-p buffer-file-name))
    (save-buffer)))
(add-hook 'focus-out-hook 'dan-f/auto-save-command)
(add-hook 'mouse-leave-buffer-hook 'dan-f/auto-save-command)
(dolist (func '(switch-to-buffer other-window select-window))
  (advice-add func :before #'dan-f/auto-save-command))

(defun dan-f/delete-trailing-whitespace-dwim ()
  "Delete trailing whitespace from the buffer, ignoring the
current line if the point is within trailing whitespace."
  (interactive)
  (if (and (looking-at "[[:space:]]*\n$")
           (looking-back "[[:space:]]"))
      (progn
        (save-excursion
          (beginning-of-line)
          (delete-trailing-whitespace (buffer-end -1) (point)))
        (save-excursion
          (forward-line)
          (beginning-of-line)
          (delete-trailing-whitespace (point) nil)))
    (delete-trailing-whitespace)))

(defun dan-f/open-line-below ()
  "Open a new line below the cursor."
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun dan-f/open-line-above ()
  "Open a new line above the cursor."
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (indent-according-to-mode))

(defun dan-f/comment-or-uncomment-line-or-region ()
  "Toggles commenting on the current line if no region is defined,
otherwise toggles comments on the region."
  (interactive)
  (let ((use-empty-active-region t) (mark-even-if-inactive nil))
    (cond
     ((use-region-p) (comment-or-uncomment-region (region-beginning) (region-end)))
     (t (comment-or-uncomment-region (line-beginning-position) (line-end-position))))))

(defun dan-f/duplicate-line-or-region ()
  "Duplicates the current line pasting below if no region is
defined, otherwise duplicates the region.
TODO:
- With arg, paste above, otherwise paste below.
- Cursor placement
- Keep region"
  (interactive)
  (cond
   ((use-region-p)
    (progn
      (kill-ring-save (region-beginning) (region-end))
      (yank)))
   (t
    (progn
      (save-excursion
        (beginning-of-line)
        (let ((beginning (point)))
          (next-line)
          (kill-ring-save beginning (point))
          (yank)))
      (next-line)))))

(defvar dan-f/editing-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "s-s") 'save-buffer)
    (define-key map (kbd "s-b") 'switch-to-buffer)
    (define-key map (kbd "s-q") 'save-buffers-kill-terminal)
    (define-key map (kbd "<M-RET>") 'dan-f/open-line-below)
    (define-key map (kbd "<M-S-return>") 'dan-f/open-line-above)
    (define-key map (kbd "<M-S-backspace>") 'kill-whole-line)
    (define-key map (kbd "M-D") 'dan-f/duplicate-line-or-region)
    (define-key map (kbd "C-c ;") 'dan-f/comment-or-uncomment-line-or-region)
    map))

(define-minor-mode dan-f/global-editing-mode
  "Minor mode for global editing bindings.  Avoids polluting the
global keybinding scope."
  :group 'dan-f
  :global t
  :keymap dan-f/editing-map)

(define-minor-mode dan-f/editing-mode
  :group 'dan-f
  :keymap dan-f/editing-map)

(dan-f/editing-mode)

(provide 'init-editing)
