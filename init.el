(package-initialize)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path (concat user-emacs-directory "config"))
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(defgroup dan-f nil
  "Manage my settings"
  :prefix "dan-f/"
  :group 'convenience)

(dolist (module '(init-packages
                  init-appearance
                  init-editing
                  init-evil
                  init-global-settings
                  init-js
                  init-lisp
                  init-linkeddata
                  init-markdown
                  init-org
                  init-osx
                  init-server
                  init-python
                  init-tools
                  init-web
                  ))
  (require module))
