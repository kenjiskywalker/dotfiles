; load anything
(require 'anything-startup)
;(require 'anything-etags)

; anything key bind
(define-key global-map (kbd "C-x C-b") 'anything) 

;; (define-key anything-map (kbd "C-n") 'anything-next-source)
;; (define-key anything-map (kbd "C-p") 'anything-previous-source)
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "M-v") 'anything-previous-source)


;; anything-match-plugin
(require 'anything-match-plugin)

;; anything-complete
(require 'anything-complete)

(setq anything-sources
      (list anything-c-source-buffers
            anything-c-source-recentf
;;            anything-c-source-bookmarks
;;            anything-c-source-man-pages
            anything-c-source-emacs-commands
            anything-c-source-file-name-history
;;            anything-c-source-locate
;;            anything-c-source-info-pages
;;            anything-c-source-calculation-result
            ))

(defadvice anything-check-minibuffer-input
  (around sit-for activate)
  (if (sit-for anything-idle-delay t)
      ad-do-it))

(setq anything-enable-shortcuts 'alphabet)