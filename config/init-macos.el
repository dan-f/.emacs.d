(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-b") 'ido-switch-buffer)
(global-set-key (kbd "s-p") 'projectile-switch-project)
(global-set-key (kbd "s-f") 'projectile-find-file)
(global-set-key (kbd "s-k") 'kill-buffer)
(global-set-key (kbd "s-m") 'magit-status)

(provide 'init-macos)
