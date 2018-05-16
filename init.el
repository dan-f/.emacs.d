(package-initialize)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; (if (display-graphic-p)
;;     (unbind-key (kbd "C-z")))

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
                  init-evil
                  init-global-settings
                  init-haskell
                  init-js
                  init-linkeddata
                  init-lisp
                  init-markdown
                  init-org
                  init-osx
                  init-python
                  init-server
                  init-tools
                  init-web
                  ))
  (require module))
