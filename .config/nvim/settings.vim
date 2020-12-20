" highlight 80th column
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

" turn on line numbers
set number

" horizontal split above
" vertical split to right
set splitright

" disable mode indicatore as airline
set noshowmode

" vim-colors-solarized theme config
" set background=dark

" syntax highlight
syntax enable
set encoding=utf-8 " default encoding
set fileencoding=utf-8
set ruler
set cmdheight=2 " more space for messages
set mouse=a
set cursorline " good old cursorline
set nobackup
set nowritebackup
set formatoptions-=cro
set clipboard=unnamedplus
