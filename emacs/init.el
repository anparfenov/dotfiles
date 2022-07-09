(setq CONFIG_SYSTEM (expand-file-name "lisp/system" user-emacs-directory))
(setq CONFIG_LANGUAGES (expand-file-name "lisp/languages" user-emacs-directory))

(add-to-list 'load-path CONFIG_SYSTEM)
(add-to-list 'load-path CONFIG_LANGUAGES)

(require 'init-emacs)
(require 'init-theme)
(require 'init-org)
(require 'init-macos)
(require 'init-packages)
(require 'init-keymaps)
(require 'init-treesitter)
(require 'init-typescript)
(require 'init-racket)

;;==============================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(racket-mode eglot @ rjsx-mode use-package typescript-mode web-mode ## vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
