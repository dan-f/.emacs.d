(defconst jasmine-names '("jasmine" "beforeEach" "afterEach" "it" "expect" "spyOn" "setFixtures"))
(defconst amd-names '("define" "require" "describe"))
(defconst sinon-names '("sinon"))
(defconst i18n-names '("gettext"))

(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-jsx-mode))
  (setq js2-basic-offset 2)
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-global-externs (append jasmine-names amd-names sinon-names i18n-names)))

(use-package nodejs-repl
  :ensure t)

(provide 'init-js)
