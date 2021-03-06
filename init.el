(package-initialize)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(defgroup dan-f nil
  "Manage my settings"
  :prefix "dan-f/"
  :group 'convenience)

(dolist (module '(init-packages
                  init-appearance
                  init-commands
                  init-editing
                  init-eval
                  init-evil
                  init-global-settings
                  init-haskell
                  init-js
                  init-linkeddata
                  init-lisp
                  init-macos
                  init-markdown
                  init-ocaml
                  init-org
                  init-python
                  init-rust
                  init-server
                  init-tools
                  init-web
                  init-x
                  ))
  (require module))
