(require 'df-files)

(use-package org
  :ensure t
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :config
  ;; org-agenda
  (setq org-agenda-files '("~/org/agendas/work.org"
                           "~/org/agendas/personal.org"))
  ;; org-capture
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates
        '(("f" "File" plain (file (dan-f/get-unique-filename "~/org/files/" ".org")))
          ("n" "Note" entry (file+datetree "~/org/notes.org")
           "* %?\nEntered on %U\n  %i\n")
          ("t" "Work Task" entry (file+headline "~/org/agendas/work.org" "Tasks")
           "** %? %t")
          ("m" "Work Meeting" entry (file+headline "~/org/agendas/work.org" "Meetings")
           "** Meeting %?\n%U\n  %i\n")
          ("p" "Personal Task" entry (file+headline "~/org/agendas/personal.org" "Tasks")
           "** %? %t")))
  ;; org-babel
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((js . t)
     (python . t)))
  (add-hook 'org-mode-hook '(lambda ()
                              (if (fboundp 'dan-f/editing-mode)
                                  (dan-f/editing-mode -1))))
  (auto-fill-mode))

(provide 'init-org)
