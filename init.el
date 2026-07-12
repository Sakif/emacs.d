(native-comp-available-p)
(require 'package)
(add-to-list 'package-archives ;; adding melpa to package archives
             '("melpa" . "https://stable.melpa.org/packages/") t)

;; get use-package if not already installed ;;
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; A quick primer on the `use-package' function (refer to "C-h f use-package" for the full details).
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
   'default t :font "JetBrains Mono" :height 130)
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
  ;; (compile-command "./compile.sh") ; compile command
  (warning-suppress-types '((comp)))
  (use-package-always-ensure t)) ; if package is not installed install it

;; This automates the process of updating installed packages
(use-package auto-package-update
  :custom
  ;; Set the number of days between automatic updates.
  ;; Here, packages will only be updated if at least 7 days have passed
  ;; since the last successful update.
  (auto-package-update-interval 7)
  ;; Suppress display of the *auto-package-update results* buffer after updates.
  ;; This keeps the user interface clean and avoids unnecessary interruptions.
  (auto-package-update-hide-results t)
  ;; Automatically delete old package versions after updates to reduce disk
  ;; usage and keep the package directory clean. This prevents the accumulation
  ;; of outdated files in Emacs's package directory, which consume
  ;; unnecessary disk space over time.
  (auto-package-update-delete-old-versions t)
  ;; Uncomment the following line to enable a confirmation prompt
  ;; before applying updates. This can be useful if you want manual control.
  ;; (auto-package-update-prompt-before-update t)
  :config
  ;; Run package updates automatically at startup, but only if the configured
  ;; interval has elapsed.
  (auto-package-update-maybe))

(use-package which-key ; tells which function is binded to which keyboard shortcut
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
(use-package corfu-terminal
  :commands
  (corfu-mode global-corfu-mode)
  :hook
  ((prog-mode . corfu-mode)
   (shell-mode . corfu-mode)
   (eshell-mode . corfu-mode))
  :custom
  ;; Hide commands in M-x which do not apply to the current mode.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Disable Ispell completion function. As an alternative try `cape-dict'.
  (text-mode-ispell-word-completion nil)
  (tab-always-indent 'complete)
  ;; Enable Corfu
  :config
  (global-corfu-mode))
(unless (display-graphic-p)
  (corfu-terminal-mode +1))

;; Cape, or Completion At Point Extensions, extends the capabilities of
;; in-buffer completion. It integrates with Corfu or the default completion UI,
;; by providing additional backends through completion-at-point-functions.
(use-package cape
  :commands
  (cape-dabbrev cape-file cape-elisp-block)
  :bind
  ("C-c p" . cape-prefix-map)
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

;; Vertico provides a vertical completion interface, making it easier to
;; navigate and select from completion candidates (e.g., when `M-x` is pressed).
(use-package vertico
  ;; (Note: It is recommended to also enable the savehist package.)
  :config
  (vertico-mode))

;; Vertico leverages Orderless' flexible matching capabilities, allowing users
;; to input multiple patterns separated by spaces, which Orderless then
;; matches in any order against the candidates.
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Marginalia allows Embark to offer you preconfigured actions in more contexts.
;; In addition to that, Marginalia also enhances Vertico by adding rich
;; annotations to the completion candidates displayed in Vertico's interface.
(use-package marginalia
  :commands
  (marginalia-mode marginalia-cycle)
  :hook
  (after-init . marginalia-mode))

(use-package iedit
  :bind ; for finding all in buffer and replacing them
  ("C-c f" . iedit-mode))

(use-package rainbow-delimiters
  :hook ; colourful paranthesis
  (prog-mode . rainbow-delimiters-mode))

(use-package rg
  :init ; rip grep
  (rg-enable-menu))

(use-package doom-modeline
  :custom ; better mode line
  (doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-minor-modes (featurep 'minions))
  (doom-modeline-display-default-persp-name t)
  (doom-modeline-project-detection 'project)
  (doom-modeline-indent-info t)
  (doom-modeline-icon nil)
  :hook
  (after-init . doom-modeline-mode))

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
  :commands
  (eglot-ensure
   eglot-rename
   eglot-format-buffer)
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
