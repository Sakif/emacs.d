(require 'package)
(add-to-list 'package-archives ; adding melpa to package archives
  '("melpa" . "https://stable.melpa.org/packages/") t)

; get use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package use-package
  :config ; not necesserily for use-package but general config
  (menu-bar-mode -1) ; no menubar
  (tool-bar-mode -1) ; no toolbar
  (column-number-mode) ; shoes the column number
  (global-visual-line-mode) ; warping
  (global-auto-revert-mode t) ; automatically reloads buffer
  (fset 'yes-or-no-p 'y-or-n-p) ; yes/no choices are now just y/n
  (set-default-coding-systems 'utf-8) ; use UTF-8 by default
  :hook
  (before-save . whitespace-cleanup) ; clean up white space before save
  :custom
  (user-full-name "Sakif Fahmid Zaman") ; Who am I?
  (user-mail-address "smfzaman@gmail.com") ; my email
  (make-backup-files nil) ; no backup files
  (visible-bell t) ; visual bell
  (tab-width 2) ; tab width
  (warning-suppress-types '((comp)))
  (indent-tabs-mode nil) ; do not use tab
  (inhibit-startup-message t) ; no start up message
  (use-package-always-ensure t)) ; if package is not installed install it

(use-package magit)

(use-package doom-themes
  :config ; theme
  (load-theme 'doom-vibrant t)
  (doom-themes-org-config)
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t))

(use-package doom-modeline
  :custom ; better mode line
  (doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-minor-modes (featurep 'minions))
  (doom-modeline-display-default-persp-name t)
  (doom-modeline-project-detection 'project)
  (doom-modeline-indent-info t)
  :config
  (display-battery-mode) ; displays current battery charge
  (display-time-mode 1) ; displays the current time
  (doom-modeline-mode 1))

(use-package rainbow-delimiters
  :hook ; colourful paranthesis
  (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
  :config ; close open paranthesis
  (smartparens-global-mode 1)
  (require 'smartparens-config)
  (show-paren-mode t))

(use-package helm
  :init ; helm and projectile
  (global-unset-key (kbd "C-x c"))
  :config
  (require 'helm-config)
  (helm-mode 1)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  ; ^ make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action)
  ; ^ list actions using C-z
  :bind
  ("M-x" . helm-M-x)
  ("C-x b" . helm-mini)
  ("M-y" . helm-show-kill-ring)
  ("C-x C-f" . helm-find-files))

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

(use-package which-key
  :init ; tells which function is binded to which keyboard shortcut
  (which-key-mode)
  :custom
  (which-key-idle-delay 1))

(use-package iedit
  :bind ; for finding all in buffer and replacing them
  ("C-c f" . iedit-mode))

(defun format-before-save ()
  "Eglot will format the buffer before saving."
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'eglot-format-buffer nil t))

(use-package eglot
  :hook ; language server protocol and c/cpp configuration
  (c-mode . eglot-ensure)
  (c-mode . format-before-save)
  (c++-mode . eglot-ensure)
  (c++-mode . format-before-save)
  :custom
  (eglot-ignored-server-capabilites (quote (:documentHighlightProvider)))
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

(use-package el-fetch)
