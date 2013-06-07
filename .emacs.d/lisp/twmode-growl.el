(defvar twmode-growl-notify-icon-size-minimum 256)
(defun my-twmode-growl-notify-1 (user text spec icon-uri)
  (cond
   ((and (equal spec '(replies))
	 (not (string= user twittering-username)))
    (mkdir twmode-growl-notify-icon-path-directory t)
    (lexical-let* ((icon-uri icon-uri)
		   (icon-base (expand-file-name
			       (sha1 icon-uri)
			       twmode-growl-notify-icon-path-directory))
		   (icon-path (concat icon-base ".png"))
		   (user user)
		   (text text))
    (deferred:$
      (deferred:next
	(lambda (x)
	  (if (file-exists-p icon-path)
	      (deferred:apply 'ignore)
	    (deferred:$
	      (deferred:process "wget" "-O" icon-base icon-uri)
	      (deferred:nextc it
		(lambda (x)
		  (with-temp-buffer
		    (call-process "identify"
				  nil t nil
				  icon-base)
		    (goto-char (point-min))
		    (re-search-forward "\\([0-9]+\\)x\\([0-9]+\\)")
		    (and (< (string-to-number (match-string 1))
			    twmode-growl-notify-icon-size-minimum)
			 (< (string-to-number (match-string 2))
			    twmode-growl-notify-icon-size-minimum)))))
	      (deferred:nextc it
		(lambda (need-scale)
		  (if need-scale
		      (deferred:process "convert"
			icon-base
			"-scale" (format "%dx%d"
					 twmode-growl-notify-icon-size-minimum
					 twmode-growl-notify-icon-size-minimum)
			(concat "png:" icon-path))
		    (deferred:apply 'ignore))))
	      (deferred:nextc it
		(lambda (x)
		  (deferred:call 'delete-file icon-base)))))))
      (deferred:nextc it
	(lambda (x)
	  (deferred:process growl-notify-path
	    "-n" "twmode"
	    "-t" (concat "@" user)
	    "--image" icon-path
	    "-m" text))))))))
