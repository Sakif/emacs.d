;;; package --- Summary
;;; Commentary:
;; To cut the text, press C-w.
;; To copy the text, press M-w.
;; To paste the text, press C-y.
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; get use-package
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(use-package use-package
	:init
	(menu-bar-mode -1) ; no menubar
	(global-visual-line-mode) ; warping
	(column-number-mode) ; shoes the column number
	(add-hook 'before-save-hook 'whitespace-cleanup) ; clean up white space before save
	(global-auto-revert-mode t) ; automatically reloads buffer if changes made outside of Emacs
	(setq-default tab-width 2) ; set tab size
	(fset 'yes-or-no-p 'y-or-n-p)
	(setq inhibit-startup-message t ; no start up message
				user-full-name "Sakif Fahmid Zaman" ; who am I?
				user-mail-address "smfzaman@gmail.com")
	:custom
	(use-package-always-ensure t))

(use-package doom-themes
	:config
	(load-theme 'doom-one t))

(use-package doom-modeline
	;; better mode line
	:custom
	(doom-modeline-buffer-file-name-style 'file-name)
	(doom-modeline-minor-modes (featurep 'minions))
	(doom-modeline-display-default-persp-name t)
	(doom-modeline-unicode-fallback nil)
	(doom-modeline-github t)
	(doom-modeline-project-detection 'project)
	(doom-modeline-icon (display-graphic-p))
	(doom-modeline-indent-info t)
	:init (doom-modeline-mode 1))

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
	;; set prijectile home directory
	(when (file-directory-p "~/code")
		(setq projectile-project-search-path '("~/code")))
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
	(("M-x" . helm-M-x)
	 ("C-x b" . helm-mini)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x C-f" . helm-find-files)))

;; ripgrep search
(use-package helm-rg)
(use-package projectile-ripgrep)

(use-package format-all
	;; formating document before saving
	:hook
	(before-save . format-all-buffer))

(use-package company
	;; code compleation framework
	:config
	(global-company-mode)
	:custom
	((company-idle-delay 0)
	 (company-minimum-prefix-length 1))
	:bind
	("M-/" . company-complete-common-or-cycle))

(use-package yasnippet
	;; code snippet extension
	:config
	(yas-global-mode 1))

(use-package flycheck
	;; on-the-fly syntax checking
	:config
	(global-flycheck-mode))

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

(use-package markdown-mode
	:init
	(setq markdown-command "multimarkdown")
	:mode
	(("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode)))

(use-package rust-mode)

(use-package eglot
	;; language server
	;;; Commentary:
	;; "C-h ." display-local-help
	;; renaming symbol at point with eglot: eglot-rename
	;; find defination default: "M-." xref-find-definitions
	;; eglot-find-declaration
	;; eglot-find-implementation
	;; eglot-find-typeDefinition
	:hook
	((c-mode . eglot-ensure)
	 (rust-mode . eglot-ensure)
	 (c++-mode . eglot-ensure)
	 (python-mode . eglot-ensure))
	:config
	;; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
	(setq eglot-ignored-server-capabilites (quote (:documentHighlightProvider))))


;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(rust-mode zerodark-theme yasnippet which-key use-package smartparens rainbow-delimiters projectile-ripgrep markdown-mode iedit helm-rg helm-projectile format-all flycheck eglot doom-themes doom-modeline company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
