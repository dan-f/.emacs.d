(when (or (and (not (display-graphic-p)) (fboundp 'menu-bar-mode))
          (eq window-system 'x))
  (menu-bar-mode -1))

(provide 'init-x)
