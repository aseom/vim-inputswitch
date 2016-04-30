" Plugin: vim-inputswitch
" Author: ASeom Han <hm9599@gmail.com>

if exists("g:loaded_inputswitch")
    finish
endif
let g:loaded_inputswitch = 1

let s:dir = expand("<sfile>:p:h:h")
let s:exec = s:dir . "/bin/inputswitch"

" Build if executable not exists
if !executable(s:exec)
    echom "vim-inputswitch: Building required executable..."
    echom system(join(["cd", s:dir, "&&", "make"]))
endif

function! s:set_input_source(language)
    echom system(join([s:exec, a:language]))
endfunction

" Usage: `:ISWSetInputSource <language>`
command! -nargs=1 ISWSetInputSource call s:set_input_source("<args>")
