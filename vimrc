set number relativenumber
colorscheme elflord
syntax on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on
packadd comment
"==============================================================================================
"normal command end here
"==============================================================================================
" Run cargo run in a  split panel
autocmd FileType rust nnoremap <F7> :w<CR>:tab terminal cargo run<CR>
"==============================================================================================
"automatically source the .vimrc file after save 
augroup VimrcAutoSource
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END
"==============================================================================================
"automatically on NERDTree when entering vim
"autocmd VimEnter * NERDTree | wincmd p
"==============================================================================================
"this is for opening terminal in vim and running  command using 2 step
"removing comamnd step 
nnoremap <F5> :execute 'tab term bash -c "' . input('Enter the command: ') . '; exec bash"'<CR>
tnoremap <F5> <C-\><C-n>:execute 'tab term bash -c "' . input('Enter the command: ') . '; exec bash"'<CR>

"==============================================================================================
"FOR SAVING OUTPUT OF SPECIFIC COMMAND IN FILE USEING 3 STEP
" 1. Define the custom command that prompts for a filename
command! SaveTermLog execute '%w! ' . input('Save terminal output as: ', 'terminal_log.txt')

" 2. Map F2 in Normal Mode
nnoremap <F2> :SaveTermLog<CR>

" 3. Map F2 in Terminal Mode (automatically switches to Normal Mode first)
tnoremap <F2> <C-\><C-n>:SaveTermLog<CR>
"=================================================================================================
" Toggle NERDTree open and closed with F3
nnoremap <F3> :NERDTreeToggle<CR>
"=================================================================================================
"opening .vimrc is quite tedious so 
nnoremap <Leader>v :execute ':edit ~/.vimrc'<CR>
"==================================================================================================
"automatically add html template
augroup HtmlTemplates
  autocmd!
  autocmd BufNewFile *.html 0read ~/.vim/code_template/skeleton_html_template.html
  autocmd BufReadPost *.html if line('$') == 1 && getline(1) == '' | 0read ~/.vim/code_template/skeleton_html_template.html|endif
augroup END
"=====================================================================================================
"automaticaly add c template
augroup CTemplates
  autocmd!
  autocmd BufNewFile *.c 0read ~/.vim/code_template/skeleton_c_template.c
  autocmd BufReadPost *.c if line('$') == 1 && getline(1) == '' | 0read ~/.vim/code_template/skeleton_c_template.c|endif
augroup END
"=======================================================================================================
"todo ::-=>instead of making a template create a automation that check
"code_template  file's  and automatically add template according to language
"it belong to 
set wrap
