(require 'package)
(add-to-list 'package-archives ;; adding melpa to package archives
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
  (show-paren-mode t) ; show parenthesis
  (global-visual-line-mode) ; warping
  (toggle-frame-fullscreen) ; open emacs fullscreen
  (global-auto-revert-mode t) ; automatically reloads buffer
  (fset 'yes-or-no-p 'y-or-n-p) ; yes/no choices are now just y/n
  (set-default-coding-systems 'utf-8) ; use UTF-8 by default
  (set-face-attribute ; setting font and size
   'default t :font "JetBrains Mono" :height 125)
  :hook
  (before-save . whitespace-cleanup) ; clean up white space before save
  :custom
  (tab-width 2) ; tab width
  (scroll-bar-mode nil) ; no scroll bar
  (indent-tabs-mode nil) ; do not use tab
  (make-backup-files nil) ; no backup files
  (inhibit-startup-message t) ; no start up message
  (compile-command "./compile.sh") ; compile command
  (warning-suppress-types '((comp)))
  (use-package-always-ensure t)) ; if package is not installed install it
;; (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

(use-package vertico
  :custom ; VERTical Interactive COmpletion
  (vertico-cycle t)
  :init
  (vertico-mode)
  (savehist-mode))

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

(use-package doom-themes
  :config ; theme
  (load-theme 'doom-tokyo-night t)
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
  (doom-modeline-icon nil)
  :config
  (column-number-mode) ; shoes the column number
  (display-time-mode) ; display time
  :hook
  (after-init . doom-modeline-mode))

(use-package rainbow-delimiters
  :hook ; colourful paranthesis
  (prog-mode . rainbow-delimiters-mode))

(use-package rg
  :init
  (rg-enable-default-bindings))

(use-package magit)
(use-package el-fetch)

;; language server protocal + language support ;;

(defun format-before-save ()
  "Eglot will format the buffer before saving."
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'eglot-format-buffer nil t))

(use-package eglot
  :hook
  (c-mode . eglot-ensure)
  (c-mode . format-before-save)
  (c++-mode . eglot-ensure)
  (c++-mode . format-before-save)
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

(use-package gdscript-mode
  :hook
  (gdscript-mode . eglot-ensure)
  :custom
  (gdscript-use-tab-indents t)
  (gdscript-indent-offset 2)
;;(gdscript-godot-executable "/home/z/.local/apps/godot")
  (gdscript-gdformat-save-and-format t))

(use-package rust-mode
  :init
  :custom
  (rust-format-on-save t)
  :hook
  (rust-mode . eglot-ensure))
