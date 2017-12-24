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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

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

let g:jedi#use_splits_not_buffers = "right"
" let g:jedi#force_py_version = 3
let g:jedi#show_call_signatures = 2
set noshowmode
let g:jedi#popup_select_first=0
set completeopt=longest,menuone
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0



Plugin 'Shougo/neocomplete.vim'
 "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
 " Disable AutoComplPop.
 let g:acp_enableAtStartup = 0
 " Use neocomplete.
 let g:neocomplete#enable_at_startup = 1
 " Use smartcase.
 let g:neocomplete#enable_smart_case = 1
 " Set minimum syntax keyword length.
 let g:neocomplete#sources#syntax#min_keyword_length = 3
 let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

 " Define dictionary.
 let g:neocomplete#sources#dictionary#dictionaries = {
     \ 'default' : '',
     \ 'vimshell' : $HOME.'/.vimshell_hist',
     \ 'scheme' : $HOME.'/.gosh_completions'
         \ }

 " Define keyword.
 if !exists('g:neocomplete#keyword_patterns')
     let g:neocomplete#keyword_patterns = {}
 endif
 let g:neocomplete#keyword_patterns['default'] = '\h\w*'

 " Plugin key-mappings.
 inoremap <expr><C-g>     neocomplete#undo_completion()
 inoremap <expr><C-l>     neocomplete#complete_common_string()

 " Recommended key-mappings.
 " <CR>: close popup and save indent.
 inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
 function! s:my_cr_function()
   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
   " For no inserting <CR> key.
   "return pumvisible() ? "\<C-y>" : "\<CR>"
 endfunction
 " <TAB>: completion.
 inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
 " <C-h>, <BS>: close popup and delete backword char.
 inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
 inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
 " Close popup by <Space>.
 "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

 " AutoComplPop like behavior.
 "let g:neocomplete#enable_auto_select = 1

 " Shell like behavior(not recommended).
 "set completeopt+=longest
 "let g:neocomplete#enable_auto_select = 1
 "let g:neocomplete#disable_auto_complete = 1
 "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

 " Enable omni completion.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=jedi#completions
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

 " Enable heavy omni completion.
 if !exists('g:neocomplete#sources#omni#input_patterns')
   let g:neocomplete#sources#omni#input_patterns = {}
 endif
 "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
 "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
 "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

 " For perlomni.vim setting.
 " https://github.com/c9s/perlomni.vim
 let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

 let g:neocomplete#enable_auto_select = 0
 if !exists('g:neocomplete#force_omni_input_patterns')
         let g:neocomplete#force_omni_input_patterns = {}
 endif
 let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\)\w*'

 " Called once right before you start selecting multiple cursors
 function! Multiple_cursors_before()
   if exists(':NeoCompleteLock')==2
     exe 'NeoCompleteLock'
   endif
 endfunction

 " Called once only when the multiple selection is canceled (default <Esc>)
 function! Multiple_cursors_after()
   if exists(':NeoCompleteUnlock')==2
     exe 'NeoCompleteUnlock'
   endif
 endfunction






" 语法检查插件
" Plugin 'https://github.com/vim-syntastic/syntastic.git'
" python 语法检查
" Plugin 'https://github.com/PyCQA/pylint.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'Indent-Guides' " 缩进提示线

call vundle#end()            " required
filetype plugin indent on    " required
