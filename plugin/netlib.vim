if exists("g:netlib_loaded")
  finish
endif

let g:netlib_loaded = 1
let g:loaded_netrwPlugin = 'replaced with netlib'

let s:savecpo = &cpo
set cpo&vim

try
  augroup Network
    au!
    au BufReadCmd    *://* call netlib#Handle('BufRead',    expand("<amatch>"))
    au FileReadCmd   *://* call netlib#Handle('FileRead',   expand("<amatch>"))
    au BufWriteCmd   *://* call netlib#Handle('BufWrite',   expand("<amatch>"))
    au FileWriteCmd  *://* call netlib#Handle('FileWrite',  expand("<amatch>"))
    au FileAppendCmd *://* call netlib#Handle('FileAppend', expand("<amatch>"))
    au SourceCmd     *://* call netlib#Handle('Source',     expand("<amatch>"))
  augroup END
catch
endtry

runtime! netplugin/**/*.vim

let &cpo = s:savecpo
unlet s:savecpo
