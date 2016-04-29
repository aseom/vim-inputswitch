" Plugin: vim-inputswitch
" Author: ASeom Han <hm9599@gmail.com>

" http://stackoverflow.com/questions/4976776
let s:dir = fnamemodify(resolve(expand("<sfile>:p")), ":h")
let s:exec = s:dir . "/../bin/inputswitch"

function! inputswitch#set_input_source(language)
    echo system(s:exec . " " . a:language)
endfunction

inoremap <silent> <ESC> <ESC>:call inputswitch#set_input_source("en")<CR>
