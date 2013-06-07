(defun anything-org-todo-list (arg)
  (interactive "P")
  (org-compile-prefix-format 'todo)
  (org-set-sorting-strategy 'todo)
  ;;(org-prepare-agenda "TODO")
  (if (and (stringp arg) (not (string-match "\\S-" arg))) (setq arg nil))
  (let* ((today (time-to-days (current-time)))
	 (date (calendar-gregorian-from-absolute today))
	 (kwds org-todo-keywords-for-agenda)
	 (completion-ignore-case t)
	 (org-select-this-todo-keyword
	  (if (stringp arg) arg
	    (and arg (integerp arg) (> arg 0)
                 (nth (1- arg) kwds))))
	 rtn rtnall files file pos)
    (when (equal arg '(4))
      (setq org-select-this-todo-keyword
	    (org-icompleting-read "Keyword (or KWD1|K2D2|...): "
			     (mapcar 'list kwds) nil nil)))
    (and (equal 0 arg) (setq org-select-this-todo-keyword nil))
    (org-set-local 'org-last-arg arg)
    (setq org-agenda-redo-command
	  '(org-todo-list (or current-prefix-arg org-last-arg)))
    (setq files (org-agenda-files nil 'ifmode)
	  rtnall nil)
    (while (setq file (pop files))
      (catch 'nextfile
	(org-check-agenda-file file)
	(setq rtn (org-agenda-get-day-entries file date :todo))
	(setq rtnall (append rtnall rtn))))
    rtnall))


(defun anything-c-action-buffer-line (candidate)
  (when (string-match "^\\(.+?\\):\\([0-9]+\\):\\(.*\\)$" candidate)
    (let ((buffer (match-string 1 candidate))
          (lineno (string-to-number (match-string 2 candidate)))
          (content (match-string 3 candidate)))
      (switch-to-buffer (get-buffer buffer))
      (goto-char lineno))))


(defun anything-org-agenda-switch-to (candidate &optional delete-other-windows)
  "指定した項目のポイントに移動．Anything向けにorg-agenda-switch-toをカスタマイズしたもの．"
  (anything-c-action-buffer-line candidate)
  (when (org-mode-p)
	(org-show-context 'agenda)
	(save-excursion
	  (and (outline-next-heading)
	       (org-flag-heading nil)))))

(defun anything-org-clock-in (candidate)
  "指定した項目の時間測定を開始．"
  (anything-org-agenda-switch-to candidate)
  (org-clock-in))

(defun anything-org-archive-subtree (ignore)
  (dolist (candidate (anything-marked-candidates))
    (anything-org-agenda-switch-to candidate)
    (org-archive-subtree)))

(defun anything-org-agenda-all-todo-list ()
  (let ((list (anything-org-todo-list nil)))
    (mapcar (lambda (str)
           (let* ((marker (get-text-property 1 'org-marker str))
                  (pos (marker-position marker))
                  (buffer (buffer-name (marker-buffer marker))))
             (set-text-properties 0 (length str) nil str)
             (concat buffer ":" (number-to-string pos) ":" str)))
         list)))

(defun anything-org-agenda-tags-view-note ()
  (let ((list (anything-org-tags-view nil "LEVEL=1+NOTE")))
    (mapcar (lambda (str)
              (let* ((marker (get-text-property 1 'org-marker str))
                     (pos (marker-position marker))
                     (buffer (buffer-name (marker-buffer marker))))
                (set-text-properties 0 (length str) nil str)
                (concat buffer ":" (number-to-string pos) ":" str)))
            list)))

(defun anything-org-tags-view (&optional todo-only match)
  (interactive "P")
  (org-compile-prefix-format 'tags)
  (org-set-sorting-strategy 'tags)
  (let* ((org-tags-match-list-sublevels
          org-tags-match-list-sublevels)
         (completion-ignore-case t)
         rtn rtnall files file pos matcher
         buffer)
    (when (and (stringp match) (not (string-match "\\S-" match)))
      (setq match nil))
    (setq matcher (org-make-tags-matcher match)
          match (car matcher) matcher (cdr matcher))
    ;;(org-prepare-agenda (concat "TAGS " match))
    (setq org-agenda-query-string match)
    (setq org-agenda-redo-command
          (list 'org-tags-view (list 'quote todo-only)
                (list 'if 'current-prefix-arg nil 'org-agenda-query-string)))
    (setq files (org-agenda-files nil 'ifmode)
          rtnall nil)
    (while (setq file (pop files))
      (catch 'nextfile
        (org-check-agenda-file file)
        (setq buffer (if (file-exists-p file)
                         (org-get-agenda-file-buffer file)
                       (error "No such file %s" file)))
        (if (not buffer)
            ;; If file does not exist, error message to agenda
            (setq rtn (list
                       (format "ORG-AGENDA-ERROR: No such org-file %s" file))
                  rtnall (append rtnall rtn))
          (with-current-buffer buffer
            (unless (org-mode-p)
              (error "Agenda file %s is not in `org-mode'" file))
            (save-excursion
              (save-restriction
                (if org-agenda-restrict
                    (narrow-to-region org-agenda-restrict-begin
                                      org-agenda-restrict-end)
                  (widen))
                (setq rtn (org-scan-tags 'agenda matcher todo-only))
                (setq rtnall (append rtnall rtn))))))))
    rtnall))
  


(setq anything-org-agenda-all-todo-list-source
      '((name . "All Todo List")
        (candidates . (lambda () (anything-org-agenda-all-todo-list)))
        (action
         ("Go to Line on Buffer" . (lambda (x) (anything-org-agenda-switch-to x)))
         ("Clock-in" . (lambda (x) (anything-org-clock-in x))))))

(setq anything-org-agenda-tags-view-note-source
      '((name . "TAG: NOTE")
        (candidates . (lambda () (anything-org-agenda-tags-view-note)))
        (action
         ("Go to Line on Buffer" . anything-org-agenda-switch-to)
         ("Archive" . anything-org-archive-subtree))))

(defun anything-org-agenda ()
  (interactive)
  (anything (list
             anything-org-agenda-all-todo-list-source
             anything-org-agenda-tags-view-note-source)))

(provide 'anything-org-mode)