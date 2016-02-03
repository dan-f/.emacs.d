(require 'init-editing)

(add-hook 'org-mode-hook '(lambda () (dan-f/editing-mode -1)))

(provide 'init-org)
