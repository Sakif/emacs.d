(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://stable.melpa.org/packages/") t)

;; get use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package use-package
  :config ; not necesserily for use-package but general config
  (menu-bar-mode -1) ; no menubar
  (tool-bar-mode -1) ; no toolbar
  ;;(scroll-bar-mode -1) ; no scroll bar
  (column-number-mode) ; shoes the column number
  (global-visual-line-mode) ; warping
  ; automatically reloads buffer if changes made outside of Emacs
  (global-auto-revert-mode t)
  (fset 'yes-or-no-p 'y-or-n-p) ; yes/no choices are now just y/n
  (set-default-coding-systems 'utf-8) ; use UTF-8 by default
  (setq inhibit-startup-message t) ; no start up message
  (set-face-attribute ; set font
    'default nil
    :font "JetBrains Mono"
    :height 160)
  :hook
  (before-save . whitespace-cleanup) ; clean up white space before save
  :custom
  (user-mail-address "smfzaman@gmail.com") ; my email
  (user-full-name "Sakif Fahmid Zaman") ; Who am I?
  (make-backup-files nil) ; no backup files
  (use-package-always-ensure t)) ; if package is not installed install it

(use-package doom-themes
  :config ; theme
  (load-theme 'doom-vibrant t))

(use-package doom-modeline
  :custom ; better mode line
  (doom-modeline-height 16)
  (doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-minor-modes (featurep 'minions))
  (doom-modeline-display-default-persp-name t)
  (doom-modeline-project-detection 'project)
  (doom-modeline-icon (display-graphic-p))
  (doom-modeline-indent-info t)
  :config
  (doom-modeline-mode 1))

(use-package rainbow-delimiters
  :hook ; colourful paranthesis
  (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
  :config ; close open paranthesis
  (smartparens-global-mode 1)
  (require 'smartparens-config)
  (show-paren-mode t))

(use-package helm-projectile
  :init ; helm and projectile
  (global-unset-key (kbd "C-x c"))
  ;; (when (file-directory-p "/mnt/d/Apps/RimWorld/Mods")
  ;; (setq projectile-project-search-path '("/mnt/d/Apps/RimWorld/Mods")))
  :config
  (require 'helm-config)
  (projectile-mode +1)
  (helm-mode 1)
  (helm-projectile-on)
  ; make TAB work in terminal
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  ; list actions using C-z
  (define-key helm-map (kbd "C-z")  'helm-select-action)
  :bind-keymap
  ("C-x p" . projectile-command-map)
  :bind
  ("M-x" . helm-M-x)
  ("C-x b" . helm-mini)
  ("M-y" . helm-show-kill-ring)
  ("C-x C-f" . helm-find-files))

(use-package helm-rg)

(use-package company
  :config ; code compleation framework
  (global-company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :bind
  ("M-/" . company-complete-common-or-cycle))

(use-package auto-package-update
  :init ; automatically update package once a week
  (auto-package-update-maybe)
  :custom
  (auto-package-update-delete-old-versions t))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package which-key
  :init ; tells which function is binded to which keyboard shortcut
  (which-key-mode)
  :custom
  (which-key-idle-delay 1))

(use-package iedit
  :bind ; for finding all in buffer and replacing them
  ("C-c f" . iedit-mode))

(use-package eglot
  :hook ; language server protocol
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (before-save . eglot-format-buffer)
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  :custom
  (eglot-ignored-server-capabilites (quote (:documentHighlightProvider))))

(use-package python-mode
  :hook
  (python-mode . eglot-ensure))
