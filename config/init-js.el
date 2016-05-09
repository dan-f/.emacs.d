(defconst jasmine-names '("jasmine" "beforeEach" "afterEach" "it" "expect" "spyOn" "setFixtures"))
(defconst amd-names '("define" "require" "describe"))
(defconst sinon-names '("sinon"))
(defconst i18n-naames '("gettext"))

(use-package js2-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (setq js2-global-externs (append jasmine-names amd-names sinon-names i18n-naames)))

(use-package js2-refactor
  :ensure t
  :config (add-hook 'js2-mode-hook #'js2-refactor-mode))

(use-package coffee-mode
  :ensure t
  :config (setq coffee-tab-width 4))

(provide 'init-js)
