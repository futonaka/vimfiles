set tabstop=2
set shiftwidth=2
set expandtab
set nocompatible
set number
set fileformat=unix
syntax on
filetype on
filetype indent on
filetype plugin on

autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>

" Save last opened line.
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

"neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化


imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<TAB>"
  else
    if pumvisible()
      return "\<C-N>"
    else
      return "\<C-N>\<C-P>"
    end
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>


"for quickrun
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'spec -cfs'}
augroup UjihisaRSpec
  autocmd!
  autocmd BufRead,BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

"vim ref
nnoremap <silent> <Space>a :Ref alc <C-r><C-w><C-m><C-w>_
nnoremap <Space>ra  :Ref alc 
