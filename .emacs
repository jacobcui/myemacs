(setq debug-on-error t)

;; Generic Settings starts from here.

(global-set-key (kbd "M-*") 'pop-tag-mark) ; Navigate back to where you use M-.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(vscode-dark-plus-theme standard-themes nano-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))

;; Open Emacs with fullscreen by default.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

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
;; When virtualenv can't be used, for example, cooperate laptop may
;; restrict 3rd parth python to run, use manual installation (may need
;; sudo).
;; pip install jedi
;; pip install --upgrade /Users/jiac/.emacs.d/elpa/jedi-core-20170121.610/

(unless (file-exists-p "/usr/local/opt/python/libexec/bin/python")
	(jedi:install-server))
(check_package 'ecb)
(check_package 'buffer-move)
(check_package 'web-mode)
(check_package 'js2-mode)
(check_package 'column-marker)
(check_package 'xcscope)
(check_package 'el-get)

;; Standard jedi setup
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(modify-syntax-entry ?_ "w" c++-mode-syntax-table)
(setq backup-inhibited t)
																				;disable auto save
(setq auto-save-default nil)
;; Set default font size
;; The value is in 1/10pt, so 100 will give you 10pt, etc.
(set-face-attribute 'default nil :height 150)

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
(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
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
 '(ps-font-size (quote (8 . 9.5)))
 '(python-indent-offset 2))
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
