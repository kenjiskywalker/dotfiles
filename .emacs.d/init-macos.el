(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH"
        (concat '"/bin:"
		"/usr/bin:"
		"/usr/local/bin:"
                "/Developer/usr/bin:"
                "/usr/local/Cellar/imagemagick/6.7.5-7/bin:"
		(getenv "PATH")))

;; ウィンドウの設定
(setq initial-frame-alist
      (append (list
               '(left . 5) ;;表示位置
               '(width . 190) ;; ウィンドウ幅
               '(height . 57) ;; ウィンドウの高さ
               '(top . 20) ;;表示位置
;;               '(alpha . (0.85 0.85)) ;;透過
               )
              initial-frame-alist))

;; (setq frame-title-format (format "%%f - Emacs" (system-name)))
(setq frame-title-format "%b")

(setq mac-command-key-is-meta t)

(set-default-coding-systems 'utf-8)

(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq anything-c-adaptive-history-file
      (expand-file-name "~/.emacs.d/inits/anything-c-adaptive-history-mac"))

;; Command-Key and Option-Key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))



;; migemo
(require 'migemo)
(setq migemo-command "/usr/local/bin/cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)


;; Fonts
(let* ((size 14)
       (asciifont "Ricty")
       (jpfont "Ricty")
       (h (* size 10))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont)))
  (set-face-attribute 'default nil :family asciifont :height h)
  (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
  (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
  (set-fontset-font nil '(#x0080 . #x024F) fontspec) 
  (set-fontset-font nil '(#x0370 . #x03FF) fontspec))


(setq default-input-method "MacOSX")
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "漢")
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `cursor-type `box)
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `cursor-color "magenta")


;; ;; growl
;; (setq growl-program "/usr/local/bin/growlnotify")
;; (defun growl (title message &optional app)
;;   (start-process "Growl" "*Growl*" growl-program
;;                  "-t" title
;;                  "-m" message
;;                  "-a" app))


;; howm
(setq howm-directory "~/Dropbox/home/howm/")

(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)


;; growl
(setq growl-program "/usr/local/bin/growlnotify")
(add-hook 'twittering-new-tweets-hook
          '(lambda ()
             (when (eq (car twittering-new-tweets-spec) 'replies)
               (dolist (el twittering-new-tweets-statuses)
                 (start-process "twittering-notify" nil growl-program
                                "-t" (format "@%s" (cdr (assoc 'user-screen-name el)))
                                "-m" (format "%s" (cdr (assoc 'text el)))
                                )))))

;; mew
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))


;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)



;; quickrun
(require 'quickrun)
(push '("*quickrun*") popwin:special-display-config)


(defun my-quickrun-output-fix ()
  (interactive)
  (quickrun)
  (sit-for 0.5)
  (beginning-of-buffer)
  (sit-for 0.5)
  (end-of-buffer)
  )
(global-set-key (kbd "C-\\") 'my-quickrun-output-fix)



;; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))


;; Window move Shift + cursol key
(windmove-default-keybindings)

;;; for popwin
;; (require 'popwin)


(require 'tramp)
        (setq tramp-default-method "ssh")



;; YASnippet

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
