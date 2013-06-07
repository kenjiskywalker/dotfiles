;; Twitter
(add-to-list 'load-path "~/.emacs.d/lisp/twittering-mode-2.0.0/")
(require 'twittering-mode)

(setq twittering-allow-insecure-server-cert t)

(setq twittering-auth-method 'xauth)
(setq twittering-status-format "%i %s %t %@")
(setq twittering-icon-mode t) 
(setq twittering-convert-fix-size 21)
(setq twittering-proxy-use nil)

(setq twittering-status-format "%i %s %t ")

;; ;; %s - screen_name
;; ;; %S - name
;; ;; %i - profile_image
;; ;; %d - description
;; ;; %l - location
;; ;; %L - " [location]"
;; ;; %u - url
;; ;; %j - user.id
;; ;; %p - protected?
;; ;; %c - created_at (raw UTC string)
;; ;; %C{time-format-str} - created_at (formatted with time-format-str)
;; ;; %@ - X seconds ago
;; ;; %t - text
;; ;; %' - truncated
;; ;; %f - source
;; ;; %# - id


(defun twittering-mode-hook-func ()
  (set-face-bold-p 'twittering-username-face t)
  (set-face-foreground 'twittering-username-face "DeepSkyBlue3")
  (set-face-foreground 'twittering-uri-face "gray35")
  (follow-mode t)
  (setq truncate-partial-width-windows nil)
  )

(defun twittering-mode-hook-func ()
  (set-face-bold-p 'twittering-username-face t)
  (set-face-foreground 'twittering-username-face "DeepSkyBlue3")
  (set-face-foreground 'twittering-uri-face "LightBlue3")
)
(add-hook 'twittering-mode-hook 'twittering-mode-hook-func)
(setq twittering-retweet-format " RT @%s: %t")
