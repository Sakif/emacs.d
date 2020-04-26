
;;; code:
(require 'package)
(add-to-list 'package-archives '("MELPA" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

(unless (package-installed-p 'use-package) (package-install 'use-package))
(unless (package-installed-p 'company) (package-install 'company))
(unless (package-installed-p 'flycheck) (package-install 'flycheck))
(unless (package-installed-p 'doom-modeline) (package-install 'doom-modeline))
(unless (package-installed-p 'doom-themes) (package-install 'doom-themes))
;;; install.el ends here
