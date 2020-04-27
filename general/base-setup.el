
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
  :config
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-buffer-modification-icon t)
  (setq doom-modeline-minor-modes (featurep 'minions))
  (setq doom-modeline-display-default-persp-name t)
  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-github t)
  (setq doom-modeline-icon t)
  (setq doom-modeline-indent-info t)
  ; (setq doom-modeline-minor-modes t)
  (setq doom-modeline-unicode-fallback t)
  :hook (after-init . doom-modeline-mode))

(require 'helm)
(use-package helm
  :init
  (global-unset-key (kbd "C-x c"))
  (setq helm-autoresize-max-height 50)
  (setq helm-autoresize-min-height 30)
  (setq helm-autoresize-mode t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-ff-file-name-history-use-recentf t)
  (setq helm-ff-search-library-in-sexp t)
  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-scroll-amount 8)
  (setq helm-split-window-inside-p t)
  :config
  (setq helm-mode t)
  :bind
  (("M-x" . helm-M-x)
   ("C-x b" . helm-mini)
   ("M-y" . helm-show-kill-ring)
   ("C-x C-f" . helm-find-files)))
;;; base-setup.el ends here
