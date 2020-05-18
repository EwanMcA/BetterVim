:let mapleader = "," 

:colo elflord

" Tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Highlights
:nnoremap <leader>n :noh<CR>

" This file
:nnoremap <leader>ev :e ~/.vimrc<CR>
:nnoremap <leader>sv :source ~/.vimrc<CR>

" LEAVE INSERT
:inoremap jk <ESC>

" Buffers
:set hidden
:nnoremap <leader>l :ls<CR>
:nnoremap <leader>f :bn<CR>
:nnoremap <leader>b :bp<CR>
:nnoremap <leader>d :bd<CR>
:nnoremap <leader>g :b#<CR>
:nnoremap <leader>1 :b1<CR>
:nnoremap <leader>2 :b2<CR>
:nnoremap <leader>3 :b3<CR>
:nnoremap <leader>4 :b4<CR>
:nnoremap <leader>5 :b5<CR>
:nnoremap <leader>6 :b6<CR>
:nnoremap <leader>7 :b7<CR>
:nnoremap <leader>8 :b8<CR>
:nnoremap <leader>9 :b9<CR>

" Edit
:nnoremap E :E<CR>

" Line Numbers
:nnoremap <leader>; :set invnumber<CR>
:set number

" Commenting
autocmd FileType javascript vnoremap <leader>c :s/^/\/\/<CR>
autocmd FileType python vnoremap <leader>c :s/^/#<CR>
autocmd FileType javascript vnoremap <leader>u :s/^\/\//<CR>
autocmd FileType python vnoremap <leader>u :s/^#/<CR>

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Obsession
:nnoremap <leader>s :Obsess<CR>
