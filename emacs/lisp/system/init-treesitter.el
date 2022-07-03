(use-package tree-sitter
  :ensure t
  :hook
  (typescript-mode . tree-sitter-mode)
  (typescript-mode . tree-sitter-hl-mode)
  (typescriptreact-mode .tree-sitter-mode)
  (typescriptreact-mode . tree-sitter-hl-mode)
  (js-mode . tree-sitter-mode))

(provide 'init-treesitter)
