
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
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages
   (quote
    (helm-gtags helm-projectile use-package elpy doom-themes doom-modeline))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package helm-projectile
  :init
  (global-unset-key (kbd "C-x c"))
  (setq helm-autoresize-max-height 50)
  (setq helm-autoresize-min-height 30)
  (setq helm-autoresize-mode t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-ff-file-name-history-use-recentf t)
  (setq helm-ff-search-library-in-sexp t)
  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-scroll-amount 8)
  (setq helm-split-window-inside-p t)
  :config
  (setq helm-mode t)
  (helm-projectile-on)
  (projectile-mode +1)
  :bind
  (("M-x" . helm-M-x)
   ("C-x b" . helm-mini)
   ("M-y" . helm-show-kill-ring)
   ("C-x C-f" . helm-find-files)))

;;; init.el ends here
