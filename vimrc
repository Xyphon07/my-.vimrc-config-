:set relativenumber
:set number
:set number relativenumber
colorscheme elflord
syntax on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on
packadd comment
"===============================================================================================================================
"normal command end here
"==============================================================================================================================
" Run cargo run in a  split panel
autocmd FileType rust nnoremap <F7> :w<CR>:tab terminal cargo run<CR>
"==============================================================================================
"automatically source the .vimrc file after save 
autocmd BufWritePost .vimrc source %
"==============================================================================================
"automatically on NERDTree when entering vim
autocmd VimEnter * NERDTree | wincmd p
"==============================================================================================
"this is for opening terminal in vim and running  command using 2 step
"removing comamnd step 
nnoremap <F5> :execute 'tab term bash -c "' . input('Enter the command: ') . '; exec bash"'<CR>
tnoremap <F5> <C-\><C-n>:execute 'tab term bash -c "' . input('Enter the command: ') . '; exec bash"'<CR>

"=============================================================================================
"FOR SAVING OUTPUT OF SPECIFIC COMMAND IN FILE USEING 3 STEP
" 1. Define the custom command that prompts for a filename
command! SaveTermLog execute '%w! ' . input('Save terminal output as: ', 'terminal_log.txt')

" 2. Map F2 in Normal Mode
nnoremap <F2> :SaveTermLog<CR>

" 3. Map F2 in Terminal Mode (automatically switches to Normal Mode first)
tnoremap <F2> <C-\><C-n>:SaveTermLog<CR>
"==================================================================================================

