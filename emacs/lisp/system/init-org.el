(setq org-agenda-files '("~/MyDocs/org/agenda.org"))
(setq org-startup-folded t)
(setq org-log-into-drawer t)
(setq org-clock-into-drawer "CLOCKING")
(setq org-log-done 'time)
(setq org-log-reschedule 'note)

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . "yellow")
        ("CANCELED" . (:foreground "blue" :weight bold))))

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(p)" "|" "DONE(d@)")
	(sequence "HOLD(h)" "|" "CANCELED(c@)")))

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

(provide 'init-org)
