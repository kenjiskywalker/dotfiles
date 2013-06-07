(setq howm-menu-lang 'ja)
(setq howm-directory "~/howm/")
(require 'howm-mode)

(require 'org)
(add-hook 'org-mode-hook 'howm-mode)
(add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))
(setq howm-view-title-header "*") ;; ← howm のロードより前に書くこと

;; キー割当の重複を避ける (お好みで)
;; (setq howm-prefix "\C-z") ;; howm のキーを「C-c , □」から「C-z □」に変更

(global-set-key "\C-c,," 'howm-menu)
(autoload 'howm-menu "howm-mode" "Hitori Otegaru Wiki Modoki" t)

(eval-after-load "howm-menu"
  '(progn
    (require 'calfw-howm)
    (cfw:install-howm-schedules)
    (define-key howm-mode-map (kbd "M-C") 'cfw:open-howm-calendar)
))

(setq howm-todo-menu-types "[-+~!]")

