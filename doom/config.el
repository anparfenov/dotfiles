;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andrey Parfenov"
      user-mail-address "asleeppiano@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
(setq font-family "Inconsolata")
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family font-family :size 14)
      doom-variable-pitch-font (font-spec :family font-family :size 14)
      doom-unicode-font (font-spec :family font-family :size 14)
      doom-big-font (font-spec :family font-family :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-flatwhite)
;; (setq doom-theme 'tsdh-light)
;; (setq doom-theme 'doom-horizon)
;; (setq doom-theme 'doom-homage-white)
;; (setq doom-theme 'doom-monokai-pro)
;; (setq doom-theme 'flatui)
;; (setq doom-theme 'avk-daylight)
(setq doom-theme 'eclipse)
;; (setq doom-theme 'humanoid-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")
(setq org-agenda-files '("~/Documents/org/my_2022.org" "~/Documents/org/koshelek-work_2022.org"))
;; maybe i should move these 2 lines to arfer! org
(setq org-log-done 'time)
(setq org-log-reschedule 'note)
(setq org-log-note-clock-out nil)

(customize-set-variable 'org-global-properties
                        '(("Effort_ALL" . "1h 2h 4h 6h 8h 10h 12h 14h 16h 20h 24h 28h 32h")))
(customize-set-variable 'org-default-format
                        '(("%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM")))
(after! org
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "PROJ(p@)" "IN-PROGRESS(n)" "IDEA(i@)" "READING(r)" "|" "DONE(d@)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "MEETING(m)" "|" "CANCELLED(c@/!)")
                (sequence "REPORT(w@/!)" "BUG(b@/!)" "|" "FIXED(c@/!)"))))

  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("IN-PROGRESS" :foreground "blue" :weight bold)
                ("PROJ" :foreground "mediumvioletred" :weight bold)
                ("READING" :foreground "crimson" :weight bold)
                ("IDEA" :foreground "cornflowerblue" :weight bold)
                ("DONE" :foreground "green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "black" :weight bold)
                ("MEETING" :foreground "lime" :weight bold))))

  (setq org-log-into-drawer "LOGBOOK")

  (setq org-tag-alist '(("urgent" . ?u) ("habit" . ?h)))

  (setq org-default-notes-file (concat org-directory "capture-notes.org"))

  (setq org-track-ordered-property-with-tag t)

  (setq org-clock-into-drawer "CLOCKING")

  (setq org-capture-templates
        '(("t" "Tasks")
          ("tt" "Task" entry (file+headline (concat org-directory "capture-notes.org"))
           ("* TODO %?\n %i\n %a"))))
  )

;; Use a function to decide what to change the state to.
(setq org-clock-in-switch-to-state #'ap/switch-task-on-clock-start)
(setq org-clock-out-switch-to-state #'ap/switch-task-on-clock-end)

(defun ap/switch-task-on-clock-start (task-state)
  "Change a task to 'IN-PROGRESS' when TASK-STATE is 'TODO'."
  (if (string= task-state "TODO")
      "IN-PROGRESS"
    task-state))

(defun ap/switch-task-on-clock-end (task-state)
  "Change a task to 'TODO' when TASK-STATE is 'IN-PROGRESS'."
  (if (string= task-state "IN-PROGRESS")
      "TODO"
    task-state))

;; TODO
;; (defun ap/insert-date-from-calendar ()
;;   (interactive)
;;   (calendar)
;;   ((read-string "Enter date: "))
;;   (let ((d (org-date-from-calendar)))
;;     (message d)))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(map! "\C-s" 'save-buffer)
;; replaces isearch-forward in default binding
(map! "\C-h" 'delete-backward-char)
;; opens allacritty on new window in current folder
(map! "C-S-m"
      (lambda () (interactive) (start-process
                                "terminal"
                                "terminal-buff"
                                "alacritty" "--working-directory"
                                (if (eq (projectile-project-root) nil)
                                    (file-name-directory buffer-file-name)
                                  (projectile-project-root)))))

;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; Insert marker at point
(define-key evil-insert-state-map (kbd "M-d") 'evil-multiedit-toggle-marker-here)

;; Same as M-d but in reverse.
(define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

;; OPTIONAL: If you prefer to grab symbols rather than words, use
;; `evil-multiedit-match-symbol-and-next` (or prev).

;; Restore the last group of multiedit regions.
(define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

;; RET will toggle the region under the cursor
;; (define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ...and in visual mode, RET will disable all fields outside the selected region
(define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

(define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

(map! :leader
      :desc "find org mode files"
      "f o" (lambda () (interactive) (counsel-find-file "~/Documents/org")))

;; For moving between edit regions
;; (define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
;; (define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; dtrt-indent-mode rewrites these settings
(setq-default tab-width 4)
(setq standard-indent tab-width);
(setq-default indent-tabs-mode nil)
(setq-default evil-shift-width tab-width)
(setq js-indent-level tab-width)
(setq js2-proper-indentation tab-width)
(setq js2-jsx-indent-line tab-width)
(setq js2-indent-line tab-width)
(setq js2-indent-line tab-width)
(setq typescript-indent-level tab-width)
(setq web-mode-code-indent-offset tab-width)
(setq web-mode-css-indent-offset tab-width)
(setq web-mode-markup-indent-offset tab-width)

(add-to-list 'auto-mode-alist '("\\.component.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.njk\\'" . web-mode))

(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(use-package! caddyfile-mode
  :mode (("Caddyfile\\'" . caddyfile-mode)
         ("caddy\\.conf\\'" . caddyfile-mode)))

(map! :desc "emmet-expand"
      :n "C-y" 'emmet-expand-yas
      :i "C-y" 'emmet-expand-yas)

;; (use-package vue-mode
;;   :mode "\\.vue\\'"
;;   :config
;;   (add-hook 'vue-mode-hook #'lsp))


(setq lsp-ui-sideline-show-code-actions nil)

;; underscore as word
(modify-syntax-entry ?_ "w")
(setq evil-symbol-word-search t)

(map! :desc "expand region"
      "M-=" 'er/expand-region)

(use-package! zig-mode
  :hook ((zig-mode . lsp-deferred))
  :custom (zig-format-on-save nil)
  :config
  (after! lsp-mode
    (add-to-list 'lsp-language-id-configuration '(zig-mode . "zig"))
    (lsp-register-client
      (make-lsp-client
        :new-connection (lsp-stdio-connection (concat (getenv "HOME") "/Programs/zls/zig-out/bin/zig"))
        :major-modes '(zig-mode)
        :server-id 'zls))))
