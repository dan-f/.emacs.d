(defconst jasmine-names '("jasmine" "beforeEach" "afterEach" "it" "expect" "spyOn" "setFixtures"))
(defconst amd-names '("define" "require" "describe"))
(defconst sinon-names '("sinon"))
(defconst i18n-names '("gettext"))

;; (use-package js2-mode
;;   :ensure t
;;   :mode ("\\.js\\'" . js2-jsx-mode)
;;   :config
;;   (setq js2-basic-offset 2
;;         js2-strict-missing-semi-warning nil
;;         js2-global-externs (append jasmine-names amd-names sinon-names i18n-names)))

(use-package company-flow
  :ensure t
  :config
  (add-to-list 'company-backends 'company-flow))

(use-package flycheck-flow
  :ensure t)


(setq-default js-indent-level 2)

(defun set-jsx-indentation ()
  (setq-local sgml-basic-offset js-indent-level))
(add-hook 'js-jsx-mode-hook #'set-jsx-indentation)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-jsx-mode))

(use-package nodejs-repl
  :ensure t)

(provide 'init-js)
