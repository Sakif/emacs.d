
;;; Code:
(setq inhibit-startup-message t) ; no start up message
(menu-bar-mode -1) ; no menubar
(global-visual-line-mode) ; wraping
(show-paren-mode) ; highlight paran
(setq visible-bell t) ; no sound
(column-number-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(package-selected-packages
   (quote
    (iedit org-mode helm-ispell magit helpful which-key rainbow-delimiters doom-themes doom-modeline flycheck helm company use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; initialize package
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; get use-package
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(use-package use-package
  :custom
  (use-package-always-ensure t))

;; helm
(use-package helm
  :init
  (global-unset-key (kbd "C-x c"))
  :config
  (require 'helm-config)
  (helm-mode 1)
  :bind
  (("M-x" . helm-M-x)
   ("C-x b" . helm-mini)
   ("M-y" . helm-show-kill-ring)
   ("C-x C-f" . helm-find-files)))

(use-package helm-ispell)

;; company
(use-package company
  :diminish
  :config
  (global-company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :bind
  ("M-/" . company-complete-common-or-cycle))

;; flycheck
(use-package flycheck
  :config
  (global-flycheck-mode))

;; better mode line
(use-package doom-modeline
  :custom
  (doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-minor-modes (featurep 'minions))
  (doom-modeline-display-default-persp-name t)
  (doom-modeline-enable-word-count t)
  (doom-modeline-github t)
  (doom-modeline-indent-info t)
  :hook
  (after-init . doom-modeline-mode))

;; better theme
(use-package doom-themes
  :config
  (doom-themes-visual-bell-config)
  (load-theme 'doom-one t))

;; colourful delim
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init
  (which-key-mode)
  :custom
  (which-key-idle-delay 1))

(use-package iedit)
;;; init.el ends here
