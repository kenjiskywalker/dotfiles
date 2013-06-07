
;; かるふわの設定
;; http://d.hatena.ne.jp/kiwanami/20110107/1294404952
(require 'calfw)

;; Emacs22用の設定
;; Emacs23から関数名が変わったのでエイリアスを設定する
;; (unless (fboundp 'calendar-extract-day)
;;   (defalias 'calendar-extract-day (symbol-function 'extract-calendar-day))
;;   (defalias 'calendar-extract-month (symbol-function 'extract-calendar-month))
;;   (defalias 'calendar-extract-year (symbol-function 'extract-calendar-year)))


;; Google Calendarとの連携
(require 'calfw-ical)
(cfw:install-ical-schedules)

;; カレンダー表示
;; (cfw:open-calendar-buffer)
;; テストデータをセットする
;; (cfw:contents-debug-data)

;; face
;; (custom-set-faces
;;  '(cfw:face-title ((t (:foreground "darkgoldenrod3" :weight bold :height 2.0 :inherit variable-pitch))))
;;  '(cfw:face-header ((t (:foreground "maroon2" :weight bold))))
;;  '(cfw:face-sunday ((t :foreground "red" :weight bold)))
;;  '(cfw:face-saturday ((t :foreground "blue" :weight bold)))
;;  '(cfw:face-holiday ((t :background "grey10" :foreground "purple" :weight bold)))
;;  '(cfw:face-default-content ((t :foreground "green2")))
;;  '(cfw:face-regions ((t :foreground "cyan")))
;;  '(cfw:face-day-title ((t :background "grey10")))
;;  '(cfw:face-today-title ((t :background "red4" :weight bold)))
;;  '(cfw:face-today ((t :foreground: "cyan" :weight bold)))
;;  '(cfw:face-select ((t :background "blue4")))
;;  '(cfw:face-grid ((t :foreground "DarkGrey")))
;;  '(cfw:face-default-day ((t :weight bold :inherit cfw:face-day-title)))
;;  '(cfw:face-annotation ((t :foreground "RosyBrown" :inherit cfw:face-day-title)))
;; )

;; 予定のところに表示
(setq cfw:ical-calendar-contents-sources '("http://www.google.com/calendar/ical/naito.kenji%40gmail.com/private-41e4fdd1c9dbec73669fc1564ad5c02c/basic.ics"))
;; 日付のところに表示
(setq cfw:ical-calendar-annotations-sources '("http://www.google.com/calendar/ical/naito.kenji%40gmail.com/private-41e4fdd1c9dbec73669fc1564ad5c02c/basic.ics"))
;;(setq cfw:ical-calendar-annotations-sources '("http://www.google.com/calendar/ical/japanese__ja%40holiday.calendar.google.com/public/basic.ics"))

;;キャッシュをクリア 
(cfw:ical-calendar-clear-cache)

(require 'calfw-gcal)
(define-key cfw:calendar-mode-map (kbd "a") 'cfw:gcal-main)
