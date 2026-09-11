" LaTeX filetype plugin
" Enable syntax highlighting
syntax on
set syntax=tex

" Enable spell check for LaTeX
setlocal spell
setlocal spelllang=en,es
setlocal wrap

" Concealing
setlocal conceallevel=0

" Line breaking
setlocal textwidth=0

" Folding (optional)
" setlocal foldmethod=manual

" Make sure VimTeX is available
if exists('g:vimtex_enabled')
  " VimTeX specific settings
  let g:vimtex_quickfix_enabled = 1
  let g:vimtex_quickfix_mode = 2
endif

" Key mappings
nnoremap <buffer> <F9> :VimtexCompile<CR>
nnoremap <buffer> <F10> :VimtexView<CR>
nnoremap <buffer> <leader>tc :VimtexToggleMain<CR>

" Custom highlight groups for LaTeX
highlight! link texCmd Statement
highlight! link texDelim Delimiter
highlight! link texMath Number
highlight! link texBeginEndName Type
highlight! link texEnvironment PreProc
