set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


imap {<CR> {<CR>}<ESC>O
imap {<S-CR> {<CR>}<ESC>O

colorscheme evening
set ignorecase "检索时忽略大小写
set smartcase
set noswapfile
set bufhidden=hide
set cursorline
set lines=40 columns=120
set fileencodings=utf-8,gbk
set go=r
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set nobackup
set backspace=2
"set bs=eol,start,indent  "backspace

" gf命令
set path+=D:/msys32/mingw32/i686-w64-mingw32/include,D:/msys32/mingw32/include/c++/4.9.2,D:/msys32/mingw32/include,D:/msys32/mingw32/lib/gcc/i686-w64-mingw32/4.9.2/include

" cscope setting
if filereadable("cscope.out")
	cs add D:/msys32/mingw32/i686-w64-mingw32/include/cscope.out
	cs add cscope.out
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

autocmd filetype makefile setlocal noexpandtab

" ctags58
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR>


" vundle setting
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
let path='~/vimfiles/bundle'
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" my plugin
"+++++Plugin vim-airline start+++++
Plugin 'bling/vim-airline'

set laststatus=2
"-----Plugin vim-airline end-----

"+++++Plugin SuperTab start+++++
Plugin 'ervandew/supertab'

let g:SuperTabRetainCompletionType=2 
"let g:SuperTabDefaultCompletionType='<C-X><C-U><C-P>'
let g:SuperTabDefaultCompletionType='<C-X><C-U>'
"-----Plugin SuperTab end-----

"+++++Plugin emmet start+++++
Plugin 'mattn/emmet-vim'

let g:user_emmet_leader_key = '<c-y>'
let g:use_emmet_complete_tag = 1
"-----Plugin emmet end-----

"+++++Plugin a start+++++
Plugin 'a.vim'

"-----Plugin a end-----

"+++++Plugin clang_complete start+++++
Plugin 'Rip-Rip/clang_complete'

set completeopt=menu,longest
highlight Pmenu guibg=darkgrey  guifg=black 
highlight PmenuSel guibg=lightgrey guifg=black
let g:clang_use_library = 1
"let g:clang_library_path = "D:/clang/bin"
let g:clang_library_path = "D:/msys32/mingw32/bin"
"let g:clang_user_options = '-ID:/MinGW/include -ID:/MinGW/lib -ID:/MinGW/lib/gcc/mingw32/4.8.1/include/c++ -ID:/MinGW/lib/gcc/mingw32/4.8.1/include/c++/mingw32 -ID:/Qt/4.8.6/include -ID:/Qt/4.8.6/include/Qt -ID:/Qt/4.8.6/include/QtCore -ID:/Qt/4.8.6/include/QtGui -ID:/Qt/4.8.6/include/QtOpenGL -ID:/Qt/4.8.6/include/QtNetwork -ID:/wxWidgets/wxWidgets-2.8.12/include'
"let g:clang_user_options = '-std=c++11 -ID:/msys32/mingw32/i686-w64-mingw32/include -ID:/msys32/mingw32/include/c++/4.8.2 -ID:/msys32/mingw32/include -ID:/msys32/mingw32/lib/gcc/i686-w64-mingw32/4.8.2/include -ID:/cocos2d-x/cocos/2d'
let g:clang_user_options = '-std=c++11 -ID:/msys32/mingw32/i686-w64-mingw32/include -ID:/msys32/mingw32/include/c++/4.9.2 -ID:/msys32/mingw32/include -ID:/msys32/mingw32/lib/gcc/i686-w64-mingw32/4.9.2/include -ID:/Qt/Qt5.3.2/5.3/mingw482_32/include  -ID:/Qt/Qt5.3.2/5.3/mingw482_32/include/QtCore -ID:/Qt/Qt5.3.2/5.3/mingw482_32/include/QtGui -ID:/Qt/Qt5.3.2/5.3/mingw482_32/include/QtWidgets -ID:/Qt/Qt5.3.2/5.3/mingw482_32/include/QtOpenGL  -ID:/Qt/Qt5.3.2/5.3/mingw482_32/mkspecs/win32-g++ -D__GNUC__ -DWIN32'
let g:clang_sort_algo = "alpha"
let g:clang_snippets = 1
let g:clang_auto_select = 1
let g:clang_complete_macros = 1
"let g:clang_complete_copen = 1
"let g:clang_periodic_quickfix = 1
"let g:clang_user_options='-stdlib=libc++ -std=c++11  2>NUL || exit 0'
"-----Plugin clang_complete end-----


"+++++Plugin ultisnips start+++++
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<a-/>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
"let g:UltiSnipsJumpBackwardTrigger='<c-z>'
"let g:UltiSnipsEditSplit="vertical"
"-----Plugin ultisnips end-----


"+++++Plugin neocomplcache start+++++
Plugin 'Shougo/neocomplcache.vim'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c =
     \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplcache_force_omni_patterns.objc =
"      \ '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_force_omni_patterns.objcpp =
"      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:clang_complete_auto = 0
"let g:clang_auto_select = 0
let g:neocomplcache_enable_auto_select = 0
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"-----Plugin neocomplcache end-----


"+++++Plugin vim-commentary start+++++
Plugin 'tpope/vim-commentary'

"-----Plugin vim-commentary end-----


"+++++Plugin NERDTree start+++++
Plugin 'scrooloose/nerdtree'

"-----Plugin NERDTree end-----


"+++++Plugin ctrlp start+++++
Plugin 'kien/ctrlp.vim'

"-----Plugin ctrlp end-----


"+++++Plugin taglist start+++++
Plugin 'vim-scripts/taglist.vim'

"-----Plugin taglist end-----

"+++++Plugin xml.vim start+++++
Plugin 'othree/xml.vim'

"-----Plugin xml.vim end-----


"+++++Plugin vim-css-color start+++++
Plugin 'ap/vim-css-color'

let g:cssColorVimDoNotMessMyUpdatetime = 1
"-----Plugin vim-css-color end-----


"+++++Plugin pydiction start+++++
Plugin 'rkulla/pydiction'

let g:pydiction_location = 'C:/Users/Administrator/vimfiles/bundle/pydiction/complete-dict'
"-----Plugin pydiction end-----


call vundle#end(path)        " required
filetype plugin indent on    " required

