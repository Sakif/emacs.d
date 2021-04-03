(require 'package)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/") t)

;; get use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(use-package use-package
  :init
  (menu-bar-mode -1) ; no menubar
  (tool-bar-mode -1) ; no toolbar
  ;;(scroll-bar-mode -1) ; no scroll bar
  (column-number-mode) ; shoes the column number
  (global-visual-line-mode) ; warping
  (global-auto-revert-mode t) ; automatically reloads buffer if changes made outside of Emacs
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
  (use-package-always-ensure t))

(use-package doom-themes
  ;; theme
  :config
  (load-theme 'doom-vibrant t))

(use-package doom-modeline
  ;; better mode line
  :custom
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
  ;; colourful paranthesis
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
  ;; close open paranthesis
  :config
  (smartparens-global-mode 1)
  (require 'smartparens-config)
  (show-paren-mode t))

(use-package helm-projectile
  ;; helm and projectile
  :init
  (global-unset-key (kbd "C-x c"))
  ;; (when (file-directory-p "/mnt/d/Apps/RimWorld/Mods") (setq projectile-project-search-path '("/mnt/d/Apps/RimWorld/Mods")))
  :config
  (require 'helm-config)
  (projectile-mode +1)
  (helm-mode 1)
  (helm-projectile-on)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  :bind-keymap
  ("C-x p" . projectile-command-map)
  :bind
  ("M-x" . helm-M-x)
  ("C-x b" . helm-mini)
  ("M-y" . helm-show-kill-ring)
  ("C-x C-f" . helm-find-files))

;;(use-package format-all)

(use-package company
  ;; code compleation framework
  :config
  (global-company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :bind
  ("M-/" . company-complete-common-or-cycle))

(use-package auto-package-update
  ;; automatically update package once a week
  :init
  (auto-package-update-maybe)
  :custom
  (auto-package-update-delete-old-versions t))

;;(use-package yasnippet :config (yas-global-mode 1)) 

(use-package which-key
  ;; tells which function is binded to which keyboard shortcut
  :init
  (which-key-mode)
  :custom
  (which-key-idle-delay 1))

(use-package iedit
  ;; for finding all in buffer and replacing them
  :bind
  ("C-c f" . iedit-mode))

;; language specific customization
(use-package eglot
  :hook
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (before-save . eglot-format-buffer)
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd-11"))
  :custom
  (eglot-ignored-server-capabilites (quote (:documentHighlightProvider))))

(use-package python-mode
  :hook
  (python-mode . eglot-ensure))

(use-package web-mode
  :mode "\\.html\\'"
  :custom
  (web-mode-enable-current-element-highlight t)
  (web-mode-enable-css-colorization t)
  (web-mode-enable-auto-pairing t)
  (web-mode-comment-style 2)
  (web-mode-block-padding 0)
  (web-mode-script-padding 1)
  (web-mode-style-padding 1)
  (web-mode-code-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-markup-indent-offset 2))
