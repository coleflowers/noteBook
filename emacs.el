
;;(setenv "HOME" "D:/software/Emacs")
;;(setenv "PATH" "D:/software/Emacs")
    
(setq default-directory "~/")
(add-to-list 'load-path "~/site-lisp")

;; 在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用的提示
(setq frame-title-format "马磊雷@%b")
(setq default-tab-width 4)

;;格式化代码
;;格式化整个文件函数
(defun indent-whole ()
"Indent the whole buffer."
(interactive)
(save-excursion
(indent-region (point-min) (point-max) nil)))
;;绑定到F7键
;; 不起作用，不调用了
;;(global-set-key [f7] 'indent-whole)

;; 指定semantic临时文件的路径，避免到处都是临时文件
;;(setq semanticdb-default-save-directory "~/backups/emacs")

;; php start >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;php-mode

(add-hook 'php-mode-user-hook 'turn-on-font-lock)
(require 'php-mode)
;;自动缩进宽度，也是关于php-model的配置
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

;;php编译模块 
  
(define-key php-mode-map [menu-bar php php-run] '("Run PHP" . php-run))

(defun php-run ()
(interactive)
(message buffer-file-name)
(shell-command
(concat "D:/wamp/phpStudy/phpa/php.exe -f \""
(buffer-file-name)
"\"")))

;;这里是绑定函数到快捷键C+c r
(defun my-php-mode()
  (define-key php-mode-map [(control c) (r)] 'php-run)
  ;(define-key php-mode-map [(control c) (d)] 'php-debug)
  (hs-minor-mode t)
  (linum-mode t))
(add-hook 'php-mode-hook 'my-php-mode)

;;;;;;;;;;;自动补全 start
;自动补全设置，方法二
    ;;使用方法一，在每次补全时都要搜诉php-manual-path目录，速度比较慢，可以使用方法二
    ;;首先设置变量php-completion代替php-manual-path
    ;;待(setq php-completion-file "~/.emacs.d/php/php-completion-file")
    ;;然后在sehll终端生成php-completion-file
    ;; $ cd /usr/share/doc/php-manual/en/html
    ;; $ ls -1 function*.html \
    ;;  | sed -e 's/^function\.\([-a-zA-Z_0-9]*\)\.html/\1/' \
    ;;  | tr - _ \
    ;;  > ~/.emacs.d/php/php-completion-file
    ;; 注：执行这步之前你必须安装php-manual-en软件包：yum install php-manual-en
    ;;设置emacs在console方式的自动补全的功能键为F9，如果使用emacs 的窗口方式则不必设置这个。
    ;;因为php-model只设置了在窗口方式下的功能键M-tab。
    (global-set-key [(f9)] 'php-complete-function)
;;;;;;;;;;;;自动补全 end
;; php end >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

;; 配色 参考这里https://github.com/lvillani/el-monokai-theme
(require 'monokai-theme)

;;;; 基本设置 ;;;;;
;;设置默认工作目录 
(setq default-directory "D:/") 

;; 设置备份目录。
(setq backup-directory-alist '(("." . "C:/emacs/emacs_backup")))
;; 不备份文件，不推荐
;;(setq make-backup-files nil)

;; 最大化窗口
(defun w32-restore-frame ()
"Restore a minimized frame"
(interactive)
(w32-send-sys-command 61728))
;; 最小化窗口
(defun w32-maximize-frame ()
"Maximize the current frame"
(interactive)
(w32-send-sys-command 61488))
;; 启动时最大化窗口
;;(w32-maximize-frame)

;; 设置光标为竖线
(setq-default cursor-type 'bar)
;; 设置光标为方块
;; (setq-default cursor-type 'box) 

;; 关闭起动时的那个“开机画面”
;;(setq inhibit-startup-message t)

;; 关闭烦人的出错时的提示声
(setq visible-bell t)

;; 加亮选中部分
(transient-mark-mode t)

;; 滚轮支持
(setq mouse-wheel-mode t)

;; 显示列号
(setq column-number-mode t) 

;; 不要在鼠标点击的那个地方插入剪贴板内容
(setq mouse-yank-at-point t)

;; 用一个很大的 kill ring
(setq kill-ring-max 200)

;; 把 fill-column 设为 60. 这样的文字更好读
(setq default-fill-column 60)

;; 不用 TAB 字符来indent, 这会引起很多奇怪的错误
(setq-default indent-tabs-mode nil)
(setq tab-stop-list ())
;;(loop for x downfrom 40 to 1 do
;;      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

;; 设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 可以递归的使用 minibuffer
(setq enable-recursive-minibuffers t)

;; 防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(mouse-avoidance-mode 'animate)

;; 让 Emacs 可以直接打开和显示图片
(auto-image-file-mode)

;; 把这些缺省禁用的功能打开
;;(put 'set-goal-column 'disabled nil)
;;(put 'narrow-to-region 'disabled nil)
;;(put 'upcase-region 'disabled nil)
;;(put 'downcase-region 'disabled nil)
;;(put 'LaTeX-hide-environment 'disabled nil)

;; 让 dired 可以递归的拷贝和删除目录
;;(setq dired-recursive-copies 'top)
;;(setq dired-recursive-deletes 'top)

;; Shell 使用 ansi color
;;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; 使用Win下的选择习惯
;;用shift+方向键进行选择
;;(pc-selection-mode)
;;;; end 基本设置 ;;;;;

;;;; C/C++ 风格设置 ;;;;
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
;;;; end C/C++ 风格设置 ;;;;


;;session
(require 'session)
  (add-hook 'after-init-hook 'session-initialize)

;;desktop.el
;;这是 Emacs 自 带的。你只需要加入以上设置，然后 M-x desktop-save。
;;以后 Emacs 启动时就会打开你上次离开时的所有 buffer.
;;M-x desktop-clear 可以删除记住的内容，你闲现在记住的 buffer 太多就可以采用这个办法。
;;不过我还是建议用 ibuffer(见下) 来管理这些buffer，因为有时你会发现，如果删掉全部记住的buffer， 
;;以后你需要一定的时间来打开你经常编辑的文件！
;;(load "desktop") 
;;(desktop-load-default) 
;;(desktop-read)

;; Load CEDET 
;; 我下载了两个版本的
;;(load-file "~/.emacs-lisp/cedet-1.0pre6/common/cedet.el")
(load-file "~/.emacs.d/site-lisp/cedet-1.1/common/cedet.el")
;;
;;我的是(load-file "~/cedet-1.0/common/cedet.el")

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

;; 这样cedet就装好了

;; ecb
(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.40")
;;例如(add-to-list 'load-path "~/.emacs.d/ecb-2.32")
(require 'ecb)
;;关于ecb的配置
(setq ecb-tip-of-the-day nil) ;;不显示每日的提醒功能                                            
(global-set-key [f12] 'ecb-activate)
(global-set-key [C-f12] 'ecb-deactivate)


;;如果运行仍旧失败，并提示
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
