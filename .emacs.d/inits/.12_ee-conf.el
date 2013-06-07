;;====================================
;;; Ee - Emacs Information Manager
;;===================================
(require 'ee-autoloads)

;; アウトラインの該当個所を表示
;; ee のアウトライン表示で該当箇所を別ウィンドウに表示できる．
(defadvice previous-line
  (after ee activate)
  (if (and (eq major-mode 'ee-mode)
           (string-match "ee-outline" (buffer-name (current-buffer))))
      (ee-outline-display-buffer)))

(defadvice next-line
  (after ee activate)
  (if (and (eq major-mode 'ee-mode)
           (string-match "ee-outline" (buffer-name (current-buffer))))
      (ee-outline-display-buffer)))

(defadvice ee-view-record-select-or-expansion-show-or-hide
  (around ee-delete-window activate)
  (if (and (eq major-mode 'ee-mode)
           (string-match "ee-outline" (buffer-name (current-buffer))))
      (progn
        ad-do-it
        (delete-other-windows))
    ad-do-it))

(defun my-ee-outline ()
  "事前にoutline-modeを起動してからee-outlineにする"
  (interactive)
  (outline-mode)
  (ee-outline))

;; C-c o で起動。
(global-set-key "\C-co" 'my-ee-outline)
