if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'notes'
elseif exists("b:current_syntax") && b:current_syntax == "notes"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn match   notesComment   	"#.*$"
syn region  notesParens   start=+(+  end=+)+

hi def link notesComment		Comment
hi def link notesParens		String


let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

