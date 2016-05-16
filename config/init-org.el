(require 'init-editing)

(use-package org
  :ensure t
  :config

  ;; org-agenda
  (define-key global-map (kbd "C-c a") 'org-agenda)
  (setq org-agenda-files '("~/org/agendas/work.org"
                           "~/org/agendas/personal.org"))

  ;; org-capture
  (define-key global-map (kbd "C-c c") 'org-capture)
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates
        '(("t" "Work Task" entry (file+headline "~/org/agendas/work.org" "Tasks"))
          ("p" "Personal Task" entry (file+headline "~/org/agendas/personal.org" "Tasks"))))

  (define-key global-map (kbd "C-c l") 'org-store-link)
  (add-hook 'org-mode-hook '(lambda () (dan-f/editing-mode -1)))
  (auto-fill-mode))

(provide 'init-org)
