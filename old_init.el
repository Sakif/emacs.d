(use-package gdscript-mode
  :hook
  (gdscript-mode . eglot-ensure)
  :custom
  (gdscript-use-tab-indents t)
  (gdscript-godot-executable "/home/z/Unity/godot/bin/godot.linuxbsd.editor.x86_64")
  (gdscript-gdformat-save-and-format t))

(use-package iedit
  :bind ;; for finding all in buffer and replacing them
  ("C-c f" . iedit-mode))

(use-package breadcrumb
  :config
  (breadcrumb-mode t))
