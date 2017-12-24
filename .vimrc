set number  "显示行号"
set backspace=indent,eol,start
set ruler                   " 打开状态栏标尺
syntax enable "开启语法高亮"
syntax on "允许用指定语法高亮配色方案替换默认方案"
"let g:molokai_original = 1"
""let g:rehash256 = 1"
colorscheme desert          " 设定配色方案
set tabstop=4               " 设定 tab 长度为 4
set ts=4
set expandtab
" 解决复制的缩进问题
nnoremap  :set invpaste paste? imap :set invpaste paste? set pastetoggle=
" 禁止在注释的下一行还是注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:SuperTabDefaultCompletionType = "context"  
let g:jedi#popup_on_dot = 0
" 代码补全
execute pathogen#infect()


 " NERDTree config
 map <F2> :NERDTreeToggle<CR>
 " 如果nerdTree是最后一个页面,则关闭
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" 配置Syntastic 拼写检查
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" 
" let g:syntastic_python_checkers=['pylint']
" let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'




" 配色方案
hi multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
hi link multiple_cursors_visual Visual
hi Pmenu term=reverse ctermbg=12 ctermfg=248 gui=undercurl guisp=Blue guibg=Blue guifg=wheat
hi PmenuSel term=bold ctermbg=DarkGray ctermfg=7
hi Folded term=bold ctermfg=3 gui=bold guifg=khaki
hi FoldColumn term=bold ctermfg=3 gui=bold guifg=khaki
hi PreProc  term=standout cterm=bold ctermfg=6 ctermbg=0 guifg=Cyan guibg=Grey
hi Constant term=bold cterm=bold ctermfg=3 gui=bold guifg=Yellow
hi Type term=standout cterm=bold ctermfg=2 gui=bold guifg=springgreen
hi Cursor term=reverse cterm=reverse gui=reverse
hi CursorColumn term=reverse cterm=reverse gui=reverse
hi Comment term=bold ctermfg=2 gui=bold guifg=SeaGreen
hi Number term=bold  cterm=bold ctermfg=1 gui=bold guifg=salmon
hi Constant term=bold ctermfg=3 gui=bold guifg=khaki
hi Identifier term=standout cterm=bold ctermfg=6 ctermbg=0 guifg=Cyan guibg=Grey
hi Statement term=underline ctermfg=6 guifg=palegreen
hi MatchParen  ctermbg=red ctermfg=white
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

" 快捷键
" 粘贴的时候禁止缩进,用法: 在粘贴之前先F9,然后粘贴.正常插入模式下没有问题
set pastetoggle=<F9>

" Vundle 插件
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
" 应该是tab键功能
Plugin 'ervandew/supertab'
" 代码补全
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" 代码补全插件
Plugin 'https://github.com/davidhalter/jedi-vim.git'
" 语法检查插件
" Plugin 'https://github.com/vim-syntastic/syntastic.git'
" python 语法检查
" Plugin 'https://github.com/PyCQA/pylint.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
