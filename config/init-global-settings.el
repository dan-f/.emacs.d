;; global settings
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'fundamental-mode)
(setq linum-format "%d ")
(setq-default fill-column 80)
(setq scroll-conservatively 1)
(when (display-graphic-p) ; better GUI scrolling
  (progn
    ;; (setq mouse-wheel-progressive-speed nil)
    (setq mouse-wheel-scroll-amount '(0.01))))
(setq ring-bell-function 'ignore)
(setq split-height-threshold nil)

;; dired
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "SPC") nil)

;; global minor modes
(global-auto-revert-mode)
(column-number-mode)
(delete-selection-mode)
(size-indication-mode)
(windmove-default-keybindings)
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

;; global keybindings
(defvar dan-f/global-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c s") 'eshell)
    map))

(define-minor-mode dan-f/global-mode
  "Minor mode for global editing bindings.  Avoids polluting the
global keybinding scope."
  :group 'dan-f
  :global t
  :keymap dan-f/global-map)

(dan-f/global-mode)

(provide 'init-global-settings)
