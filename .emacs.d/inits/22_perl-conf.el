(defalias 'perl-mode 'cperl-mode)

(add-hook 'cperl-mode-hook (lambda ()
                             (setq plcmp-use-keymap nil) ; requireより前の段階で設定する
                             (require 'perl-completion)
                             (add-to-list 'ac-sources 'ac-source-perl-completion)
                             (perl-completion-mode t)
                             ;; plcmp-mode-mapにコマンドを割り当てていく
                             (define-key plcmp-mode-map (kbd "C-c m") 'plcmp-cmd-menu)
                             (define-key plcmp-mode-map (kbd "C-c s") 'plcmp-cmd-smart-complete)
                             (define-key plcmp-mode-map (kbd "C-c d") 'plcmp-cmd-show-doc)
                             (define-key plcmp-mode-map (kbd "C-c p") 'plcmp-cmd-show-doc-at-point)
                             (define-key plcmp-mode-map (kbd "C-c c") 'plcmp-cmd-clear-all-cashes)))

(require 'flymake)

;; set-perl5lib
;; 開いたスクリプトのパスに応じて、@INCにlibを追加してくれる
;; 以下からダウンロードする必要あり
;; http://svn.coderepos.org/share/lang/elisp/set-perl5lib/set-perl5lib.el
(require 'set-perl5lib)
 

;; エラーとかその辺の色
(set-face-background 'flymake-errline "red4")
(set-face-foreground 'flymake-errline "black")
(set-face-background 'flymake-warnline "yellow")
(set-face-foreground 'flymake-warnline "black")

;; エラーをミニバッファに表示
;; http://d.hatena.ne.jp/xcezx/20080314/1205475020
(defun flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count               (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))


;; http://unknownplace.org/memo/2007/12/21#e001
(defvar flymake-perl-err-line-patterns
  '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))

(defconst flymake-allowed-perl-file-name-masks
  '(("\\.pl$" flymake-perl-init)
    ("\\.pm$" flymake-perl-init)
    ("\\.t$" flymake-perl-init)))

(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "perl" (list "-wc" local-file))))

(defun flymake-perl-load ()
  (interactive)
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-perl-file-name-masks))
  (setq flymake-err-line-patterns flymake-perl-err-line-patterns)
  (set-perl5lib)
  (flymake-mode t))

(add-hook 'cperl-mode-hook 'flymake-perl-load)

(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))



;; モジュールソースバッファの場合はその場で、
;; その他のバッファの場合は別ウィンドウに開く。
(put 'perl-module-thing 'end-op
     (lambda ()
       (re-search-forward "\\=[a-zA-Z][a-zA-Z0-9_:]*" nil t)))
(put 'perl-module-thing 'beginning-op
     (lambda ()
       (if (re-search-backward "[^a-zA-Z0-9_:]" nil t)
           (forward-char)
         (goto-char (point-min)))))

(defun perldoc-m ()
  (interactive)
  (let ((module (thing-at-point 'perl-module-thing))
        (pop-up-windows t)
        (cperl-mode-hook nil))
    (when (string= module "")
      (setq module (read-string "Module Name: ")))
    (let ((result (substring (shell-command-to-string (concat "perldoc -m " module)) 0 -1))
          (buffer (get-buffer-create (concat "*Perl " module "*")))
          (pop-or-set-flag (string-match "*Perl " (buffer-name))))
      (if (string-match "No module found for" result)
          (message "%s" result)
        (progn
          (with-current-buffer buffer
            (toggle-read-only -1)
            (erase-buffer)
            (insert result)
            (goto-char (point-min))
            (cperl-mode)
            (toggle-read-only 1)
            )
          (if pop-or-set-flag
              (switch-to-buffer buffer)
            (display-buffer buffer)))))))


;; Perl デバッガの設定
(autoload 'perl-debug "perl-debug" nil t)
(autoload 'perl-debug-lint "perl-debug" nil t)

;; 拡張子によるモードの切り替え
(setq auto-mode-alist
      (append '(("\\.sh$" . shell-script-mode)
                ("\\.perl$\\|\\.p[hlm]$\\|/perl/" . cperl-mode))
              auto-mode-alist))

(add-hook 'cperl-mode-hook
          '(lambda ()
             (make-local-variable 'compile-command)
             (setq compile-command
                   (concat "perl " (buffer-file-name)))
             (cperl-define-key "\C-c\C-c" 'compile)))


;; (setq compilation-window-height 10)
;; perldoc -m を開く

(defun flymake-xml-init ())
