(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-raise-tool-bar-buttons t t)
 '(auto-resize-tool-bars t t)
 '(calendar-week-start-day 1)
  ;; '(case-fold-search t)
 '(org-agenda-files (quote ("~/org/todo.org" )))
;; '(org-agenda-files (quote ("~/org/gtd.org" "~/org/someday.org" )))
;; '(org-agenda-files (quote ("~/org/gtd.org" "~/org/notes.org" "~/org/someday.org")))
;; '(org-agenda-files (list org-directory))
 '(org-agenda-ndays 7)
 '(org-agenda-repeating-timestamp-show-all nil)
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-todo-ignore-deadlines t)
 '(org-agenda-todo-ignore-scheduled t)
 '(org-agenda-todo-ignore-with-date t)
 '(org-agenda-window-setup (quote other-window))
 '(org-fast-tag-selection-single-key nil)
 '(org-reverse-note-order nil)
 '(org-log-done t)
 '(org-agenda-include-diary nil)
 '(org-deadline-warning-days 7)
  ;; '(setq org-timeline-show-empty-dates t)
)


;; These lines only if org-mode is not part of the X/Emacs distribution.
(autoload 'org-mode "org" "Org mode" t)
(autoload 'org-diary "org" "Diary entries from Org mode")
(autoload 'org-agenda "org" "Multi-file agenda from Org mode" t)
(autoload 'org-store-link "org" "Store a link to the current location" t)
(autoload 'orgtbl-mode "org" "Org tables as a minor mode" t)
(autoload 'turn-on-orgtbl "org" "Org tables as a minor mode")

;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


(require 'org-install)
;; (require 'org-babel-init)
(require 'org-habit)


(setq org-directory "~/org/")
(setq org-default-notes-file "~/org/notes.org")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)

;;org-remember
(org-remember-insinuate)

(autoload 'remember "remember" nil t)
(autoload 'remember-region "remember" nil t)


(setq org-agenda-exporter-settings
      '((ps-number-of-columns 1)
        (ps-landscape-mode t)
        (htmlize-output-type 'css)))

(setq org-agenda-custom-commands
'(
  ("h" "TOD and YOTEI Lists"
   ((agenda)
    (tags-todo "YOTEI")
    (tags-todo "TODO")
    ))

  ("d" "Daily Action List"
   (
    (agenda "" ((org-agenda-ndays 1)
		(org-agenda-sorting-strategy
		 (quote ((agenda time-up priority-down tag-up) )))
		(org-deadline-warning-days 0)
		))))))

(setq org-todo-keywords '((list "TODO" "WAIT" "YOTEI" "SOMEDAY" "DONE")))
;; (setq org-todo-keywords '((type "TODO" "WAIT" "DONE" "|" "YOTEI" "SOMEDAY")))

(add-hook 'org-agenda-mode-hook 'hl-line-mode)
(require 'calendar)
(setq  number-of-diary-entries 31)
(define-key calendar-mode-map "f" 'calendar-forward-day)
(define-key calendar-mode-map "n" 'calendar-forward-day)
(define-key calendar-mode-map "b" 'calendar-backward-day)
(setq mark-holidays-in-calendar t)
;; (install-elisp "http://www.meadowy.org/meadow/netinstall/export/799/branches/3.00/pkginfo/japanese-holidays/japanese-holidays.el")
(require 'japanese-holidays)
(setq calendar-holidays
      (append japanese-holidays local-holidays other-holidays))
(setq calendar-weekend-marker 'diary)
;; 月曜から表示
(setq calendar-week-start-day 1)

(add-hook 'today-visible-calendar-hook 'calendar-mark-weekend)
(add-hook 'today-invisible-calendar-hook 'calendar-mark-weekend)


(setq org-hide-leading-stars t)


;; C-c g gtd.org assing
(defun gtd ()
    (interactive)
    (find-file "~/org/todo.org"))
(global-set-key (kbd "C-c g") 'gtd)

;; for MobileOrg
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files
      (list "~/org/todo.org"
            ))
(setq org-mobile-inbox-for-pull "~/org/todo.org")
(setq org-refile-targets '((org-agenda-files :level . 1)))

