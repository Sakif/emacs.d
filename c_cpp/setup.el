
;;; code:
(unless (package-installed-p 'flycheck-irony) (package-install 'flycheck-irony))
(require 'irony)
(use-package irony
  :init (load "~/.emacs.d/c_cpp/clang-format.el")
  :hook
  ((c++-mode . irony-mode)
   (c-mode . irony-mode)
   (irony-mode . irony-cdb-autosetup-compile-options))
  :config
  (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  (add-hook 'before-save-hook 'clang-format-buffer))
;;; setup ends here

