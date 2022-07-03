(global-set-key (kbd "C-x M-o") (lambda () (interactive) (find-file (concat (getenv "HOME") "/.config/emacs"))))

(global-set-key (kbd "C-x M-r") 'query-replace-regexp)

(global-set-key (kbd "C-x M-m") (lambda () (interactive) (find-file (concat (getenv "HOME") "/MyDocs/org"))))

(provide 'init-keymaps)
