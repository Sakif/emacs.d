;;; package --- Summary
;;; Commentary:
;;; my Emacs config file
;;; Code:
(setq user-full-name "Sakif Fahmid Zaman" ; who am I?
      user-mail-address "smfzaman@gmail.com")

(setq inhibit-startup-message t) ; no start up message
(menu-bar-mode -1) ; no menubar
(global-visual-line-mode) ; wraping
(column-number-mode) ; shoes the column number
; (global-hl-line-mode +1) ; highlights line number
; (line-number-mode +1) ; line numbers
; (global-display-line-numbers-mode 1) ; more line numbers
(size-indication-mode t) ; indicates the current tab size
; to stop writing out the full yes and no
(fset 'yes-or-no-p 'y-or-n-p)

(global-auto-revert-mode t) ; automatically reloads buffer if changes made outside of emacs

(setq-default tab-width 4 ; set tab size
              indent-tabs-mode nil)

;; clean up whitespace before save
(add-hook 'before-save-hook 'whitespace-cleanup)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(package-selected-packages
   (quote
    (ccls company-lsp helm-rg iedit helm-ispell magit helpful which-key rainbow-delimiters doom-themes doom-modeline flycheck helm company use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; initialize package
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; get use-package
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(use-package use-package
  :custom
  (use-package-always-ensure t))

(use-package smartparens
  :config
  (smartparens-global-mode 1)
  (require 'smartparens-config)
  (show-paren-mode t))

;; helm
(use-package helm-projectile
  :init
  (global-unset-key (kbd "C-x c"))
  ;; set prijectile home directory
  (when (file-directory-p "~/code")
    (setq projectile-project-search-path '("~/code")))
  :custom
  (helm-autoresize-max-height 0)
  (helm-autoresize-min-height 20)
  :config
  (require 'helm-config)
  (projectile-mode +1)
  (helm-mode 1)
  (helm-projectile-on)
  (helm-autoresize-mode 1)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :bind
  (("M-x" . helm-M-x)
   ("C-x b" . helm-mini)
   ("M-y" . helm-show-kill-ring)
   ("C-x C-f" . helm-find-files)))

;; for spelling
(use-package helm-ispell)

;; language server protocol
(use-package lsp-ui)

;; company
(use-package company-lsp
  :config
  (global-company-mode)
  (push 'company-lsp company-backends)
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
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; tells which function is binded to which keyboard shortcut
(use-package which-key
  :init
  (which-key-mode)
  :custom
  (which-key-idle-delay 1))

;; for finding all in buffer and replacing them
(use-package iedit)

;; cpp
(use-package ccls
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook
  ((c-mode c++-mode) . (lambda () (require 'ccls) (lsp))))

;;; init.el ends here
