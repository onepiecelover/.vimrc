syn on
" 解决插入模式下delete/backspce键失效问题
set backspace=2

set laststatus=2 "始终显示状态栏
set tabstop=2 "一个制表符的长度
set softtabstop=2 "一个制表符的长度（可以大于tabstop）
set shiftwidth=2 "一个缩进的长度 set expandtab "使用空格替代制表符
set smarttab "智能制表符
set autoindent "自动缩进
set smartindent "只能缩进
set number "显示行号
set ruler "显示位置指示器
set hls "检索时高亮显示匹配项
set helplang=cn "帮助系统设置为中文

set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
"setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


let g:go_fmt_command = "goimports"
" 解决nerdcommenter 注释会删除的问题
let g:mapleader = ","


"-----------------------------------------------------
"---------------------YCM 配置------------------------
"-----------------------------------------------------

" 补全菜单的开启与关闭
set completeopt=longest,menu                    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_min_num_of_chars_for_completion=2     " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_autoclose_preview_window_after_completion=1           " 智能关闭自动补全窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口

" 开启各种补全引擎
let g:ycm_collect_identifiers_from_tags_files=1         " 开启 YCM 基于标签引擎
let g:ycm_auto_trigger = 1                  " 开启 YCM 基于标识符补全，默认为1
let g:ycm_seed_identifiers_with_syntax=1                " 开启 YCM 基于语法关键字补全
let g:ycm_complete_in_comments = 1              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 注释和字符串中的文字也会被收入补全

"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>           " force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>

"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"map <C-d> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf=0                  " 关闭加载.ycm_extra_conf.py确认提示



"-----------------------------------------------------
"---------------------NERDTree配置--------------------
"-----------------------------------------------------
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
"autocmd VimEnter * NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 当vim中没有其他文件，值剩下nerdtree的时候，自动关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
"let NERDTreeWinPos="left"

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1

" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
map <C-n> :NERDTreeToggle<CR>


"--------------------------------------------------------------------------
"vim-airline
"--------------------------------------------------------------------------
let g:airline_theme="molokai"

"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1

 "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
 nnoremap <C-tab> :bn<CR>
 nnoremap <C-s-tab> :bp<CR>
 " 关闭状态显示空白符号计数
 let g:airline#extensions#whitespace#enabled = 0
 let g:airline#extensions#whitespace#symbol = '!'
 " 设置consolas字体"前面已经设置过
 "set guifont=Consolas\ for\ Powerline\ FixedD:h11
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  " old vim-powerline symbols

let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'


"--------------------------------------------------------------------------
"gotags
"--------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


"------------------------------------------------------------

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
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Blackrush/vim-gocode'
Plugin 'fatih/vim-go'
Plugin 'dgryski/vim-godef'
Plugin 'majutsushi/tagbar'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


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

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
