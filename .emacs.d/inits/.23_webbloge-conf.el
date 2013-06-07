(require 'weblogger)
  ;; (global-set-key "\C-cbs" 'weblogger-start-entry) ;; C-c b s とタイプすると新規作成

(global-set-key "\C-c\C-w" 'weblogger-start-entry)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-display-custom-times t)
 '(org-time-stamp-custom-formats (quote ("<%Y/%m/%d>" . "<%Y/%m/%d %H:%M>")))
 '(weblogger-config-alist (quote (("default" "http://www.13nightcrows.org/wp/xmlrpc.php" "kenji" nil "1")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(org-display-custom-times t)
;;  '(org-time-stamp-custom-formats (quote ("<%Y/%m/%d>" . "<%Y/%m/%d %H:%M>")))
;;  '(weblogger-config-alist (quote (("org-mode" "http://www.13nightcrows.org/wp/xmlrpc.php" "kenji" "nil" "1")))))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )

;; M-x weblogger-start-entry もしくは C-c C-w で編集画面を表示して編集する。

;; C-c C-d ： ローカルにドラフトを保存
;; C-c C-c ： 下書きモードで送信
;; C-x C-s ： 公開モードで送信
;; C-c C-n ： 記事移動（進む）
;; C-c C-p ：　記事移動（戻る）



