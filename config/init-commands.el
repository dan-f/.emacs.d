(require 'df-files)

(defvar dan-f/global-notes-dir "~/notes/"
  "The user-global directory for general notes files")

(defun dan-f/capture-note ()
  "Opens a buffer pointing to a file in the
  `dan-f/global-notes-dir' directory"
  (interactive)
  (let ((filename (dan-f/get-unique-filename dan-f/global-notes-dir)))
    (find-file-other-window filename)))

(defvar dan-f/command-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c n") 'dan-f/capture-note)
    map)
  "The keymap for dan-f stuff")

(define-minor-mode dan-f/command-mode
  "Global minor mode for dan-f custom commands"
  :group 'dan-f
  :global t
  :keymap dan-f/command-map)

(dan-f/command-mode)

(provide 'init-commands)
