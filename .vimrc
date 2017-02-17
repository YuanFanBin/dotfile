" import .vimrc
" ======================================================================
"
"
" 判断操作系统、终端 or Gvim
" --------------------------------BEGIN---------------------------------
" Windows or Linux
let g:isWindows = 0
let g:isLinux = 1
if (has("win32") || has("win64") || has("win95") || has("win16"))
  let g:isWindows = 1
else
  let g:isLinux = 1
endif
" --------------------------------END-----------------------------------
"
"
" 针对Gvim处理图形界面
" --------------------------------BEGIN---------------------------------
set go=                     " 不要图形按钮
"set guioptions-=m          " 菜单
"set guioptions-=T          " 工具条
set guioptions+=r           " 滚动条
"set guioptions-=L
"au GUIEnter * simalt ~x    " Gvim启动时自动最大化
" winpos 300 80             " 窗口出现位置
"set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI " 设置字体（需安装）
" --------------------------------END-----------------------------------
"
" 字体及编码解码设置
" --------------------------------BEGIN---------------------------------
set nocompatible
" 禁用vi兼容模式，避免以前版本BUG和局限性
" 逐步检查，探测文件编码格式，以正确格式打开
set fencs=utf-8,ucs-bom,gbk,shift-jis,gb18030,gb2312,cp936,latin-1
"if g:isWindows
"  set encoding=gbk " 设置默认编码格式
"  set fenc=gbk " 设置当前使用和保存的编码格式
"endif

"if g:isLinux
  set encoding=utf-8
  set fenc=utf-8
"endif
" --------------------------------END-----------------------------------
"
" 默认配置
" --------------------------------BEGIN---------------------------------
syntax on                       " 语法高亮
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
"set cursorcolumn               " 突出显示当前列

set matchtime=1                 " 匹配括号高亮时间(单位0.1 sec)
set showmatch                   " 高亮显示匹配的括号
set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在被分割的窗口间显示空白，便于阅读
" --------------------------------END-----------------------------------
"
"  状态栏配置
" --------------------------------BEGIN---------------------------------
set laststatus=2 " 启用状态栏信息 [1]启动显示 [2]总是显示
set ruler        " 显示标尺
set showcmd      " 显示键入命令
set cmdheight=2  " 设置命令行高度为2,默认1
set wildmenu     " 增强模式下命令行Tab
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}  " 状态行显示的内容
" --------------------------------END-----------------------------------
"
"  键盘映射
" --------------------------------BEGIN---------------------------------
" CTRL+A 全选复制
" map <C-A> ggVGY
" 删除空行
map <F2> :g/^\s*$/d<CR>
" ALT+F2 新建标签
map <M-F2> :tabnew<CR>

" 键入cS清除行尾空格-clear space
nmap cS :%s/\s\+$//g<CR>:noh<CR>
" 键入cM清除行尾^M-clear ^M
nmap cM :%s/\r$//g<CR>:noh<CR>
"autocmd vimenter * copen 5
" --------------------------------END-----------------------------------
"
" 其他配置
" --------------------------------BEGIN---------------------------------
set writebackup            " 保存文件前建立备份,保存成功后删除备份
set nobackup               " 设置无备份文件
set clipboard+=unnamed     " 共享剪切板
set confirm                " 保存只读文件时,弹出确认
set history=1000           " 历史记录数
set iskeyword+=_,$,@,%,#,- " 带有如下符号单词不被换行分割

if version >= 603
  set helplang=cn          " 显示中文帮助
endif
filetype off               " 启用文件类型侦测
filetype plugin on         " 针对不同文件类型加载对应插件
filetype plugin indent on  " 特定文件特定缩进
" quickfix模式
autocmd FileType c,cpp map <buffer><leader><space> :w<cr>:make<cr>
" --------------------------------END-----------------------------------
"
" 配色及主题
" --------------------------------BEGIN---------------------------------
set background=dark        " 背景色
colorscheme desert         " 主题颜色
hi Search term=bold ctermbg=5 guibg=DarkMagenta
hi IncSearch term=bold ctermbg=5 guibg=DarkMagenta
" --------------------------------END-----------------------------------
"
" 自动加载
" --------------------------------BEGIN---------------------------------
" javascript settings
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
" --------------------------------END-----------------------------------
"
" ================================LEADER================================
" leader 键配置
" --------------------------------BEGIN---------------------------------
let mapleader = " "
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>h <C-W>h
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>l <C-W>l
nmap <leader>tn :tabnew .<CR>
nmap <leader>ml :set ft=html<CR>
nmap <leader>> <C-W>5>
nmap <leader>< <C-W>5<
nmap <leader>f :noautocmd execute "lvimgrep /" . expand("<cword>") . "/gj **/*" <Bar> lw<CR>
nmap <leader>s :Ack<CR>
" --------------------------------END-----------------------------------
"
" ================================PLUGIN================================
" Vundle
" --------------------------------BEGIN---------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" vim-commentary
Plugin 'tpope/vim-commentary'
" vim-surround
Plugin 'tpope/vim-surround'
" L9
Plugin 'L9'
" sparkup
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" install nerdtree
Plugin 'scrooloose/nerdtree'
" emment
Plugin 'emmetio/emmet'
" html5
Plugin 'othree/html5.vim'
" tagbar
Plugin 'majutsushi/tagbar'
" neocomplacche
Plugin 'shougo/neocomplcache.vim'
" auto-pairs
Plugin 'jiangmiao/auto-pairs'
" phpcomplete
Plugin 'shawncplus/phpcomplete.vim'
" powerline fonts
"Plugin 'powerline/fonts'
" vim-airline
Plugin 'bling/vim-airline'
" vim-json
Plugin 'elzr/vim-json'
" vim-go
Plugin 'fatih/vim-go'
" tabular
Plugin 'godlygeek/tabular'
" php.vim
Plugin 'stanangeloff/php.vim'
" ctrlp
Plugin 'kien/ctrlp.vim'
" syntastic 语法检查
Plugin 'scrooloose/syntastic'
" vim-gitgutter git修改提示
Plugin 'airblade/vim-gitgutter'
" ycm
Plugin 'valloric/youcompleteme'
" ack 项目词搜索( install 'ack' command )
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
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
" --------------------------------END-----------------------------------
"
" html5 setting
" --------------------------------BEGIN---------------------------------
let g:html5_event_handler_attributes_complete = 0
" --------------------------------END-----------------------------------
"
" nerdtree settings
" --------------------------------BEGIN---------------------------------
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
auto VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <silent> <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" --------------------------------END-----------------------------------
"
" airline settings
" --------------------------------BEGIN---------------------------------
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
" --------------------------------END-----------------------------------
"
" emment settings
" --------------------------------BEGIN---------------------------------
let g:user_emmet_mode='n'
let g:user_emmet_mode='inv'
let g:user_emmet_mode='a'
let g:emmet_html5=0
let g:user_emmet_install_global=0

" autocmd FileType html,css,EmmetInstall
" --------------------------------END-----------------------------------
"
" neocompletecache settings
" --------------------------------BEGIN---------------------------------
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
" --------------------------------END-----------------------------------
"
" ctrlp settings
" --------------------------------BEGIN---------------------------------
let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd='CtrlP'

let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip "Linux/MaxOSX
let g:ctrlp_user_command='find %s -type f' "MaxOSX/Linux
" --------------------------------END-----------------------------------
"
" nerdtree
" --------------------------------BEGIN---------------------------------
let NERDTreeWinSize = 20     " 大小
" --------------------------------END-----------------------------------
"
" vimtweak
" --------------------------------BEGIN---------------------------------
" 功能:
" 1.快捷键CTRL+PageUp/PageDown 改变透明度;
" 2.CTRL+F11改变置顶状态(有置顶信息提示!);
" 3.F11改变切换窗口最大化;
let g:vimtweakTrans      = 255 "定义初始透明度 0~255
let g:vimtweakTransDelta = 30 "定义每次增加/减少的透明度值 0~255
let g:vimtweakTransMini  = 20 "定义最小的透明度 0~255
let g:vimtweakTopMost    = 0 "定义初始是否置顶
let g:vimtweakMaximized  = 0 "定义初始是否最大化

au GUIEnter * call libcallnr("vimtweak.dll","EnableTopMost",g:vimtweakTopMost)
au GUIEnter * call libcallnr("vimtweak.dll","SetAlpha",g:vimtweakTrans)
au GUIEnter * call libcallnr("vimtweak.dll","EnableMaximize",g:vimtweakMaximized)

map <C-PageUp>   :call TransUp()<CR>
map <C-PageDown> :call TransDown()<CR>
map <C-F11>      :call SetAlwaysTop()<CR>
map <F11>        :call SetMaximized()<CR>
" --------------------------------END-----------------------------------
"
" CTags & Taglist
" --------------------------------BEGIN---------------------------------
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
" 打开和关闭Taglist
nmap <silent> <F9> :TlistToggle<CR>
" --------------------------------END-----------------------------------
"
" syntatic
" --------------------------------BEGIN---------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" --------------------------------END-----------------------------------
" ================================PLUGIN================================
"
" ================================FUNCTION==============================

" Gvim透明度上调
func! TransUp()
  let g:vimtweakTrans += g:vimtweakTransDelta
  let g:vimtweakTrans = (g:vimtweakTrans > 255 ? 255 : g:vimtweakTrans)
  call libcallnr("vimtweak.dll", "SetAlpha", g:vimtweakTrans)
endfunc

" Gvim透明度下调
func! TransDown()
  let g:vimtweakTrans -= g:vimtweakTransDelta
  let g:vimtweakTrans = (g:vimtweakTrans < g:vimtweakTransMini ? g:vimtweakTransMini : g:vimtweakTrans)
  call libcallnr("vimtweak.dll", "SetAlpha", g:vimtweakTrans)
endfunc

" Gvim总是最前
func! SetAlwaysTop()
  let g:vimtweakTopMost = (g:vimtweakTopMost ? 0 : 1)
  call libcallnr("vimtweak.dll", "EnableTopMost", g:vimtweakTopMost)
  if g:vimtweakTopMost == 1
    exec "echo \"Always Top.\""
  else
    exec "echo \"Cancel Always Top.\""
  endif
endfunc

" Gvim窗口最大化
func! SetMaximized()
  let g:vimtweakMaximized = (g:vimtweakMaximized ? 0 : 1)
  call libcallnr("vimtweak.dll", "EnableMaximize", g:vimtweakMaximized)
  if g:vimtweakMaximized == 1
    exec "echo \"The Maximum.\""
  else
    exec "echo \"Cancel The Maximization.\""
  endif
endfunc

" 自动插入文件头
"autocmd BufNewFile *.cpp *.[ch], *.sh, *.java exec :call SetTitle()
" 设置文件头
func! SetTitle()
  if &filetype == 'sh'
    call setline(1,"\# ")
    call append(line("."), "\# File Name: ".expand("%"))
    call append(line(".")+1, "\# Author: fanbin")
  endif
  " 新建文件后,自动定位到文件末尾
  autocmd BufNewFile * normal G
endfunc
" ================================FUNCTION==============================
