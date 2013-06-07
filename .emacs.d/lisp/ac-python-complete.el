(defun ac-python-candidates ()
  (python-find-imports)
  (car (read-from-string 
	(python-send-receive 
	 (format "emacs.complete(%S,%s)" 
		  (python-partial-symbol)
		  python-imports)))))

(ac-define-source python
  '((candidates . ac-python-candidates)
    (prefix . (unless 
		  (save-excursion 
		    (re-search-backward "^import" 
					(save-excursion 
					  (re-search-backward "^")) t))
		(let ((symbol (python-partial-symbol)))
		  (if symbol
		      (save-excursion
			(search-backward symbol))))))
    (symbol . "f")))

(add-hook 'python-mode-hook 
	  '(lambda () (add-to-list 'ac-sources 'ac-source-python)))
