" Plugins with vim-plug
call plug#begin()
Plug 'tpope/vim-sleuth' " tab space manager
Plug 'junegunn/vim-easy-align' " code alignment
Plug 'cespare/vim-toml' " toml support
Plug 'airblade/vim-gitgutter' " git diff viewer
Plug 'bronson/vim-trailing-whitespace' "  show trailing whitespaces
Plug 'tpope/vim-fugitive' " vim cli git
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " alfred?
Plug 'rafi/vim-denite-z' " use z to naviage in denite
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete
Plug 'vim-airline/vim-airline' " airline statusbar
Plug 'vim-airline/vim-airline-themes' " airline statusbar themes
Plug 'liuchengxu/vim-which-key' " vim key helper
Plug 'preservim/nerdtree' " nerdtree OBVIOUSLY
Plug 'francoiscabrol/ranger.vim' " ranger integration
Plug 'rbgrouleff/bclose.vim' " ranger dependency
Plug 'lilydjwg/colorizer' " colorize rgb values
Plug 'justinmk/vim-sneak' " jump around
Plug 'tomasr/molokai'  " molokai colortheme
Plug 'preservim/nerdcommenter' " comment codes
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " markdown
Plug 'wakatime/vim-wakatime' " wakatime
Plug 'chrisbra/csv.vim' " csv editing

call plug#end()

" colorscheme molokai

" == Airline Statusline Configuration ==
let g:airline_theme='molokai'
" show tabs
let g:airline#extensions#tabline#enabled = 1

" == MarkdownPreview
let g:mkdp_auto_start = 0
let g:mkdp_open_to_the_world = 1
let g:mkdp_auto_close = 0


" == ranger as default open dir in nvim
let g:NERDTreeHijackNetrw=0 " add this line if you use NERDTree
let g:ranger_replace_netrw=1 " open ranger when vim open a directory

" == sneak movement
"

" == nerdtree
" disable nerdtree arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" == Denite Configuration ==
" ahh

" define custom menu
let s:menus = {}
let s:menus.zsh = {
      \ 'description': 'zsh configurations',
      \ }
let s:menus.zsh.file_candidates = [
      \ ['zshrc', '~/.zshrc'],
      \ ]
call denite#custom#var('menu', 'menus', s:menus)

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ ',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

" change filesearch to ripgrep
call denite#custom#var('file/rec', 'command',
      \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
call denite#custom#var('grep', {
      \ 'command': ['rg'],
      \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
      \ 'recursive_opts': [],
      \ 'patturn_opt': ['--regexp'],
      \ 'separator': ['--'],
      \ 'final_opts': [],
      \ })


" change default prompt
call denite#custom#option('default', 'prompt', 'λ')


" === KEY MAPPINGS ===


" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction
