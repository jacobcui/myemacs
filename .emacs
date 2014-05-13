
;; (add-to-list 'load-path "/opt/local/share/emacs/24.3/lisp")
;; (add-to-list 'load-path "/opt/local/share/emacs/24.3/lisp/cedet")
;; 
(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/lisp/")

					;disable backup
(modify-syntax-entry ?_ "w" c++-mode-syntax-table)
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(require 'cedet)
(require 'ede)
(require 'semantic)
(require 'srecode)
(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")
(setq stack-trace-on-error t) 
;;(load-file "/Users/jacob/emacs/cedet-1.1/common/cedet.elc")
;;(global-ede-mode 1)  
;;(semantic-load-enable-code-helpers) 
;;(semantic-load-enable-minimum-features)

;; (global-srecode-minor-mode 1) 

;; git clone --depth 1  https://github.com/alexott/ecb/ ecb
(add-to-list 'load-path (expand-file-name
			 "~/emacs/ecb/"))

;;(load "/Users/jacob/emacs/nxhtml/autostart.elc")
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'ecb)
(ecb-activate)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
;; '(ede-project-directories (quote ("/Users/jacob/emacs/cedet-1.1/ede")))
;; '(global-semantic-idle-scheduler-mode t nil (semantic-idle))
 '(same-window-regexps (quote ("\\*rsh-[^-]*\\*\\(\\|<[0-9]*>\\)" "\\*telnet-.*\\*\\(\\|<[0-9]+>\\)" "^\\*rlogin-.*\\*\\(\\|<[0-9]+>\\)" "\\*info\\*\\(\\|<[0-9]+>\\)" "\\*gud-.*\\*\\(\\|<[0-9]+>\\)" "\\`\\*Customiz.*\\*\\'" "\\.*")))
 '(semantic-dump-parse t)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "secsydnsm-p01")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(server-start)
