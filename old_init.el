(add-to-list 'package-archives ;; adding melpa to package archives
             '("melpa" . "https://stable.melpa.org/packages/") t)

(use-package company
  :config ; code compleation framework
  (global-company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :bind
  ("M-/" . company-complete-common-or-cycle))

;; automatically update package once a week
(use-package auto-package-update
  :init
  (auto-package-update-maybe)
  :custom
  (auto-package-update-delete-old-versions t))

(use-package doom-themes
  :config ; theme
  (load-theme 'doom-acario-dark t)
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
  :hook
  (after-init . doom-modeline-mode))

(use-package rg
  :init ; rip grep
  (rg-enable-default-bindings))

(use-package el-fetch)

(use-package gdscript-mode
  :hook
  (gdscript-mode . eglot-ensure)
  :custom
  (gdscript-use-tab-indents t)
  (gdscript-godot-executable "/home/z/.local/share/Steam/steamapps/common/apps/Godot_v4.4-beta1_linux.x86_64")
  (gdscript-gdformat-save-and-format t))
