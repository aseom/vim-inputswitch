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

function! inputswitch#insert_enter()
    if exists("g:isw_laststate")
        call system(join([s:exec, "--set", g:isw_laststate]))
    endif
endfunction

function! inputswitch#insert_leave()
    let g:isw_laststate = system(join([s:exec, "--get"]))
    call system(join([s:exec, "--set", "en"]))
endfunction

autocmd InsertEnter * call inputswitch#insert_enter()
autocmd InsertLeave * call inputswitch#insert_leave()
