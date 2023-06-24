" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "elflord_custom"
hi Normal		guifg=#8664a8			guibg=#220022
hi Comment	term=bold		ctermfg=DarkCyan		guifg=#0070a5
hi Constant	term=underline	ctermfg=Magenta		guifg=#fa9457
hi Special	term=bold		ctermfg=DarkMagenta	guifg=#5555ee
hi Identifier term=underline	cterm=bold			ctermfg=Cyan guifg=#40ffff
hi Statement term=bold		ctermfg=Blue gui=bold	guifg=#ed957b
hi PreProc	term=underline	ctermfg=DarkCyan	guifg=#dc90dc
hi Type	term=underline		ctermfg=LightGreen	guifg=LightGreen gui=bold
hi Function	term=bold		ctermfg=White guifg=#b8d8ff
hi Repeat	term=underline	ctermfg=White		guifg=white
hi Operator				ctermfg=Red			guifg=#d05020
hi Ignore				ctermfg=black		guifg=bg
hi Error	term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
hi Todo	term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=DarkYellow

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special

" CUSTOM
hi SignColumn ctermbg=0 guibg=#220022
hi ALEErrorSign ctermfg=red ctermbg=0
hi ALEError guibg=#662222
hi Noise guifg=white
