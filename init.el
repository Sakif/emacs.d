
;;; Code:

(global-visual-line-mode)
(show-paren-mode)
(column-number-mode)

(load "~/.emacs.d/general/install.el")
(load "~/.emacs.d/general/base-setup.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(airline-cursor-colors t)
 '(airline-display-directory (quote airline-directory-shortened))
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode (display-graphic-p))
 '(package-selected-packages
   (quote
    (helm-projectile use-package doom-themes doom-modeline))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
