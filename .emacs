;;网上抄的一个有中文注释的emacs配置文件

;;设置你的全名和邮件，在发邮件时可以用到
(setq user-full-name "Hu Kai")
(setq user-mail-address "hukai_89@yahoo.com")
;;设置你的书签文件，默认是~/.emacs.bmk，我喜欢把有关emacs的文件尽量放在一个文件夹，所以就修改了。
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")
;;设置缩略词的文件？不大记得了
;;(setq abbrev-file-name "~/.emacs.d/.abbrev_defs")

;;load-path就同bash中的$PATH相似，emacs所需要的Elisp包都得在load-path里的文件夹中，~/.emacs.d/elisp是我自己添加的Elisp包
(setq load-path (cons "~/.emacs.d/elisp" load-path))
;;设置info的路径，也可通过Shell的全局变量$INFOPATH设置
;;(add-to-list 'Info-default-directory-list "~/local/info/")

;;由菜单修改配置的东西将会保存在custom-file里，这里我设置他在我的elisp的集中营里
(setq custom-file "~/.emacs.d/elisp/custom.el")



;;颜色设置，其实有个color-theme.el可以将Emacs设置丰富多彩，非常漂亮，不过启动有些慢（我得机器不行），我只是选择了一些颜色设置。
;; 指针颜色设置为白色
(set-cursor-color "white")
;; 鼠标颜色设置为白色
(set-mouse-color "white")
;; 设置背景颜色和字体颜色
;;(set-foreground-color "white")
;;(set-background-color "darkblue")
;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")
;;设置日历的一些颜色
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))

;;外观设置
;;去掉工具栏
(tool-bar-mode nil)
;;去掉菜单栏，我将F10绑定为显示菜单栏，万一什么东西忘了，需要菜单栏了可以摁F10调出，再摁F10就去掉菜单
(menu-bar-mode nil)
;;不要滚动栏，现在都用滚轴鼠标了，可以不用滚动栏了
(scroll-bar-mode nil)

;;备份设置
;;emacs还有一个自动保存功能，默认在~/.emacs.d/auto-save-list里，这个非常有用，我这里没有改动，具体可以参见Sams teach yourself emacs in 24hours(我简称为sams24)
;;启用版本控制，即可以备份多次
(setq version-control t)
;;备份最原始的版本两次，记第一次编辑前的文档，和第二次编辑前的文档
(setq kept-old-versions 1)
;;备份最新的版本五次，理解同上
(setq kept-new-versions 2)
;;删掉不属于以上7中版本的版本
(setq delete-old-versions t)
;;设置备份文件的路径
(setq backup-directory-alist '(("." . "~/tmp")))
;;备份设置方法，直接拷贝
(setq backup-by-copying t)

;;自动补全功能，这事从王垠的网站直接Copy过来的，引用一些他对此的说明
;;你可以设置以下 hippie-expand 的补全方式。它是一个优先列表， hippie-expand 会优先使用表最前面的函数来补全
;;这是说，首先使用当前的buffer补全，如果找不到，就到别的可见的窗口里寻找，如果还找不到，那么到所有打开的buffer去找，如果还……那么到kill-ring里，到文件名，到简称列表里，到list，…… 当前使用的匹配方式会在 echo 区域显示。
;;特别有意思的是 try-expand-line，它可以帮你补全整整一行文字。我很多时后有两行文字大致相同，只有几个字不一样，但是我懒得去拷贝粘贴以下。那么我就输入这行文字的前面几个字。然后多按几下 M-/ 就能得到那一行。
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
'(try-expand-line
try-expand-line-all-buffers
try-expand-list
try-expand-list-all-buffers
try-expand-dabbrev
try-expand-dabbrev-visible
try-expand-dabbrev-all-buffers
try-expand-dabbrev-from-kill
try-complete-file-name
try-complete-file-name-partially
try-complete-lisp-symbol
try-complete-lisp-symbol-partially
try-expand-whole-kill))

;;时间戳设置(time-stamp)，设定文档上次保存的信息
;;只要里在你得文档里有Time-stamp:的设置，就会自动保存时间戳
;;启用time-stamp
(setq time-stamp-active t)
;;去掉time-stamp的警告？
(setq time-stamp-warn-inactive t)
;;设置time-stamp的格式，我如下的格式所得的一个例子：
(setq time-stamp-format "%:u %02m/%02d/%04y %02H02M02S")
;;将修改时间戳添加到保存文件的动作里。
(add-hook 'write-file-hooks 'time-stamp)

;;时间显示设置
;;启用时间显示设置，在minibuffer上面的那个杠上（忘了叫什么来着）
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间栏旁边启用邮件设置
(setq display-time-use-mail-icon t)
;;时间的变化频率，单位多少来着？
(setq display-time-interval 10)

;;启用minibuffer，好像是默认设置吧
(minibuffer-electric-default-mode 1)
;;启用部分补全功能，如输入M-x q r r相当于M-x query-replace-regexp
;;(partial-completion-mode 1)
;;在minibuffer里启用自动补全函数和变量
(icomplete-mode 1)
;;所有的问题用y/n方式，不用yes/no方式。有点懒，只想输入一个字母
(fset 'yes-or-no-p 'y-or-n-p)
;;允许minibuffer自由变化其大小（指宽度）
(setq resize-mini-windows t)
;;当寻找一个同名的文件，自动关联上那个文件？
;;(setq uniquify-buffer-name-style 'forward)
;;在emacs读man文档时，使用当前buffer
;;(setq Man-notify-method 'pushy)
;;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了
(mouse-avoidance-mode 'animate)
;;允许自动打开图片，如wiki里面
(auto-image-file-mode)
;;可以操作压缩文档
(auto-compression-mode 1)
;;在minibuffer上面可以显示列号
(column-number-mode t)
;;显示默认的文档的宽度，看起来比较舒服？
(setq default-fill-column 60)
;;指针不要闪，我得眼睛花了
(blink-cursor-mode -1)
(transient-mark-mode 1)
;;当指针到一个括号时，自动显示所匹配的另一个括号
(show-paren-mode 1)
;;是用滚轴鼠标
(mouse-wheel-mode t)
;;去掉烦人的警告铃声
;;(setq visible-bell nil)
;;滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
scroll-margin 3
scroll-conservatively 10000)
;;设定句子结尾，主要是针对中文设置
;;(setq sentence-end "\\([¡££¡£¿]\\|¡¡\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
;;(setq sentence-end-double-space nil)
;;去掉Emacs和gnus启动时的引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)
;;当指针移到另一行，不要新增这一行？d
(setq next-line-add-newlines nil)
;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的
(setq require-final-newline t)
(setq track-eol t)
;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)
;;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)
;;增大使用查找函数和变量的寻找范围
(setq apropos-do-all t)
;;是用aspell程序作为Emacs的拼写检查成学 
(setq-default ispell-program-name "aspell")
;;使用narrow功能时的一个设置
(put 'narrow-to-region 'disabled nil)
;;启动Emacs自动设置为两个窗口(上下各一个)
;;(split-window-vertically)
;;改变emacs标题栏的标题
(setq frame-title-format "%b@vj.org")
;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)


;;emacs环境设置
;;整体环境设置
;;(set-language-environment 'Chinese-GB)
;;应该和输入有关系
;;(set-keyboard-coding-system 'chinese-iso-8bit-with-esc)
;;终端下emacs的中文设置？
;;(set-terminal-coding-system 'chinese-iso-8bit-with-esc)
;;文件保存时的编码设置
;;(set-buffer-file-coding-system 'chinese-iso-8bit-with-esc)
;;下面两天是emacs和其他程序互相复制／粘贴的设置
;;在帖3（hvj-basicconfig.el）的最后一行中也有相关的一个设定
;;(set-selection-coding-system 'chinese-iso-8bit-with-esc)
;;(set-clipboard-coding-system 'chinese-iso-8bit-with-esc)
;;什么设置？忘了？有些人没用下面这些
;;(modify-coding-system-alist 'process "*" 'chinese-iso-8bit-with-esc)
;;(setq default-process-coding-system '(chinese-iso-8bit-with-esc . chinese-iso-8bit-with-esc))
;;(setq-default pathname-coding-system 'chinese-iso-8bit-with-esc)

;;字体解码优先顺序
;;从王垠那拷过来的，不用怎么再改吧。
(setq font-encoding-alist
(append '(("MuleTibetan-0" (tibetan . 0))
("GB2312" (chinese-gb2312 . 0)) 
("JISX0208" (japanese-jisx0208 . 0)) 
("JISX0212" (japanese-jisx0212 . 0)) 
("VISCII" (vietnamese-viscii-lower . 0)) 
("KSC5601" (korean-ksc5601 . 0)) 
("MuleArabic-0" (arabic-digit . 0)) 
("MuleArabic-1" (arabic-1-column . 0)) 
("MuleArabic-2" (arabic-2-column . 0))) font-encoding-alist)) 

;;一些其他的说明：
;;1，有些人使用gbk的locale，那么就需要安装mule-gbk扩展elisp包，我以前装过，配置不是很难。论坛里可以搜到，这次比较急，不再去搜了，下次在加到这贴里。
;;2，emacs目前对Unicode支持不是很好，虽然现在有mule-ucs包，我一直没用的很爽。对于Unicode解码的文件、email我都改用了别的工具。官方说emacs的下一版对unicode解码更好了，大家有兴趣可以去试用emacs-cvs版。
;;3，emacs在windows的中文设置，以及Xemacs在linux和Windows的设置我不清楚，没用过，不能保证这些方法能适用你们。

;;;;日历基本配置
;;设置我所在地方的经纬度，calendar里有个功能是日月食的预测，和你的经纬度相联系的。
;;(setq calendar-latitude +39.9)
;;(setq calendar-longitude +116.4)
;;;;我的所在地北京，欢迎大家来找北京请我吃饭
;;(setq calendar-location-name "Beijing")
;;;;这个做什么的？忘了，有谁能告诉我，谢谢。
;;;;我的配置文件里很多东西忘了，欢迎大家来指正下
;;(setq calendar-remove-frame-by-deleting t)
;;;;设定一周的开始为周一
;;(setq calendar-week-start-day 1)
;;;;节日和生日提醒设置
;;;;我不过基督徒的节日、希伯来人的节日和伊斯兰教的节日。
;;;;我是无神论者，不过我喜欢神话，大家有兴趣也可以探讨一下，发email给我吧
;;(setq christian-holidays nil)
;;(setq hebrew-holidays nil)
;;(setq islamic-holidays nil)
;;;;设定一些自定义的生日和节日
;;;;隐私需要，删掉朋友的生日
;;;;后面那些农历节日需要每年根据日历修改
;;;;有些可惜，没有中国传统农历，谁能写个扩展elisp包弄一下
;;(setq general-holidays '((holiday-fixed 1 1 "元旦")
;;(holiday-fixed 3 8 "妇女节")
;;(holiday-fixed 4 1 "愚人节")
;;(holiday-fixed 4 11 "谁的生日")
;;(holiday-fixed 5 1 "劳动节")
;;(holiday-fixed 10 1 "国庆节")
;;(holiday-fixed 12 25 "圣诞节")
;;(holiday-fixed 2 5 "元宵节")
;;(holiday-fixed 4 4 "清明节")
;;(holiday-fixed 4 21 "鬼节")
;;(holiday-fixed 6 22 "端午节")
;;(holiday-fixed 9 28 "中秋节")
;;(holiday-float 5 0 2 "母亲节")
;;(holiday-float 6 0 3 "父亲节")
;;))
;;;;其他的一些设置
;;;;日历不和日记相连，我不用Calendar自带的diary记日记
;;(setq mark-diary-entries-in-calendar nil)
;;;;这个又忘了，我真是忘性好！
;;(setq appt-issue-message nil)
;;;;在日历中突出标记节日和生日
;;(setq mark-holidays-in-calendar t)
;;打开calendar自动打开节日和生日列表
;;(setq view-calendar-holidays-initially t)
;;
;;;;下面两个是设置年份为中国年，好像默认的是用英文写的，由王垠修改的。
;;;;这个设置在节日列表的春节那天能看到，如今年的春节他就写着
;;;;Thursday, January 22, 2004: Chinese New Year (甲-申)
;;(setq chinese-calendar-celestial-stem
;;["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
;;(setq chinese-calendar-terrestrial-branch
;;["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])
;;
