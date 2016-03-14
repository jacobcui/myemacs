

;; Generic Settings starts from here.

(global-set-key (kbd "M-*") 'pop-tag-mark) ; Navigate back to where you use M-.

;; Now use melpa to manage packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/sublime-themes-20150915.3")

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun check_package (package_name)
  (unless (require package_name nil 'noerror)
    (package-install package_name)
    (require package_name)))

(global-set-key [mouse-9] 'other-window)
(global-set-key [drag-mouse-9] 'buf-move-left)
(global-set-key [mouse-8] 'linum-mode)


(check_package 'jedi)
(unless (file-exists-p "~/.emacs.d/.python-environments/default/bin/python")
    (jedi:install-server))
(check_package 'ecb)
(check_package 'buffer-move)
(check_package 'web-mode)
(check_package 'js2-mode)
(check_package 'column-marker)
(check_package 'xcscope)

;; Standard jedi setup
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(modify-syntax-entry ?_ "w" c++-mode-syntax-table)
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)

(require 'cedet)
(require 'ede)
(require 'semantic)
(require 'srecode)
(require 'uniquify) 



;; projectile https://github.com/bbatsov/projectile
(check_package 'projectile)
(projectile-global-mode)
;; the use of native indexing in operating systems
(setq projectile-indexing-method 'native)
;; enables caching unconditionally
(setq projectile-enable-caching t)
;; disables remote file exists cache:
(setq projectile-file-exists-remote-cache-expire nil)

;; helm https://github.com/emacs-helm/helm
(check_package 'helm)
(check_package 'helm-projectile)
(helm-projectile-on)

;; (global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)


;; Installation of cscope is needed from OS level. E.g apt-get install cscope
;; For python, pycscope is needed.
;;   find . -name '*.py' > cscope.files
;;   pyscope -R
(check_package 'xcscope)
	(define-key global-map [(control f3)]  'cscope-find-this-symbol)
	(define-key global-map [(control f4)]  'cscope-find-global-definition)
	(define-key global-map [(control f5)]  'cscope-set-initial-directory)
	(define-key global-map [(control f6)]  'cscope-unset-initial-directory)
	(define-key global-map [(control f7)]
	  'cscope-find-global-definition-no-prompting)
	(define-key global-map [(control f8)]  'cscope-pop-mark)
	(define-key global-map [(control f9)]  'cscope-history-backward-line)
	(define-key global-map [(control f10)] 'cscope-history-forward-line)
	(define-key global-map [(control f11)] 'cscope-history-backward-file)
	(define-key global-map [(control f12)] 'cscope-history-forward-file)
     (define-key global-map [(meta f9)]  'cscope-display-buffer)
     (define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)

(require 'column-marker)
 ;; Highlight column 80 in foo mode:
 (add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))

(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")
(setq stack-trace-on-error t) 

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq-default tab-width 2)
;; (ecb-activate)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(column-number-mode t)
 '(cscope-display-cscope-buffer t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes (quote ("96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default)))
 '(desktop-save-mode t)
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/" "/"))))
 '(fill-column 78)
 '(flyspell-issue-message-flag nil)
 '(indent-tabs-mode nil)
 '(ispell-dictionary nil)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(make-backup-files nil)
 '(python-indent-offset 2)
 '(same-window-regexps
   (quote
    ("\\*rsh-[^-]*\\*\\(\\|<[0-9]*>\\)" "\\*telnet-.*\\*\\(\\|<[0-9]+>\\)" "^\\*rlogin-.*\\*\\(\\|<[0-9]+>\\)" "\\*info\\*\\(\\|<[0-9]+>\\)" "\\*gud-.*\\*\\(\\|<[0-9]+>\\)" "\\`\\*Customiz.*\\*\\'" "\\.*")))
 '(semantic-dump-parse t)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "secsydnsm-p01")
 '(smtpmail-smtp-service 25)
 '(tab-width 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; General key strokes
;; C-u C-space or C-u C-@  - Go back to previous line position
;; C-x C-space or C-x C-@  - Navigate back between buffers

;; about tags
;; create TAGS file: 
;; 1) go to your project directory, run
;;    # find . -type f |etags -
;; 2) go to emacs, M-x visit-tags-table to load this file
;; 3) command reference: http://www.gnu.org/software/emacs/manual/html_node/emacs/Find-Tag.html
;;    M-. tag RET       - Find first definition of tag (find-tag).
;;    C-u M-.           - Find next alternate definition of last tag specified.
;;    C-u - M-.         - Go back to previous tag found.
;;    C-M-. pattern RET - Find a tag whose name matches pattern (find-tag-regexp).
;;    C-u C-M-.         - Find the next tag whose name matches the last pattern used.
;;    C-x 4 . tag RET   - Find first definition of tag, but display it in another window (find-tag-other-window).
;;    C-x 5 . tag RET   - Find first definition of tag, and create a new frame to select the buffer (find-tag-other-frame).
;;    M-*               - Pop back to where you previously invoked M-. and friends.

;;(setq server-socket-dir "~/.emacs.d/server")
(setq server-socket-dir "/tmp/emacs501")
(server-start)

;; Find non-ASCII characters in source files.
(defun non-ascii-char ()
  "Find the first non-ASCII character from point onwards."
  (interactive)
  (let (point)
    (save-excursion
      (setq point
            (catch 'non-ascii
              (while (not (eobp))
                (or (eq (char-charset (following-char))
                        'ascii)
                    (throw 'non-ascii (point)))
                (forward-char 1)))))
    (if point
        (goto-char point)
        (message "No non-ASCII characters."))))
