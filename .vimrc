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

"neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化


imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
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


" twitvim
nnoremap <Space>po   :<C-u>PosttoTwitter<Enter>
nnoremap <Space>fr   :<C-u>FriendsTwitter<Enter>
nnoremap <Space>re   :<C-u>RepliesTwitter<Enter>
nnoremap <Space>tt   :<C-u>ListTwitter tottoruby<Enter>
nnoremap <Space>nn   :<C-u>NextTwitter<Enter>
nnoremap <Leader>u   yw:UserTwitter <C-R>+<CR>
"let twitvim_login = "user:pass"
""base64 encode
"$ cat -n 'user:pass'|openssl base64
"let twitvim_login_b64 = "base64string"
""let twitvim_browser_cmd = "firefox.exe"
"let twitvim_browser_cmd = "open -a /Applications/Firefox.app"
let twitvim_count = 50

"vim ref
nnoremap <silent> <Space>a :Ref alc <C-r><C-w><C-m><C-w>_
nnoremap <Space>ra  :Ref alc 
