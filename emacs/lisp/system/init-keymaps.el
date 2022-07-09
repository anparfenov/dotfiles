(global-set-key (kbd "C-x M-o") (lambda () (interactive) (find-file (concat (getenv "HOME") "/.config/emacs"))))
(global-set-key (kbd "C-x M-r") 'query-replace-regexp)
(global-set-key
 (kbd "C-x M-m")
 (lambda ()
   (interactive)
   (cond ((eq system-type 'darwin) (find-file (concat (getenv "HOME") "/MyDocs/org")))
	 ((eq system-type 'gnu/linux) (find-file (concat (getenv "HOME") "/Documents/org"))))))

(provide 'init-keymaps)
