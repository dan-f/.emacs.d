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
  (let ((map (make-sparse-keymap "dan-f command")))
    (define-key map "b" 'switch-to-buffer)
    (define-key map "n" 'dan-f/capture-note)
    (define-key map "s" 'eshell)
    (define-key map "q" 'save-buffers-kill-terminal)
    map)
  "The keymap for dan-f stuff")

(global-set-key (kbd "s-SPC") dan-f/command-map)

(provide 'init-commands)
