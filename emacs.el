
;;(setenv "HOME" "D:/software/Emacs")
;;(setenv "PATH" "D:/software/Emacs")
    
(setq default-directory "~/")
(add-to-list 'load-path "~/site-lisp")

;; �ڱ�������ʾbuffer�����֣������� emacs@wangyin.com ����û�õ���ʾ
(setq frame-title-format "������@%b")
(setq default-tab-width 4)

;;��ʽ������
;;��ʽ�������ļ�����
(defun indent-whole ()
"Indent the whole buffer."
(interactive)
(save-excursion
(indent-region (point-min) (point-max) nil)))
;;�󶨵�F7��
;; �������ã���������
;;(global-set-key [f7] 'indent-whole)

;; ָ��semantic��ʱ�ļ���·�������⵽��������ʱ�ļ�
;;(setq semanticdb-default-save-directory "~/backups/emacs")

;; php start >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;php-mode

(add-hook 'php-mode-user-hook 'turn-on-font-lock)
(require 'php-mode)
;;�Զ�������ȣ�Ҳ�ǹ���php-model������
(setq-default c-basic-offset 4)

;; run php lint when press f8 key
;; php lint
(defun phplint-thisfile ()
(interactive)
(compile (format "php -l %s" (buffer-file-name))))
(add-hook 'php-mode-hook
'(lambda ()
(local-set-key [f8] 'phplint-thisfile)))
;; end of php lint

;;php����ģ�� 
  
(define-key php-mode-map [menu-bar php php-run] '("Run PHP" . php-run))

(defun php-run ()
(interactive)
(message buffer-file-name)
(shell-command
(concat "D:/wamp/phpStudy/phpa/php.exe -f \""
(buffer-file-name)
"\"")))

;;�����ǰ󶨺�������ݼ�C+c r
(defun my-php-mode()
  (define-key php-mode-map [(control c) (r)] 'php-run)
  ;(define-key php-mode-map [(control c) (d)] 'php-debug)
  (hs-minor-mode t)
  (linum-mode t))
(add-hook 'php-mode-hook 'my-php-mode)

;;;;;;;;;;;�Զ���ȫ start
;�Զ���ȫ���ã�������
    ;;ʹ�÷���һ����ÿ�β�ȫʱ��Ҫ����php-manual-pathĿ¼���ٶȱȽ���������ʹ�÷�����
    ;;�������ñ���php-completion����php-manual-path
    ;;��(setq php-completion-file "~/.emacs.d/php/php-completion-file")
    ;;Ȼ����sehll�ն�����php-completion-file
    ;; $ cd /usr/share/doc/php-manual/en/html
    ;; $ ls -1 function*.html \
    ;;  | sed -e 's/^function\.\([-a-zA-Z_0-9]*\)\.html/\1/' \
    ;;  | tr - _ \
    ;;  > ~/.emacs.d/php/php-completion-file
    ;; ע��ִ���ⲽ֮ǰ����밲װphp-manual-en�������yum install php-manual-en
    ;;����emacs��console��ʽ���Զ���ȫ�Ĺ��ܼ�ΪF9�����ʹ��emacs �Ĵ��ڷ�ʽ�򲻱����������
    ;;��Ϊphp-modelֻ�������ڴ��ڷ�ʽ�µĹ��ܼ�M-tab��
    (global-set-key [(f9)] 'php-complete-function)
;;;;;;;;;;;;�Զ���ȫ end
;; php end >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

;; ��ɫ �ο�����https://github.com/lvillani/el-monokai-theme
(require 'monokai-theme)

;;;; �������� ;;;;;
;;����Ĭ�Ϲ���Ŀ¼ 
(setq default-directory "D:/") 

;; ���ñ���Ŀ¼��
(setq backup-directory-alist '(("." . "C:/emacs/emacs_backup")))
;; �������ļ������Ƽ�
;;(setq make-backup-files nil)

;; ��󻯴���
(defun w32-restore-frame ()
"Restore a minimized frame"
(interactive)
(w32-send-sys-command 61728))
;; ��С������
(defun w32-maximize-frame ()
"Maximize the current frame"
(interactive)
(w32-send-sys-command 61488))
;; ����ʱ��󻯴���
;;(w32-maximize-frame)

;; ���ù��Ϊ����
(setq-default cursor-type 'bar)
;; ���ù��Ϊ����
;; (setq-default cursor-type 'box) 

;; �ر���ʱ���Ǹ����������桱
;;(setq inhibit-startup-message t)

;; �رշ��˵ĳ���ʱ����ʾ��
(setq visible-bell t)

;; ����ѡ�в���
(transient-mark-mode t)

;; ����֧��
(setq mouse-wheel-mode t)

;; ��ʾ�к�
(setq column-number-mode t) 

;; ��Ҫ����������Ǹ��ط��������������
(setq mouse-yank-at-point t)

;; ��һ���ܴ�� kill ring
(setq kill-ring-max 200)

;; �� fill-column ��Ϊ 60. ���������ָ��ö�
(setq default-fill-column 60)

;; ���� TAB �ַ���indent, �������ܶ���ֵĴ���
(setq-default indent-tabs-mode nil)
(setq tab-stop-list ())
;;(loop for x downfrom 40 to 1 do
;;      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

;; ���� sentence-end ����ʶ�����ı�㡣������ fill ʱ�ھ�ź���������ո�
(setq sentence-end "\\([������]\\|����\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; ���Եݹ��ʹ�� minibuffer
(setq enable-recursive-minibuffers t)

;; ��ֹҳ�����ʱ������ scroll-margin 3 �����ڿ�����Ļ����3��ʱ�Ϳ�ʼ���������ԺܺõĿ��������ġ�
(setq scroll-margin 3
      scroll-conservatively 10000)

;; ����ƥ��ʱ��ʾ����һ�ߵ����ţ������Ƿ��˵�������һ������
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; ��꿿�����ָ��ʱ�������ָ���Զ��ÿ�����ס����
(mouse-avoidance-mode 'animate)

;; �� Emacs ����ֱ�Ӵ򿪺���ʾͼƬ
(auto-image-file-mode)

;; ����Щȱʡ���õĹ��ܴ�
;;(put 'set-goal-column 'disabled nil)
;;(put 'narrow-to-region 'disabled nil)
;;(put 'upcase-region 'disabled nil)
;;(put 'downcase-region 'disabled nil)
;;(put 'LaTeX-hide-environment 'disabled nil)

;; �� dired ���Եݹ�Ŀ�����ɾ��Ŀ¼
;;(setq dired-recursive-copies 'top)
;;(setq dired-recursive-deletes 'top)

;; Shell ʹ�� ansi color
;;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ʹ��Win�µ�ѡ��ϰ��
;;��shift+���������ѡ��
;;(pc-selection-mode)
;;;; end �������� ;;;;;

;;;; C/C++ ������� ;;;;
(add-hook 'c-mode-hook
    '(lambda ()
        (c-set-style "Stroustrup")))
;        (c-toggle-auto-state)))

(add-hook 'c++-mode-hook
    '(lambda ()
        (c-set-style "Stroustrup")))
;        (c-toggle-auto-state)))

(setq default-tab-width 4) 
(setq c-basic-offset 4) 
;;;; end C/C++ ������� ;;;;


;;session
(require 'session)
  (add-hook 'after-init-hook 'session-initialize)

;;desktop.el
;;���� Emacs �� ���ġ���ֻ��Ҫ�����������ã�Ȼ�� M-x desktop-save��
;;�Ժ� Emacs ����ʱ�ͻ�����ϴ��뿪ʱ������ buffer.
;;M-x desktop-clear ����ɾ����ס�����ݣ��������ڼ�ס�� buffer ̫��Ϳ��Բ�������취��
;;�����һ��ǽ����� ibuffer(����) ��������Щbuffer����Ϊ��ʱ��ᷢ�֣����ɾ��ȫ����ס��buffer�� 
;;�Ժ�����Ҫһ����ʱ�������㾭���༭���ļ���
;;(load "desktop") 
;;(desktop-load-default) 
;;(desktop-read)

;; Load CEDET 
;; �������������汾��
;;(load-file "~/.emacs-lisp/cedet-1.0pre6/common/cedet.el")
(load-file "~/.emacs.d/site-lisp/cedet-1.1/common/cedet.el")
;;
;;�ҵ���(load-file "~/cedet-1.0/common/cedet.el")

;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-guady-code-helpers)

;; * This turns on which-func support (Plus all other code helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; This turns on modes that aid in grammar writing and semantic tool
;; development.  It does not enable any other features such as code
;; helpers above.
;; (semantic-load-enable-semantic-debugging-helpers)

;; ����cedet��װ����

;; ecb
(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.40")
;;����(add-to-list 'load-path "~/.emacs.d/ecb-2.32")
(require 'ecb)
;;����ecb������
(setq ecb-tip-of-the-day nil) ;;����ʾÿ�յ����ѹ���                                            
(global-set-key [f12] 'ecb-activate)
(global-set-key [C-f12] 'ecb-deactivate)


;;��������Ծ�ʧ�ܣ�����ʾ
;;Symbol's value as variable is void: stack-trace-on-error
(setq stack-trace-on-error t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; svn start >>>>>>>>>>>>>>>>>>>>>>>>>>>>
(defun svn-update()  
  "Svn update"  
  (interactive)  
  (let ((cmd (concat "TortoiseProc.exe /command:update /path:\"" buffer-file-name "\" /closeonend:0")))  
    (message cmd)  
  (shell-command cmd)))  
  
(defun svn-commit()  
  "Svn commit"  
  (interactive)  
  (let ((cmd (concat "TortoiseProc.exe /command:commit /path:\"" buffer-file-name "\" /closeonend:0")))  
    (message cmd)  
  (shell-command cmd)))  
  
;;SVN diff  
(defun svn-diff()  
  "Svn diff"  
  (interactive)  
  (let ((cmd (concat "TortoiseProc.exe /command:diff /path:\"" buffer-file-name "\" /closeonend:0")))  
    (message cmd)  
  (shell-command cmd)))
;; svn end >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
