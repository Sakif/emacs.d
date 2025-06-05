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

(use-package gdscript-mode
  :hook
  (gdscript-mode . eglot-ensure)
  :custom
  (gdscript-use-tab-indents t)
  (gdscript-godot-executable "/home/z/.local/share/Steam/steamapps/common/apps/Godot_v4.4-beta1_linux.x86_64")
  (gdscript-gdformat-save-and-format t))
