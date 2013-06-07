(setenv "PATH"
        (concat "/opt/local/bin:"
                "/opt/local/sbin:"
                "/usr/local/bin:"
                "/usr/bin:"
                (getenv "PATH")))

;; ウィンドウの設定
(setq initial-frame-alist
      (append (list
               '(left . 10) ;;表示位置
               '(width . 180) ;; ウィンドウ幅
               '(height . 50) ;; ウィンドウの高さ
	       '(alpha . (0.80 0.80)) ;;透過
               '(top . 20) ;;表示位置
               )
              initial-frame-alist))

;; (setq frame-title-format (format "%%f - GNU/Linux@%s" (system-name)))
(setq frame-title-format "Hello GNU Emacs")

(setq anything-c-adaptive-history-file
      (expand-file-name "~/.emacs.d/inits/anything-c-adaptive-history-linux"))


;; 外観
(display-time)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq line-number-mode t)
(setq column-number-mode t)
(setq visible-bell t)

;; (require 'evernote-mode)
;; (global-set-key "\C-cec" 'evernote-create-note)
;; (global-set-key "\C-ceo" 'evernote-open-note)
;; (global-set-key "\C-ces" 'evernote-search-notes)
;; (global-set-key "\C-ceS" 'evernote-do-saved-search)
;; (global-set-key "\C-cew" 'evernote-write-note)


;; howm
(setq howm-directory "~/Dropbox/home/howm/")