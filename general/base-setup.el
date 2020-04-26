
;;; Code:
(require 'use-package)
(setq use-package-always-ensure t)

(require 'company)
(use-package company
  :config (global-company-mode)
  (setq company-idle-delay 0)
  :bind ("M-/" . company-complete-common-or-cycle))

(require 'flycheck)
(use-package flycheck :config (global-flycheck-mode))

(require 'doom-themes)
(use-package doom-themes
  :config
  (doom-themes-visual-bell-config)
  (load-theme 'doom-one t))

(require 'doom-modeline)
(use-package doom-modeline
  :init
  (setq doom-modeline-icon (display-graphic-p))
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-buffer-modification-icon t)
  (setq doom-modeline-minor-modes (featurep 'minions))
  :hook (after-init . doom-modeline-mode))
;;; base-setup.el ends here
