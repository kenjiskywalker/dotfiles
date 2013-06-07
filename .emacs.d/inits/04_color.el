
(add-to-list 'load-path "~/.emacs.d/lisp/color-theme-6.6.0")
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-fischmeister)))

;; color theme
(require 'color-theme nil t)
(color-theme-initialize)
;(color-theme-midnight)
(color-theme-charcoal-black)
;; (set-face-background 'region "blue4")
;; (set-face-background 'trailing-whitespace "purple4")
;; (set-face-background 'modeline-buffer-id "grey5")
;; (set-face-foreground 'modeline-buffer-id "maroon2")
;; (set-face-background 'mode-line "grey20")
;; (set-face-foreground 'mode-line "grey75")
;; (set-face-background 'mode-line-inactive "grey3")
;; (set-face-foreground 'mode-line-inactive "grey35")
;; (set-face-background 'secondary-selection "red")
;; (set-face-underline-p 'modeline nil)
;; (custom-set-faces
;;  '(font-lock-comment-face ((t (:italic nil :foreground "slate gray")))))

(set-background-color "#737373")

;====================================
;;全角スペースとかに色を付ける
;====================================
;; (defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
;; (defface my-face-b-1 '((t (:background "dark turquoise"))) nil)
;; (defface my-face-b-2 '((t (:background "cyan"))) nil)
;; (defface my-face-b-2 '((t (:background "SeaGreen"))) nil)
;; (defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
;; (defvar my-face-b-1 'my-face-b-1)
;; (defvar my-face-b-2 'my-face-b-2)
;; (defvar my-face-u-1 'my-face-u-1)
;; (defadvice font-lock-mode (before my-font-lock-mode ())
;; (font-lock-add-keywords
;; major-mode
;; '(
;; ("　" 0 my-face-b-1 append)
;; ("\t" 0 my-face-b-2 append)
;; ("[ ]+$" 0 my-face-u-1 append)
;; )))
;; (ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
;; (ad-activate 'font-lock-mode)
;; (add-hook 'find-file-hooks '(lambda ()
;; (if font-lock-mode
;; nil
;; (font-lock-mode t))))

;; 対応する括弧をハイライト関係
(show-paren-mode t)
(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "gray10")
(set-face-foreground 'show-paren-match-face "SkyBlue")


;; hllineの設定
(defface hlline-face
  '((((class color)
      (background dark))
     ;;(:background "dark state gray"))
     (:background "gray10"
	000000	  :underline "gray32"))
    (((class color)
      (background light))
     (:background "ForestGreen"
		  :underline nil))
    (t ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
;;(setq hl-line-face 'underline)
(global-hl-line-mode)

;;--------------------------------------------------
;; region の色
;;--------------------------------------------------
;; (setq transient-mark-mode t)
;; (set-face-background 'region "blue")
;; (set-face-foreground 'region "#FFFF00")
