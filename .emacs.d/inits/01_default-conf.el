
;; スクロールの設定
;; -----------------------------------------------------------
(setq scroll-step 1)
;; -----------------------------------------------------------

;; 時間の表示
;; -----------------------------------------------------------
(setq display-time-string-forms
'((format "%s/%s/%s(%s) %s:%s"
year month day
dayname
24-hours minutes)))
(display-time)
(setq display-time-24hr-format t)
;; -----------------------------------------------------------


;; キーマップの設定
;; -----------------------------------------------------------
(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(define-key global-map "\M-?" 'help-for-help)        ; ヘルプ
(define-key global-map "\C-z" 'undo)                 ; undo
(define-key global-map "\C-h"  'backward-delete-char)
(define-key global-map "\C-t"  'next-multiframe-window)
;; -----------------------------------------------------------




;; cua-modeの使用
;; -----------------------------------------------------------
(cua-mode t)
(setq cua-enable-cua-keys nil)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
;; (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
;; -----------------------------------------------------------


;; -----------------------------------------------------------
;; ミニバッファ履歴リストの最大長：tなら無限
;; -----------------------------------------------------------
(setq history-length t)
;; session.el
;;   kill-ringやミニバッファで過去に開いたファイルなどの履歴を保存する
(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus places)
        session-globals-include '((kill-ring 20)
                                  (session-file-alist 30 t)
                                  (file-name-history 20)))
  (add-hook 'after-init-hook 'session-initialize)
  ;; 前回閉じたときの位置にカーソルを復帰
  (setq session-undo-check -1))
;; minibuf-isearch
;;   minibufでisearchを使えるようにする
(require 'minibuf-isearch nil t)
;; -----------------------------------------------------------

;; -----------------------------------------------------------
;; undoの制限を増やす
;; -----------------------------------------------------------
(setq undo-limit 100000)
(setq undo-strong-limit 130000)
;; -----------------------------------------------------------

;; -----------------------------------------------------------
;; auto-completeの使用
;; -----------------------------------------------------------
;; (require 'auto-complete)
;; (global-auto-complete-mode t)
;; -----------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
(ac-config-default)

(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
(define-key ac-menu-map (kbd "M-TAB") nil)


;; -----------------------------------------------------------
;; 誤って終了しないようにする設定
;; -----------------------------------------------------------
;; ref: http://blog.livedoor.jp/techblog/archives/64599359.html
;; (defadvice save-buffers-kill-emacs
;;   (before safe-save-buffers-kill-emacs activate)
;;  "safe-save-buffers-kill-emacs"
;;  (unless (y-or-n-p "Really exit emacs? ")
;;    (keyboard-quit)))
;; (setq confirm-kill-emacs 'yes-or-no-p)
;; -----------------------------------------------------------


 

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

(blink-cursor-mode t)
