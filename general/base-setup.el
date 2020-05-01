
;;; Code:
(require 'package)
(add-to-list 'package-archives '("MELPA" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(unless (package-installed-p 'company) (package-install 'company))
(require 'company)
(use-package company
  :config (global-company-mode)
  (setq company-idle-delay 0)
  :bind ("M-/" . company-complete-common-or-cycle))

(unless (package-installed-p 'flycheck) (package-install 'flycheck))
(require 'flycheck)
(use-package flycheck :config (global-flycheck-mode))

(unless (package-installed-p 'helm) (package-install 'helm))
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

(unless (package-installed-p 'projectile) (package-install 'projectile))
(require 'projectile)
(use-package projectile :init (projectile-mode +1))

(menu-bar-mode -1)
(setq-default tab-width 4)
(global-visual-line-mode)
(show-paren-mode)
(column-number-mode)

;;; base-setup.el ends here
