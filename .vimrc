let mapleader = ","
set t_TI= t_TE=

colo elflord_custom
set termguicolors

set nocompatible

" PLUG
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'elzr/vim-json'
Plug 'preservim/nerdcommenter'
call plug#end()


" Misc flags
set exrc
set number
set hlsearch
set noerrorbells
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set wildmode=longest,list,full
set splitright

" Misc mappings
nnoremap <leader>h :set colorcolumn=80<CR>
nnoremap <leader>hh :set colorcolumn=<CR>
nnoremap <S-TAB> <c-w>w
hi ColorColumn ctermbg=blue guibg=blue
nmap <leader>" cs'"
nmap <leader>' cs"'

" Run tests/lint
fun! FormatCode(app) abort
    execute '!cd ~/dev/cwa; docker-compose run --rm --entrypoint="" --user=root ' . a:app . ' black %'
    execute '!cd ~/dev/cwa; docker-compose run --rm --entrypoint="" --user=root ' . a:app . ' flake8 %'
endfun
autocmd BufRead,BufNewFile */cds/*.py nnoremap <F2><F2> :!cd ~/dev/cwa; docker-compose run --rm --entrypoint="" --user=root cds pytest<CR>
autocmd BufRead,BufNewFile */cds/*.py nnoremap <F2> :!cd ~/dev/cwa; docker-compose run --rm --entrypoint="" --user=root cds pytest % -vv<CR>
autocmd BufRead,BufNewFile */cwa/*.py nnoremap <F2> :!cd ~/dev/cwa; docker-compose run --rm --entrypoint="" --user=root cwa pytest %<CR>
autocmd BufRead,BufNewFile */cpa/*.js nnoremap <F2> :!yarn test %<CR>
autocmd FileType javascript nnoremap <F2> :!cd ~/dev/cwa/frontend; yarn test %<CR>
autocmd FileType javascript nnoremap <F2><F2> :!cd ~/dev/cwa/frontend; yarn test<CR>
autocmd BufRead,BufNewFile */cds/*.py nnoremap <leader><F2><F2>  :!cd ~/dev/cwa; docker-compose run --rm --entrypoint="" --user=root cds flake8<CR>
autocmd BufRead,BufNewFile */cds/*.py nnoremap <leader><F2> :call FormatCode('cds')<CR>
autocmd BufRead,BufNewFile */cwa/*.py nnoremap <leader><F2> :call FormatCode('cwa')<CR>
autocmd BufRead,BufNewFile */cpa/* nnoremap <leader><F2> :!yarn prettier % --write<CR>
autocmd FileType javascript nnoremap <leader><F2> :!cd ~/dev/cwa/frontend; yarn prettier ../% --write<CR>
autocmd FileType javascript nnoremap <leader><F2><F2> :!cd ~/dev/cwa/frontend; yarn prettier src/**/*.js --write<CR>


" Tabs / Spaces
set tabstop=4 softtabstop=4 expandtab shiftwidth=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

fun! FormatLog()
    set tabstop=2 softtabstop=2 expandtab shiftwidth=2
    keeppatterns %s/, /,\r/g
    keeppatterns %s/{/{\r/g
    keeppatterns %s/}/\r}/g
    noh
    normal gg=G
endfun
command! FmtLog :call FormatLog()<CR>

" vimrc management & cheatsheet
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>cv :vsplit ~/.vim/cheatsheet.note<CR>

" CoC AutoComplete
let g:coc_disable_startup_warning = 1
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Buffers
function! ChangeBuffer(forward)
    if a:forward
        bn
    else
        bp
    endif
    if mode() == 't'
        call ChangeBuffer(a:forward)
    endif
endfunction
set hidden
nnoremap <leader>f :call ChangeBuffer(1)<CR>
nnoremap <leader>b :call ChangeBuffer(0)<CR>
nnoremap <leader>d :bp\|bd #<CR>
nnoremap <leader>g :b#<CR>
nnoremap <leader>G :bm<CR>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>

" Commenting
autocmd FileType javascript vnoremap <leader>c :s/^/\/\/<CR>
autocmd FileType python vnoremap <leader>c :s/^/#<CR>
autocmd FileType javascript vnoremap <leader>u :s/^\/\//<CR>
autocmd FileType python vnoremap <leader>u :s/^#/<CR>

" Edit
nnoremap E :E<CR>
nnoremap <leader>e :Vex<CR>:vertical resize 20<CR>

" FZF
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>l :Buffers<CR>
nnoremap <c-p> :GFiles<CR>
command! H Helptags


" GIT
" maybe just use Gdiffsplit (Gdiff) for these
command! Master Gvsplit master:%
command! Masterdiff Gvsplit master:% | diffthis | wincmd w | diffthis | wincmd w
command! Masteroff q | diffoff!
command! G Git | res 20 | set winfixwidth
command! GB Git blame
nnoremap <leader><leader>g :GBrowse<CR>


" CoC
nmap <leader>j <Plug>(coc-definition)
nmap <leader>i :call CocAction('doHover')<CR>


" Highlights
nnoremap <leader>n :noh<CR>


" LEAVE INSERT
inoremap jk <ESC>
inoremap kk <ESC>
inoremap jj <ESC>

" Line Numbers
nnoremap <leader>; :set invnumber<CR>

" lint
let g:ale_linters_explicit = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
nnoremap <leader>a :ALEToggle<CR>
nnoremap <leader>F :ALEFix<CR>
command! F ALEFix

" React
function! MakeComponent(dir, fname, cname) abort
  echom system("mkdir ". a:dir. "/". a:fname)
  exe "e" a:dir."/".a:fname."/".a:fname.".js"
  0r /home/emcandrew/.vim/react/component.txt
  exe ":%s/<name>/".a:cname."/g"
  exe "e" a:dir."/".a:fname."/".a:fname.".scss"
  exe "e" a:dir."/".a:fname."/index.js"
  exe "normal iexport { default } from \"./".a:fname."\";"
endfunction
command! -nargs=* MC :call MakeComponent(<f-args>)

" Python
" Debug
command! Pdb normal oimport pdb; pdb.set_trace()

" Searching
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:copen<CR>
nnoremap <leader><c-f> :Ag<CR>
nnoremap <c-f> :Ag <C-R><C-W><CR>

" Terminal
nnoremap <leader>t :vert ter<CR><c-w>:vert res 70<CR><c-w>:set winfixwidth<CR>
command! -nargs=+ TER exe("vert ter ".<q-args>)
tmap <leader>- <c-w>:vert res -20<CR>
tmap <leader>+ <c-w>:vert res +20<CR>
tmap <leader>f <c-w>:bn<CR>
tmap <leader>b <c-w>:bp<CR>
tmap <leader>d <c-w>:bd<CR>
tmap <leader>g <c-w>:b#<CR>
tmap <c-u> <c-w>N<c-u>:set nonumber<CR>
tmap <S-TAB> <c-w>w
function! ExitNormalMode()
    unmap <buffer> <silent> <RightMouse>
    call feedkeys("a")
endfunction

function! EnterNormalMode()
    if &buftype == 'terminal' && mode('') == 't'
        call feedkeys("\<c-w>N")
        call feedkeys("\<c-y>")
        map <buffer> <silent> <RightMouse> :call ExitNormalMode()<CR>
    endif
endfunction

tmap <silent> <ScrollWheelUp> <c-w>:call EnterNormalMode()<CR>


" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_y = ''
let g:airline_section_z = 'col %{col(".")} ln %{line(".")}'

" Obsession
nnoremap <leader>s :Obsess<CR>



" javascript
let g:javascript_plugin_jsdoc = 1
command! Afn normal iconst = () => { }<ESC> 0wh

" HTML / JSX
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js, *.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript, typescript'

" Whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Autocmds
augroup EWAN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END



" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
