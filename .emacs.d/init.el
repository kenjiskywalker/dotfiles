(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/ee")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-install")
(add-to-list 'load-path "~/.emacs.d/lisp/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/org-mode/contrib/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/remember")
(add-to-list 'load-path "~/.emacs.d/lisp/howm")


; 言語を日本語にする
(set-language-environment       "Japanese")
; 極力UTF-8とする
(prefer-coding-system           'utf-8-unix)
(setq                           default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system  'utf-8)
(set-terminal-coding-system     'utf-8)
(set-keyboard-coding-system     'utf-8)
(set-clipboard-coding-system    'utf-8)


(cond
 ((eq window-system 'w32)
  (load "~/.emacs.d/init-windows.el"))
 ((or (eq window-system 'ns) (eq window-system 'mac))
  (load "~/.emacs.d/init-macos.el"))
 ((eq system-type 'gnu/linux)
  (load "~/.emacs.d/init-linux.el"))
)


(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

(add-hook 'diary-display-hook 'fancy-diary-display)


;; 00 一般設定
;; 10 起動前実行系
;; 20 関数定義
;; 30 追加機能系
;; 40 マイナーモード
;; 50 メジャーモード
;; 90 起動後実行系

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cfw:face-annotation ((t :foreground "RosyBrown" :inherit cfw:face-day-title)))
 '(cfw:face-day-title ((t :background "grey10")))
 '(cfw:face-default-content ((t :foreground "green2")))
 '(cfw:face-default-day ((t :weight bold :inherit cfw:face-day-title)))
 '(cfw:face-grid ((t :foreground "DarkGrey")))
 '(cfw:face-header ((t (:foreground "maroon2" :weight bold))))
 '(cfw:face-holiday ((t :background "grey10" :foreground "purple" :weight bold)))
 '(cfw:face-regions ((t :foreground "cyan")))
 '(cfw:face-saturday ((t :foreground "blue" :weight bold)))
 '(cfw:face-select ((t :background "blue4")))
 '(cfw:face-sunday ((t :foreground "red" :weight bold)))
 '(cfw:face-title ((t (:foreground "darkgoldenrod3" :weight bold :height 2.0 :inherit variable-pitch))))
 '(cfw:face-today ((t :foreground: "cyan" :weight bold)))
 '(cfw:face-today-title ((t :background "red4" :weight bold))))


(defun init-loader-re-load (re dir &optional sort)
  (let ((load-path (cons dir load-path)))
    (dolist (el (init-loader--re-load-files re dir sort))
      (condition-case e
          (let ((time (car (benchmark-run (load (file-name-sans-extension el))))))
            (init-loader-log (format "loaded %s. %s" (locate-library el) time)))
        (error
         ;; (init-loader-error-log (error-message-string e)) ；削除
         (init-loader-error-log (format "%s. %s" (locate-library el) (error-message-string e))) ;追加
         )))))


;; migemo
(defadvice save-buffers-kill-terminal (before my-save-buffers-kill-terminal activate)
  (when (process-list)
    (dolist (p (process-list))
      (set-process-query-on-exit-flag p nil))))


;; auto-save
(require 'auto-save-buffers)
(run-with-idle-timer 5 t 'auto-save-buffers)

