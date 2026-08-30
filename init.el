;; -*- lexical-binding: t; -*-
(native-comp-available-p)
;; Increase the GC threshold
(setq gc-cons-threshold 10000000) ;; 10MB
;; Increase how much outout emacs can read from external processes
(setq read-process-output-max (* 1024 1024 4))
;; Enable JIT cimpilation
(setq native-comp-jit-compilation t)

(require 'package)
(add-to-list 'package-archives ;; adding melpa to package archives
             '("melpa" . "https://stable.melpa.org/packages/") t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
;; A quick primer on the `use-package' function (refer to "C-h f use-package" for the full details).
;;
;; (use-package my-package-name
;;   :after foo   ; Load my-package after foo is loaded (seldom used)
;;   :init        ; Run this code before my-package is loaded
;;   :bind        ; Bind these keys to these functions
;;   :custom      ; Set these variables
;;   :config      ; Run this code after my-package is loaded

(use-package emacs
  :ensure nil
  :init
  (toggle-frame-fullscreen) ;; open emacs fullscreen
  (set-face-attribute ;; setting font and size
   'default nil :family "JetBrains Mono" :height 130)
  (tool-bar-mode -1) ;; disable the toolbar
  (menu-bar-mode -1)  ;; disable the menu bar
  (display-time-mode) ;; display time
  (save-place-mode 1) ;; remembering file positions
  (fido-vertical-mode) ;; immediate feedback for M-x
  :config
  (show-paren-mode t) ;; show parenthesis
  (global-visual-line-mode) ;; warping
  (global-auto-revert-mode t) ;; automatically reloads buffer
  (electric-pair-mode t) ;; Automatically pair parentheses
  (column-number-mode t) ;; Display the column number in the mode line.
  (delete-selection-mode 1) ;; Enable replacing selected text with typed text.
  (set-default-coding-systems 'utf-8) ;; use UTF-8 by default
  (tty-tip-mode) ;; enables tooltips on the terminal
  (load-theme 'modus-vivendi) ;; theme
  :custom
  (tab-width 2) ;; tab width
  (indent-tabs-mode nil) ;; do not use tab
  (tab-always-indent 'complete) ;; use tab to complete
  (truncate-lines t) ;; do not display continuation lines
  (org-startup-folded 'fold) ;; fold all org headers to show outline
  (inhibit-startup-message t) ;; no start up message
  (use-package-always-ensure t) ;; if package is not installed install it
  (scroll-bar-mode -1) ;; Disable the scroll bar
  (auto-save-default nil) ;; Disable automatic saving of buffers.
  (create-lockfiles nil) ;; Prevent the creation of lock files when editing.
  ;; Move deleted files to the trash instead of permanently deleting them.
  (delete-by-moving-to-trash t)
  (history-length 25) ;; Set the length of the command history.
  (ispell-dictionary "en_CA") ;; Set the default dictionary for spell checking.
  (make-backup-files nil) ;; Disable creation of backup files.
  (pixel-scroll-precision-mode t) ;; Enable precise pixel scrolling.
  ;; Disable momentum scrolling for pixel precision.
  (pixel-scroll-precision-use-momentum nil)
  (ring-bell-function 'ignore) ;; Disable the audible bell.
  ;; Make buffer switching respect display actions.
  (switch-to-buffer-obey-display-actions t)
  (use-dialog-box nil) ;; Disable dialog boxes in favor of minibuffer prompts.
  ;; Use short answers in prompts for quicker responses (y instead of yes)
  (use-short-answers t)
  ;; Set the minimum level of warnings to display.
  (warning-minimum-level :emergency)
  (project-mode-line t) ;; shows project name if a file is in a project
  (compilation-scroll-output t) ;; scroll compilation output
  ;; mark filders containing these as projects
  (project-vc-extra-root-markers '(".project" "Cargo.toml"))
  (treesit-enabled-modes t) ;; use the treesit variant of major modes
  (display-time-24hr-format t) ;; show time in 24 h
  :hook
  (icomplete-minibuffer-setup . my-icomplete-styles)
  (before-save . whitespace-cleanup)) ;; clean up white space before save

(use-package dired
  :ensure nil
  :custom
  ;; "Do What I Mean", seems to make smarter choices for target actions
  (dired-dwim-target t)
  ;; don't ask when making copies of directories
  (dired-recursive-copies 'always)
  ;; always ask if a rename/copy would require creating additional
  ;; directories that don't yet exist.
  (dired-create-destination-dirs 'ask)
  ;; don't ask whether to kill buffers visiting deleted files
  (dired-clean-confirm-killing-deleted-buffers nil)
  (dired-mouse-drag-files t) ;; Allows using the mouse to drag files
  ;; Kill the current buffer when selecting a new directory
  (dired-kill-when-opening-new-dired-buffer t))

;; This automates the process of updating installed packages
(use-package auto-package-update
  :custom
  ;; Set the number of days between automatic updates. Here, packages will
  ;; only be updated if at least 7 days have passed since the last successful
  ;; update.
  (auto-package-update-interval 7)
  ;; Suppress display of the *auto-package-update results* buffer after
  ;; updates. This keeps the user interface clean and avoids unnecessary
  ;; interruptions.
  (auto-package-update-hide-results t)
  ;; Automatically delete old package versions after updates to reduce disk
  ;; usage and keep the package directory clean. This prevents the
  ;; accumulation of outdated files in Emacs's package directory, which
  ;; consume unnecessary disk space over time.
  (auto-package-update-delete-old-versions t)
  :config
  ;; Run package updates automatically at startup, but only if the configured
  ;; interval has elapsed.
  (auto-package-update-maybe))

;; Marginalia are marks or annotations placed at the margin of the page of a
;; book or in this case helpful colorful annotations placed at the margin of
;; the minibuffer for your completion candidates.
(use-package marginalia
  :commands
  (marginalia-mode marginalia-cycle)
  :init
  (marginalia-mode))

;; This package provides an orderless completion style that divides the
;; pattern into space-separated components, and matches candidates that match
;; all of the components in any order.
(use-package orderless
  :custom
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))
(defun my-icomplete-styles ()
  (setq-local truncate-lines t)
  (setq-local completion-styles '(orderless basic)))
(add-hook 'icomplete-minibuffer-setup-hook 'my-icomplete-styles)

;; tells which function is binded to which keyboard shortcut
(use-package which-key
  :commands which-key-mode
  :hook (after-init . which-key-mode)
  :custom
  (which-key-idle-delay 1)
  (which-key-idle-secondary-delay 0.25)
  (which-key-add-column-padding 1)
  (which-key-max-description-length 40))

;; Corfu enhances in-buffer completion by displaying a compact popup with
;; current candidates, positioned either below or above the point. Candidates
;; can be selected by navigating up or down.
(use-package corfu
  :custom
  ;; Disable Ispell completion function. As an alternative try `cape-dict'.
  (text-mode-ispell-word-completion nil)
  ;; Enable Corfu
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode t))

(use-package iedit
  :bind ;; for finding all in buffer and replacing them
  ("C-c f" . iedit-mode))

(use-package rainbow-delimiters
  :hook ;; colourful paranthesis
  (prog-mode . rainbow-delimiters-mode))

(use-package breadcrumb
  :config
  (breadcrumb-mode t))

(use-package rg
  :config ;; rip grep
  (rg-enable-menu))

(use-package el-fetch)
(use-package magit)

;; language server protocal + language support ;;
(defun format-before-save ()
  "Eglot will format the buffer before saving."
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'eglot-format-buffer nil t))

;; Set up the Language Server Protocol (LSP) servers using Eglot.
(use-package eglot
  :ensure nil
  :commands
  (eglot-ensure eglot-rename eglot-format-buffer)
  :hook
  (c-ts-mode . eglot-ensure)
  (c-ts-mode . format-before-save)
  (c++-ts-mode . eglot-ensure)
  (c++-ts-mode . format-before-save)
  (c-or-c++-ts-mode . eglot-ensure)
  (c-or-c++-ts-mode . format-before-save)
  (python-ts-mode . eglot-ensure)
  (python-ts-mode . format-before-save)
  :custom
  ;; read documentation in markdown
  (eglot-documentation-renderer 'markdown-ts-view-mode)
  :config
  (add-to-list 'eglot-server-programs
               '((python-ts-mode) . ("zuban" "server")))
  (add-to-list 'eglot-server-programs
               '((c++-ts-mode c-ts-mode c-or-c++-ts-mode) "clangd")))

;; language specifics ;;
(use-package markdown-ts-mode
  :ensure nil
  :defer t)
