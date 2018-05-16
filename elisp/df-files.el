(defun dan-f/get-unique-filename (path &optional extension error-msg)
  "Gets a filename from the user within `path'"
  (let* ((prompt (if error-msg
                     (format "(%s) Filename: " error-msg)
                   "Filename: "))
         (name (if extension
                   (format "%s%s" (read-string prompt) extension)
                 (read-string prompt)))
         (filename (expand-file-name name path)))
    (if (file-exists-p filename)
        (dan-f/get-unique-filename path extension "Try again. Filename taken")
      filename)))


(provide 'df-files)
