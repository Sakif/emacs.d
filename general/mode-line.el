
;;; code:
(unless (package-installed-p 'doom-modeline) (package-install 'doom-modeline))
(require 'doom-modeline)
(use-package doom-modeline
  :config
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-buffer-modification-icon t)
  (setq doom-modeline-minor-modes (featurep 'minions))
  (setq doom-modeline-display-default-persp-name t)
  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-github t)
;  (setq doom-modeline-icon t)
;  (setq doom-modeline-indent-info t)
;  (setq doom-modeline-minor-modes t)
;  (setq doom-modeline-unicode-fallback t)
  :hook (after-init . doom-modeline-mode))
;;; mode-line.el ends here
