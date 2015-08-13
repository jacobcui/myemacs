;; el-get package

(add-to-list 'load-path "~/.emacs.d/elpa/ecb-2alpha24")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; http://tkf.github.io/emacs-jedi
;; M-x el-get-install RET jedi RET
;; M-x jedi:install-server RET( see also Python server(jediepcserver.py) installation )
;; standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(modify-syntax-entry ?_ "w" c++-mode-syntax-table)
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(require 'buffer-move)
(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)

;; (load-file "~/emacs/buffer-move.el")

(require 'cedet)
(require 'ede)
(require 'semantic)
(require 'srecode)
(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")
(setq stack-trace-on-error t) 

;;(global-ede-mode 1)  
;;(semantic-load-enable-code-helpers) 
;;(semantic-load-enable-minimum-features)

;; (global-srecode-minor-mode 1) 

;; git clone --depth 1  https://github.com/alexott/ecb/ ecb

;;(load "/Users/jacob/emacs/nxhtml/autostart.elc")
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'ecb)
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
