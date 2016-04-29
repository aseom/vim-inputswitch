" Plugin: vim-inputswitch
" Author: ASeom Han <hm9599@gmail.com>

" http://stackoverflow.com/questions/4976776
let s:dir = fnamemodify(resolve(expand("<sfile>:p")), ":h")
let s:exec = s:dir . "/../bin/inputswitch"

function! s:set_input_source(language)
    if !executable(s:exec)
        echo "vim-inputswitch: Cannot execute `inputswitch`"
        return
    endif
    echo system(s:exec . " " . a:language)
endfunction

" Usage: `inoremap <silent> <ESC> <ESC>:ISWSetInputSource en<CR>`
command! -nargs=* ISWSetInputSource call s:set_input_source("<args>")
