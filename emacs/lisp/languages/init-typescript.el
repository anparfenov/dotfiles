(use-package typescript-mode
  :ensure t
  :mode ("\\.ts\\'" ("\\.tsx\\'" . typescriptreact-mode))
  :after (tree-sitter)
  :hook
  ((typescript-mode js-mode typescriptreact-mode) . eglot-ensure)
  :config
  (define-derived-mode typescriptreact-mode typescript-mode
    "Typescript JSX")

  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescriptreact-mode))
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescriptreact-mode . tsx)))

(if (functionp 'json-serialize)
  (message "Native JSON is available")
(message "Native JSON is *not* available"))

(provide 'init-typescript)
