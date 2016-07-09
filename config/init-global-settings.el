;; global settings
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'fundamental-mode)
(setq linum-format "%d ")
(setq fill-column 80)
(setq scroll-conservatively 1)
(when (display-graphic-p) ; better GUI scrolling
  (progn
    ;; (setq mouse-wheel-progressive-speed nil)
    (setq mouse-wheel-scroll-amount '(0.01))))
(put 'dired-find-alternate-file 'disabled nil)

;; global minor modes
(global-auto-revert-mode)
(column-number-mode)
(delete-selection-mode)
(size-indication-mode)
(electric-pair-mode)
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

(provide 'init-global-settings)
