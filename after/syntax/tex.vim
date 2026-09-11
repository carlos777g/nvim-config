" Enhanced LaTeX syntax highlighting
" This file extends the built-in tex syntax with better highlighting

" Make sure we have some syntax highlighting enabled
if exists("b:current_syntax")
  finish
endif

" Load the built-in tex syntax
runtime! syntax/tex.vim

" Define highlight groups for LaTeX
" Commands and keywords
highlight! texCmd              ctermfg=3   cterm=bold      guifg=#FFD700   gui=bold
highlight! texCmdClass        ctermfg=4   cterm=bold      guifg=#4169E1   gui=bold
highlight! texCmdDef          ctermfg=5   cterm=bold      guifg=#DA70D6   gui=bold
highlight! texCmdInput        ctermfg=3   cterm=bold      guifg=#FFD700   gui=bold
highlight! texCmdRef          ctermfg=4   cterm=bold      guifg=#4169E1   gui=bold
highlight! texCmdType         ctermfg=4   cterm=bold      guifg=#4169E1   gui=bold

" Delimiters and brackets
highlight! texDelimiter       ctermfg=6   cterm=none      guifg=#00CED1   gui=none
highlight! texMathDelim       ctermfg=6   cterm=bold      guifg=#00CED1   gui=bold

" Environments
highlight! texBeginEnd        ctermfg=1   cterm=bold      guifg=#FF6347   gui=bold
highlight! texBeginEndName    ctermfg=2   cterm=bold      guifg=#32CD32   gui=bold

" Sections
highlight! texSection         ctermfg=5   cterm=bold      guifg=#DA70D6   gui=bold

" Math
highlight! texMath            ctermfg=3   cterm=none      guifg=#FFD700   gui=none
highlight! texMathOp          ctermfg=3   cterm=bold      guifg=#FFD700   gui=bold

" Comments
highlight! texComment         ctermfg=8   cterm=italic    guifg=#808080   gui=italic

" Create additional syntax patterns for better highlighting
" Ensure \newcommand and similar are highlighted
if !hlexists('texCommandName')
  syntax match texCommandName '\\[a-zA-Z]\+' contained contains=texCmd
  highlight! link texCommandName texCmd
endif

" Match structural commands
syntax match texStructCmd '\\documentclass\|\\usepackage\|\\begin\|\\end' contained
highlight! link texStructCmd texCmdClass

setlocal conceallevel=0
let b:current_syntax = "tex"
