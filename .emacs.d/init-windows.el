
(setq load-path (append '("C:/Users/unko/home/.emacs.d/lisp"
                          "C:/Users/unko/home/.emacs.d/"
                          "C:/Users/unko/home/.emacs.d/inits"
                          "C:/Users/unko/home/.emacs.d/auto-install")
                           load-path))


;; (setq anything-c-adaptive-history-file
;;       (expand-file-name "~/.emacs.d/inits/anything-c-adaptive-history-windows"))


(setq exec-path (cons "C:/ImageMagick" exec-path))
(setq exec-path (cons "C:/Python27" exec-path))
;; (setq exec-path (cons "C:/cygwin/bin" exec-path))
;; (setq exec-path (cons "C:/cmigemo" exec-path))
;; (setq exec-path (cons "C:/Ruby187/bin/ruby.exe" exec-path)) 
;; (setq exec-path (cons "C:/cygwin/bin/bash.exe" exec-path))
(setenv "PATH"
	(concat '"C:/ImageMagick:" (getenv "PATH"))
	(concat '"C:/Python27" (getenv "PATH"))
;;	(concat '"C:/cygwin/bin" (getenv "PATH"))
;;	(concat '"C:/cmigemo" (getenv "PATH"))
;;	(concat '"C:/Ruby187/bin/ruby.exe" (getenv "PATH"))
;;	(concat '"C:/cygwin/bin/bash.exe" (getenv "PATH"))
)



(set-default-font "Consolas 10")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("meiryo" . "unicode-bmp")
                  )
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  '("meiryo" . "unicode-bmp")
                  )




(require 'izonmoji-mode)
(add-hook 'w3m-mode-hook 'izonmoji-mode-on)
(add-hook 'wl-message-redisplay-hook 'izonmoji-mode-on)


(if (boundp 'window-system)
    (setq initial-frame-alist
          (append (list
                   '(width . 156) ;; �E�B���h�E��
                   '(height . 53) ;; �E�B���h�E�̍���
                   '(top . 0) ;;�\���ʒu
                   '(left . 0) ;;�\���ʒu
		   '(alpha . (0.91 0.91)) ;;����
                   )
                  initial-frame-alist)))
(transient-mark-mode 1)




(add-hook 'calendar-load-hook
          (lambda ()
            (require 'japanese-holidays)
            (setq calendar-holidays
                  (append japanese-holidays local-holidays other-holidays))))


;; howm
(setq howm-directory "~/howm/")


;; org-mode
(setq org-mobile-directory "C:/Users/unko/MobileOrg/")


;; ��{�ݒ�
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
;; migemo-dict �̃p�X���w��
(setq migemo-dictionary "C:/cmigemo/dict/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)

;; �L���b�V���@�\�𗘗p����
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1024)
;; �����̕����R�[�h���w��D
(setq migemo-coding-system 'japanese-shift-jis-unix) ;;; <= EUC�ł͂Ȃ�

(load-library "migemo")
;; �N�����ɏ��������s��
(migemo-init)
