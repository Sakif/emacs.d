(use-package company
  :config ; code compleation framework
  (global-company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :bind
  ("M-/" . company-complete-common-or-cycle))

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

(use-package gdscript-mode
  :hook
  (gdscript-mode . eglot-ensure)
  :custom
  (gdscript-use-tab-indents t)
  (gdscript-godot-executable "/home/z/.local/share/Steam/steamapps/common/apps/Godot_v4.4-beta1_linux.x86_64")
  (gdscript-gdformat-save-and-format t))

(use-package corfu-terminal
  :init
  (corfu-terminal-mode +1)
  (global-corfu-mode))
