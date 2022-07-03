;; MacOs config

(global-unset-key (kbd "s-w")) ;; unsets macos window close
(setq ns-function-modifier 'hyper)

(defun ap/swap-meta-and-super ()
  "Swap the mapping of Meta and Super.
Very useful for people using their Mac with a
Windows external keyboard from time to time."
  (interactive)
  (progn
        (setq mac-command-modifier 'meta)
        (setq mac-option-modifier 'super)
        (message "Command is now bound to META and Option is bound to SUPER.")))

(ap/swap-meta-and-super)

;; Enable emoji, and stop the UI from freezing when trying to display them.
(when (fboundp 'set-fontset-font)
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

(provide 'init-macos)
