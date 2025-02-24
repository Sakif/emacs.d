(require 'package)
;; get use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; A quick primer on the `use-package' function (refer to
;; "C-h f use-package" for the full details).
;;
;; (use-package my-package-name
;;   :after foo   ; Load my-package after foo is loaded (seldom used)
;;   :init        ; Run this code before my-package is loaded
;;   :bind        ; Bind these keys to these functions
;;   :custom      ; Set these variables
;;   :config      ; Run this code after my-package is loaded

(require 'use-package)
(use-package use-package
  :config ; not necesserily for use-package but general config
  (column-number-mode) ; shoes the column number
  (display-time-mode) ; display time
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
  (electric-pair-mode t) ; Automatically pair parentheses
  (load-theme 'modus-vivendi) ; theme
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

(use-package vertico
  :custom ; VERTical Interactive COmpletion
  (vertico-cycle t)
  (vertico-resize nil)
  (vertico-count 7) ; limit to a fixed size
  :init
  (vertico-mode)
  (savehist-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic)))

(use-package which-key
  :init ; tells which function is binded to which keyboard shortcut
  (which-key-mode)
  :custom
  (which-key-idle-delay 1))

(use-package cape)
(use-package corfu-terminal
  :custom
  (tab-always-indent 'complete)
  :hook
  (completion-at-point-functions . cape-file)
  :init
  (corfu-terminal-mode +1)
  (global-corfu-mode))

(use-package iedit
  :bind ; for finding all in buffer and replacing them
  ("C-c f" . iedit-mode))

(use-package rainbow-delimiters
  :hook ; colourful paranthesis
  (prog-mode . rainbow-delimiters-mode))

(use-package magit)
(use-package diminish)

(use-package eldoc
  :ensure nil
  :diminish eldoc-mode)

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
  (python-mode . eglot-ensure)
  (python-mode . format-before-save)
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

(use-package rust-mode
  :custom
  (rust-format-on-save t)
  :hook
  (rust-mode . eglot-ensure))
