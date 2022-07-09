(load-theme 'tsdh-light)

; set default font
(cond
 ((string-equal system-type "windows-nt")
  (when (member "Consolas" (font-family-list))
    (set-frame-font "Consolas" t t)))
 ((string-equal system-type "darwin")
  (when (member "Menlo" (font-family-list))
    (set-frame-font "Menlo" t t)))
 ((string-equal system-type "gnu/linux")
  (when (member "JetBrains Mono" (font-family-list))
    (set-frame-font "JetBrains Mono-12" t t))))

(provide 'init-theme)
