
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages (quote (helm-gtags doom-themes doom-modeline)))
 '(spaceline-helm-mode t)
 '(spaceline-show-default-input-method t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "~/.emacs.d/general/base-setup.el")
(load "~/.emacs.d/general/theme.el")
(load "~/.emacs.d/general/mode-line.el")
;(load "~/.emacs.d/ccpp.el")
;;; init.el ends here
