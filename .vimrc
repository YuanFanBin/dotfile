" vim:fdm=marker
" Copyright: Copyright (C) 2013-2017 YuanFanBin
" License: The MIT License
" Email: yuanfanbin@gmail.com
"
"------------------------------------------
" My Keyboard Layout
"------------------------------------------
" [NORMAL]
"------------------------------------------
" __ESC__ 1 2 3 4 5 6 7 8 9 0 - = BACKSPACE
" __TAB___ q w e r t y u i o p [ ] ___\____
" CAPSLOCK_ a s d f g h j k l ; ' __ENTER__
" __SHIFT__  z x c v b n m , . / ___SHIFT__
" CTRL WIN ALT ____SPACE____ ALT FN PN CTRL
"------------------------------------------
" [SHIFT + ]
"------------------------------------------
" __ESC__ ! @ # $ % ^ & * ( ) _ + BACKSPACE
" __TAB___ Q W E R T Y U I O P { } ___|____
" CAPSLOCK_ A S D F G H J K L : " __ENTER__
" __SHIFT__  Z X C V B N M < > ? ___SHIFT__
" CTRL WIN AL ____SPACE____ ALT FN PN CTRL
"------------------------------------------

" LEADER 键配置 {{{
" --------------------------------BEGIN----------------------------------------
let mapleader = " "
" --------------------------------------
"  [Layout Operator]
nmap <LEADER>w :w<CR>
nmap <LEADER>q :q<CR>
nmap <LEADER>h <C-W>h
nmap <LEADER>j <C-W>j
nmap <LEADER>k <C-W>k
nmap <LEADER>l <C-W>l
nmap <LEADER>t :tabnew .<CR>
nmap <LEADER>> <C-W>5>
nmap <LEADER>< <C-W>5<
" --------------------------------------
"  [Command Operator]
" ack.vim: 利用 ack 命令搜索字符串，结果呈现在 quickfix window 中
nmap <LEADER>a :Ack<CR>
" 利用 fzf 命令搜索项目文件(类似 CTRL+P 插件功能)
nmap <LEADER>f :FZF<CR>
" cscope
nmap <LEADER>d :cs find g <cword><CR>       " 查找定义
nmap <LEADER>s :cs find s <cword><CR>       " 查找symbol
nmap <LEADER>c :cs find c <cword><CR>       " 查找calling
" colorscheme
nmap <LEADER>cs :colorscheme morning<CR> :hi Pmenu ctermfg=0 ctermbg=100 guibg=LightMagenta<CR>
" diff
nmap <LEADER>dt :diffthis<CR>
nmap <LEADER>do :diffoff<CR>
nmap <LEADER>cp :set fo-=r<CR>
nmap <LEADER>ucp :set fo=r<CR>
" set width
nmap <LEADER>- :vertical resize 84<CR> " 4: numberwidth
nmap <LEADER>= :vertical resize 86<CR> " 6: numberwidth + git icon width
" --------------------------------------
"  [Plugin Operator]
" vim-hsftp
nmap <LEADER>uf :Hupload<CR>
nmap <LEADER>ud :Hupdir<CR>
" NERDTree
nmap <LEADER>n :let NERDTreeWinPos="left"<CR> :NERDTree<CR>
nmap <LEADER>r :let NERDTreeWinPos="right"<CR> :NERDTree<CR>
" Tagbar
nmap <LEADER>b :Tagbar<CR>
" --------------------------------------
" --------------------------------------
"  [Golang]
nmap <LEADER>m :GoDoc<CR>
" --------------------------------------
" --------------------------------END------------------------------------------
"  }}}
"
"  键盘映射 {{{
" --------------------------------BEGIN----------------------------------------
" CTRL+A 全选复制
" map <C-A> ggVGY
" 删除空行
map <F2> :g/^\s*$/d<CR>
" 键入cS清除行尾空格-clear space
nmap cS :%s/\s\+$//g<CR>:noh<CR>
" 键入cM清除行尾^M-clear ^M
nmap cM :%s/\r$//g<CR>:noh<CR>
"autocmd vimenter * copen 5
" --------------------------------END------------------------------------------
" }}}
" 
" autocmd {{{
" --------------------------------BEGIN----------------------------------------
autocmd BufWritePre *.* set fenc=utf-8
autocmd FileType js,vue set tabstop=2
autocmd FileType js,vue set shiftwidth=2
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
" Golang
" -------------------------------------
" [1]: Plugin 'fatih/vim-go'
" [2]: :GoInstallBinares
autocmd BufWritePre *.go :GoImports
autocmd BufWritePre *.go :GoErrCheck -abspath
autocmd BufRead *.* :cscope add ./cscope.out
" --------------------------------------
" --------------------------------END------------------------------------------
" }}}
"
" 针对Gvim处理图形界面 {{{
" --------------------------------BEGIN----------------------------------------
set go=                     " 不要图形按钮
"set guioptions-=m          " 菜单
"set guioptions-=T          " 工具条
set guioptions+=r           " 滚动条
"set guioptions-=L
"au GUIEnter * simalt ~x    " Gvim启动时自动最大化
" winpos 300 80             " 窗口出现位置
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI " 设置字体（需安装）
" --------------------------------END------------------------------------------
" }}}
"
" 字体及编码解码设置 {{{
" --------------------------------BEGIN----------------------------------------
set nocompatible
" 禁用vi兼容模式，避免以前版本BUG和局限性
" 逐步检查，探测文件编码格式，以正确格式打开
set fencs=utf-8,ucs-bom,gbk,shift-jis,gb18030,gb2312,cp936,latin-1
set encoding=utf-8
set fenc=utf-8
" --------------------------------END------------------------------------------
" }}}
"
" 默认配置 {{{
" --------------------------------BEGIN----------------------------------------
syntax on                       " 语法高亮
set mouse=a
set backspace=2                 " 使backspace正常处理indent，eol，start等
set smartindent                 " 启用智能缩进
set autoindent                  " 自动缩进
set cindent
set tabstop=4                   " 设置TAB键宽度
set expandtab                   " 将tab的\t装换成空格(noexpandtab)
set shiftwidth=4                " 换行时自动缩进2个空格
set smarttab                    " 在行和段开始处使用制表符
set autoread                    " 当文件在外部修改时自动更新
set autowrite                   " 自动保存
set ignorecase                  " 搜索忽略大小写
set hlsearch                    " 搜索高亮(nohlsearch)
set incsearch                   " 搜索逐字符高亮
set magic                       " 设置魔术 与正则表达式有关
set completeopt=longest,menu    " 代码补全
set nu                          " 行号
set backspace=eol,start,indent  " backspace
set whichwrap+=<,>,h,l
set cursorline                  " 突出显示当前行
" set cursorcolumn               " 突出显示当前列

set matchtime=1                 " 匹配括号高亮时间(单位0.1 sec)
set showmatch                   " 高亮显示匹配的括号
set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在被分割的窗口间显示空白，便于阅读
" --------------------------------END------------------------------------------
" }}}
"
"  状态栏配置 {{{
" --------------------------------BEGIN----------------------------------------
set laststatus=2 " 启用状态栏信息 [1]启动显示 [2]总是显示
set ruler        " 显示标尺
set showcmd      " 显示键入命令
set cmdheight=1  " 设置命令行高度为1,默认1
set wildmenu     " 增强模式下命令行Tab
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" --------------------------------END------------------------------------------
" }}}
"
" 其他配置 {{{
" --------------------------------BEGIN----------------------------------------
set writebackup                 " 保存文件前建立备份,保存成功后删除备份
set nobackup                    " 设置无备份文件
" set clipboard+=unnamed        " 共享剪切板
set clipboard+=unnamedplus      " 共享剪切板
set confirm                     " 保存只读文件时,弹出确认
set history=1000                " 历史记录数
set iskeyword+=_,$,@,%,#,-      " 带有如下符号单词不被换行分割

if version >= 603
  set helplang=cn               " 显示中文帮助
endif
filetype off                    " 启用文件类型侦测
filetype plugin on              " 针对不同文件类型加载对应插件
filetype plugin indent on       " 特定文件特定缩进
" quickfix模式
autocmd FileType c,cpp map <buffer><LEADER><space> :w<cr>:make<cr>
set rtp+=/usr/local/opt/fzf " fzf
" --------------------------------END------------------------------------------
" }}}
"
" 配色及主题 {{{
" --------------------------------BEGIN----------------------------------------
" set background=dark             " 背景色
" hi Search term=bold ctermbg=5 guibg=DarkMagenta
" hi IncSearch term=bold ctermbg=5 guibg=DarkMagenta
colorscheme desert              " 主题颜色(desert, industry, morning, murphy)
" hi Search ctermfg=0 ctermbg=225 guibg=LightMagenta
" hi IncSearch ctermfg=0 ctermbg=225 guibg=LightMagenta
" fold
hi Folded term=bold,underline ctermbg=255 guibg=LightMagenta
" Pmenu
hi PmenuSel term=underline cterm=underline gui=underline ctermbg=81 guibg=LightBlue
" --------------------------------END------------------------------------------
" }}}
"
" PLUGIN {{{
" ================================PLUGIN=======================================
" --------------------------------BEGIN----------------------------------------
set nocompatible                " be iMproved, required
filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'           " vim-commentary 快捷注释(`gc`) 支持 `:Visual`
Plugin 'tpope/vim-surround'
Plugin 'L9'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
" Plugin 'emmetio/emmet'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'powerline/fonts'                " 需手动安装一下字体
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'stanangeloff/php.vim'
" Plugin 'kien/ctrlp.vim'               " ctrlp 模糊搜索
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plugin 'scrooloose/syntastic'           " syntastic 语法检查
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'         " vim-gitgutter git修改提示
" Plugin 'valloric/youcompleteme'         " ycm
" Plugin 'shawncplus/phpcomplete.vim'
" Plugin 'shougo/neocomplcache.vim'
Plugin 'mileszs/ack.vim'                " ack 项目词搜索( install 'ack' command )
Plugin 'easymotion/vim-easymotion'      " 快速跳转
Plugin 'terryma/vim-multiple-cursors'   " 多光标操作
Plugin 'hesselbom/vim-hsftp'            " sftp 上传下载文件
Plugin 'tpope/vim-dispatch'
Plugin 'darthmall/vim-vue'              " Vue.js syntax
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" --------------------------------END------------------------------------------
"
" vim-vue {{{
" --------------------------------BEGIN----------------------------------------
" $ npm i -g eslint eslint-plugin-vue
" --------------------------------END------------------------------------------
" }}}
"
" php.vim {{{
" --------------------------------BEGIN----------------------------------------
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
" --------------------------------END------------------------------------------
" }}}
"
" html5 setting {{{
" --------------------------------BEGIN----------------------------------------
let g:html5_event_handler_attributes_complete = 1
" --------------------------------END------------------------------------------
" }}}
"
" nerdtree settings {{{
" --------------------------------BEGIN----------------------------------------
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
auto VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" --------------------------------END------------------------------------------
" }}}
"
" airline settings {{{
" --------------------------------BEGIN----------------------------------------
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set laststatus=2
set t_Co=256
let g:Powerline_symbols='fancy'
set guifont=DejaVu_Sans_Mono_for_Powerline:h10 "config font for gvim
set encoding=utf-8
set fenc=gbk
" 解决菜单乱码问题
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决consle输出乱码
language messages zh_CN.utf-8
" --------------------------------END------------------------------------------
" }}}
"
" emment settings {{{
" --------------------------------BEGIN----------------------------------------
let g:user_emmet_mode='n'
let g:user_emmet_mode='inv'
let g:user_emmet_mode='a'
let g:emmet_html5=0
let g:user_emmet_install_global=0
let g:user_emmet_leader_key='<C-J>'
autocmd FileType html,css,vue EmmetInstall
" --------------------------------END------------------------------------------
" }}}
"
" neocompletecache settings {{{
" --------------------------------BEGIN----------------------------------------
let g:acp_enableAtStartup=0
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_lock_buffer_name_pattern='\*ku\*'

inoremap <expr><C-g> neocomplcache#unde_completion()
inoremap <expr><C-l> neocomplcache#comlete_common_string()

"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancle_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#ComplateTags
" --------------------------------END------------------------------------------
" }}}
"
" ctrlp settings {{{
" --------------------------------BEGIN----------------------------------------
"let g:ctrlp_map='<C-p>'
"let g:ctrlp_cmd='CtrlP'
"
"let g:ctrlp_working_path_mode='ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip "Linux/MaxOSX
"let g:ctrlp_user_command='find %s -type f' "MaxOSX/Linux
" --------------------------------END------------------------------------------
" }}}
"
" nerdtree {{{
" --------------------------------BEGIN----------------------------------------
let NERDTreeWinSize = 20     " 大小
" --------------------------------END------------------------------------------
" }}}
"
" vimtweak {{{
" --------------------------------BEGIN----------------------------------------
" windows Gvim 透明
" --------------------------------END------------------------------------------
" }}}
"
" CTags & Taglist {{{
" --------------------------------BEGIN----------------------------------------
" 功能：
" 1.<F9>打开和关闭Taglist
let Tlist_Sort_Type            = "name"  " 按照名称排序
let Tlist_Show_One_file        = 1     " 只显示当前文件的tag
let Tlist_Use_Right_Window     = 1      " 在右侧显示Taglist
let Tlist_Use_SingleClick      = 1     " 单击tag就跳转到定义
let Tlist_Compart_Format       = 1      " 压缩方式
let Tlist_Exist_OnlyWindow     = 1      " 如果Taglist是最后一个窗口则退出Vim
let Tlist_File_Fold_Auto_Close = 0      " 不要关闭其他文件的tags
let Tlist_Enable_Fold_Column   = 0      " 不要显示折叠树
" 使用:TlistToggle打开Taglist时，输入焦点在Taglist
let Tlist_GainFocus_On_ToggleOpen   = 0
" --------------------------------END------------------------------------------
" }}}
"
" syntatic {{{
" --------------------------------BEGIN----------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" eslint: https://github.com/eslint/eslint#global-installation-and-usage
" ~/.eslintrc.js
let g:syntastic_javascript_checkers = ['eslint']
" 其他语法检测依赖 (如: js, css, python, xml ...)
" https://github.com/humiaozuzu/dot-vimrc#dependencie
" --------------------------------END------------------------------------------
" }}}
"
" vim-hsftp {{{
" --------------------------------BEGIN----------------------------------------
" $ vim your-project/.hsftp
" ```.hsftp
" host   1.1.1.1
" user   username
" pass   test123
" port   22
" remote /var/www/
" confirm_download 0
" confirm_upload 0
" ```
" 改一下代码，更加方便
" $ ~/.vim/bundle/vim-hsftp/plugin/hsftp.vim
"   ---> H_UploadFile
" +   let prompt = printf('Upload file %s?', conf['localpath'])
" +   let choice = confirm(prompt, "&Yes\n&No", 2)
"   ---> H_UploadFolder
" +   let local_dir = expand('%:p:h')
" +   let remote_dir = conf['remote'] . expand('%:h:h')
" +   let choice  = confirm(printf('Upload dir %s?', local_dir), "&Yes\n&No", 2)
" +   if choice != 1
" +       echo 'Canceled.'
" +       return
" +   endif
" +   let action = action . printf('expect \"sftp>\"; send \"put -r %s %s\r\";', local_dir, remote_dir)
" -   if conf['confirm_upload'] == 1
" -     let prompt = printf('Upload file %s?', conf['localpath'])
" -     let choice = confirm(prompt, "&Yes\n&No", 2)
" -     if choice != 1
" -       echo 'Canceled.'
" -       return
" -     endif
" -   endif
" --------------------------------END------------------------------------------
" }}}
"
" vim-gitgutter {{{
" --------------------------------BEGIN----------------------------------------
set updatetime=250
" --------------------------------END------------------------------------------
" }}}
"
" kien/rainbow_parentheses.vim {{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}
" ================================PLUGIN=======================================
" }}}
