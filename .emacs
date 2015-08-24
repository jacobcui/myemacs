
;; Now use melpa to manage packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun check_package (package_name)
  (unless (require package_name nil 'noerror)
    (package-install package_name)
    (require package_name)))

(check_package 'jedi)
(unless (file-exists-p "~/.emacs.d/.python-environments/default/bin/python")
    (jedi:install-server))
(check_package 'ecb)
(check_package 'buffer-move)
(check_package 'web-mode)
(check_package 'js2-mode)

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

;; Installation of cscope is needed from OS level. E.g apt-get install cscope
;; For python, pycscope is needed.
;;   find . -name '*.py' > cscope.files
;;   pyscope -R
(require 'xcscope)
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

(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")
(setq stack-trace-on-error t) 

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; (ecb-activate)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(desktop-save-mode t)
 '(flyspell-issue-message-flag nil)
 '(indent-tabs-mode nil)
 '(ispell-dictionary nil)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(make-backup-files nil)
 '(python-indent-offset 2)
 '(same-window-regexps (quote ("\\*rsh-[^-]*\\*\\(\\|<[0-9]*>\\)" "\\*telnet-.*\\*\\(\\|<[0-9]+>\\)" "^\\*rlogin-.*\\*\\(\\|<[0-9]+>\\)" "\\*info\\*\\(\\|<[0-9]+>\\)" "\\*gud-.*\\*\\(\\|<[0-9]+>\\)" "\\`\\*Customiz.*\\*\\'" "\\.*")))
 '(semantic-dump-parse t)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "secsydnsm-p01")
 '(smtpmail-smtp-service 25)
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(server-start)

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
