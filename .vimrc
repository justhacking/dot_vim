colorscheme nature
set background=dark

"pmenu color
hi Pmenu ctermfg=7* ctermbg=0
highlight PmenuSel   ctermfg=0 ctermbg=7 guifg=#ff0000 guibg=#00ff00 
highlight PmenuSbar  ctermfg=2 ctermbg=6* guifg=#ff0000 guibg=#00ff00
"highlight PmenuThumb ctermfg=2 ctermbg=7 guifg=#ff0000 guibg=#00ff00

"set tags
"set tags=/home/try/.vim/tags/tags

"set up for pathogen
execute pathogen#infect()

"color scheme
set background=dark
"colorscheme solarized
"colorscheme monokai
"colorscheme molokai
colorscheme nature

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
"set guioptions-=m
set guioptions-=T


" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>


" 设置 gvim 显示字体
set guifont=DejaVuSansMono\ 12

"Enable number of volume
set nu

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Enable filetype plugins
" syntax enable
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
syntax on
set expandtab
set shiftwidth=4
set tabstop=4
set ci
autocmd FileType make setlocal noexpandtab 
set wildmenu

let mapleader=";"

"Set for cscope to work
if has('cscope')
    set csto=0
    set cst
    set nocsverb
"    set cscopetag cscopeverbose

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

"    cs add ~/.vim/cscope_tags/usr_include
    set csverb
endif

nmap <leader>gc :call Csadd_usr_include()

"0 or s: Find this C symbol
"1 or g: Find this definition
"2 or d: Find functions called by this function
"3 or c: Find functions calling this function
"4 or t: Find this text string
"6 or e: Find this egrep pattern
"7 or f: Find this file
"8 or i: Find files #including this file
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>tt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ee :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>ii :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>dd :cs find d <C-R>=expand("<cword>")<CR><CR>
"Set for cscope finished

"some shortkey
"jump another window
nmap <Leader>j <C-W>j
nmap <Leader>k <C-W>k
nmap <Leader>h <C-W>h
nmap <leader>l <C-W>l
"write
nmap <Leader>w :w<CR>
"tabedit and change tab
nmap <leader>f :tabnext<CR>
"unset highlight 
nmap <leader>s :nohl<CR>
"explore directory
nmap <leader>e :e .<cr>
"go to the start of a line
nmap <leader>6 ^
"go to the end of a line
nmap <leader>4 $

"tagbar
"winManager set up
let g:winManagerWidth = 30
let g:winManagerWindowLayout = "BufExplorer|FileExplorer"
"let g:winManagerWindowLayout=''
"let g:winManagerWindowLayout = "BufExplorer"
nmap <silent> <F8> :WMToggle<cr>
let g:miniBufExplMapWindowNavVim = 1 "Ctrl-<hjkl> to move to window
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)

"for TagBar
nnoremap <silent> <F9> :TagbarToggle<CR>



"nnoremap <silent> <script> <Plug>CsTEST :call CsTEST()<cr>
fun! Csadd_usr_include() 
    set nocsverb
    cs add ~/.vim/cscope_tags/usr_include
    set csverb
endfun


