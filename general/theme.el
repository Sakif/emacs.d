
;;; code:
(unless (package-installed-p 'doom-themes) (package-install 'doom-themes))
(require 'doom-themes)
(use-package doom-themes
  :config
  (doom-themes-visual-bell-config)
  (load-theme 'doom-one t))
;;; theme.el ends here
