" example command:
" command! Nf :call NewFunction()

" example function:
" function! NewFunction()
" 	commands
" endfunction

" => Basic Setup {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on " to find what filetype is set for an open file :set filetype?

let mapleader=" " " leader key

set timeoutlen=1000 " amount of mapping delay
set ttimeoutlen=5 " amount of keycode delay

set path+=** " provides tab completion for Ex file-related tasks
set wildmenu "display all matching files when we tab complete
set wildignorecase " case-insensitive search
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk

set linebreak
" set nowrap
set wrap

set exrc " if there is an init.vim inside the folder, use that
set number
" set signcolumn=no
set hidden " hides a buffer when it is abandoned
set noerrorbells
set path=.,,**

" Strip whitespace on save:
autocmd BufWritePre * %s/\s\+$//e

" Searching ===============
set ignorecase
set smartcase
set incsearch " highlights as you search

" No backups, use Undo Directory ===============
set noswapfile
set nobackup
set undofile
set undodir=~/.config/nvim/undo-directory

set termguicolors
set scrolloff=8 " start scrolling screen 8 lines below the bottom

syntax enable " for syntax highlighting

set showmatch " highlight matching brackets
set cursorline " highlight current cursor line

" Sorting out Working Directory?
" set autochdir

set viminfo='100,<50,s10,h,%

" }}}

" => Tabs {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" set list
" set lcs=tab:┊\ ,trail:·
" options: ['|', '¦', '┆', '┊']

" Sort out tabs to spaces and reindent
function! TabSort()
	:set list
	:set ts=2 sts=2 sw=2 noet
	:set noexpandtab
	:set autoindent
	:retab
	:%retab!
	:normal ggVG=
endfunction

" Sort out tabs to spaces and reindent to 4 spaces
function! TabSort4()
	:set list
	:set ts=4 sts=4 sw=4 noet
	:set autoindent
	:retab
	:%retab!
	:normal ggVG=
endfunction

" }}}

" => Remaps and General Stuff {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Easier Saving
nnoremap <leader>w :wa<CR>

" Easier Quitting
nnoremap <C-d> :q!<CR>

" Make Highlighted Search go away on Enter
nnoremap <esc> :silent! nohls<cr>

" Make yank Y behave like D & C
map Y y$

" Stay in Visual Mode after indenting a block with > or <
vmap < <gv
vmap > >gv

" Copy to the System Clipboard with YY
noremap YY "+y<CR>
noremap XX "+x<CR>

nnoremap j gj
nnoremap k gk

" cnoremap <C-n> <C-j>
" cnoremap <C-p> <C-k>
cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<C-k>"
cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<C-j>"

nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>cdl :lcd %:p:h<CR>

" }}}

" => Changing Wword Behaviour {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands must start with a capital
:command! Wword setlocal iskeyword-=-
:command! WWord setlocal iskeyword+=-

" }}}

" => Opening Files & Folders {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latest project
:command! Project :e ~/Javascript/my-nextjs-blog

" Latest project
:command! Scratch :e ~/Coding-notes/scratch.md

" Files
map <leader>, :e ~/.config/nvim/init.vim<CR>
:command! Vim :e ~/coding-files/coding-notes/vim.md
:command! Daytona :vs ~/.config/nvim/colors/daytona.vim
:command! Bashrc :e ~/.bashrc
:command! Init :e ~/.config/nvim/init.vim
:command! Source :source ~/.config/nvim/init.vim

" Folders
:command! Cn :e ~/Coding-notes
:command! Cf :e ~/Coding
:command! Snippets :e ~/coding-files/my-snippets
:command! Sessions :e ~/.config/nvim/sessions
:command! Pedal :e ~/local\ sites/pedal-woocommerce/app/public/wp-content/themes/pedal-woocommerce
:command! Static :e ~/coding-files/static-sites/one-page-template/style.css
:command! Fel :e ~/Coding/front-end-learning
:command! Notes :e ~/Documents/notes-general
:command! Template :e ~/local\ sites/my-underscores-template/app/public/wp-content/themes/my-underscores
:command! Woolly :e ~/local\ sites/woolly-rhino/app/public/wp-content/themes/my-underscores
:command! Woollyold :e ~/coding-files/woolly-website
:command! Parts :e ~/Coding/parts
:command! Locals :e ~/local\ sites " can't have ls or local
:command! Testing :e ~/Coding/testing
:command! Nvimvim :e ~/.config/nvim/
:command! Cronjobs :e ~/myscripts
:command! Scripts :e ~/bin
:command! Js :e ~/Javascript
:command! Jsnotes :e ~/Coding-notes/js-learning/

" Areas
:command! Desk :e ~/desktop
:command! Docs :e ~/documents
:command! Downloads :e ~/downloads


" }}}

" => Emmet {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" Emmet - mapping activation key
let g:user_emmet_expandabbr_key='<tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:user_emmet_install_global = 0

autocmd FileType html,css,php,javascript,jsx,markdown EmmetInstall

" }}}

" => Fuzzy Search {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-f> :FZF<CR>

let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-b': 'split',
			\ 'ctrl-v': 'vsplit'
			\}

" - Window Size
let g:fzf_layout = { 'down': '70%' }

" }}}

" => Buffers, Tabs, Splits, Terminals {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""

" => Buffers ======================
"
" Swapping back and forth between 2 buffers
" next and previous buffers
" :nnoremap <leader>n :bnext<CR>
" :nnoremap <leader>p :bprevious<CR>
:nnoremap <leader>o <c-o>

" function to close all buffers that aren't open in a window
function Wipeout()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

" call Wipeout() with a mapping
nnoremap <leader>ca :call Wipeout()<cr>

" call Wipeout() on entering Vim
augroup wipe-all-buffers-on-leave-vim
	autocmd!
	autocmd VimEnter * call Wipeout()
augroup END


" => Tabs
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>l :tabn<CR>
nnoremap <leader>h :tabp<CR>

" => Splits ========================
" new, :vnew
" vim is quite funny and takes | (piping) within vim, but <bar> in shortcuts

set splitright
set splitbelow

nnoremap <leader>d :vsp<CR>


" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Keep equal Vim split on resizing
autocmd VimResized * wincmd =

nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" => Terminals ===========================
" Can open files from terminal now as have alias for
" nvr & neovim-remote process is in .bashrc

" Opening a terminal in current buffer
nnoremap <leader>T :term<CR>

" Opening bottom terminal for git work:
nnoremap <leader>b :new<bar>:term<CR>

" Opening Ranger in a window via 'lokaltog/neoranger' plugin:
nnoremap <silent> <Leader>r :RangerCurrentFile<CR>


" let g:rnvimr_ex_enable = 1

" Moving around terminal windows like normal windows
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
" Up and Down create conflicts with ctrl P:
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k

" Straight into insert mode
autocmd TermOpen * startinsert

" Exit terminal with just <C-d>
augroup terminal_settings
	autocmd!
	autocmd BufWinEnter,WinEnter term://* startinsert
	autocmd BufLeave term://* stopinsert

	" Ignore various filetypes as those will close terminal automatically
	" Ignore fzf, ranger, coc
	autocmd TermClose term://*
		\ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
		\	call nvim_input('<CR>')  |
		\ endif
augroup END

" }}}

" => Bracket/Tag Autocompletion {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Php
" inoremap <?<CR> <?php<CR>?><Esc>O<Tab>
" inoremap <?<tab> <?php<space><space>?><left><left><left>
" }}}

" => Remember last editing position in window {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
augroup initvim-remember-cursor-position
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" }}}

" => Pasting over the top of a line, repeatedly with yy Vp {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is needed otherwise you can only paste once:
xnoremap <silent> p p:let @"=@0<CR>
" }}}

" => Open a file in Firefox/Chrome <leader>B {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""

" nnoremap <leader>B :exe ':silent !open -a /Applications/Firefox.app %'<CR>
nnoremap <leader>B :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>

" }}}

" => Autosave a New Folder and File Together {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" automake directories"
augroup automkdir
	autocmd!
	autocmd BufWritePre *
				\ if !isdirectory(expand('<afile>:h')) |
				\ call mkdir(expand('<afile>:h'), 'p') |
				\ endif
augroup END
" }}}

" => Search {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space>f :%s/
nnoremap <space>F :,$s/

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR> " Search for visually selected text with //

" }}}

" => Folds {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=marker
" set foldlevel=1

" }}}

" => netrw {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_liststyle = 0
let g:netrw_localrmdir='rm -r'
let g:netrw_sort_by = "name"

" AutoOpen NetRW if vim called without parameters i.e. vim augroup
" netrw-auto-open-if-no-params autocmd!  autocmd VimEnter * if argc() == 0 |
" Explore! | endif augroup END

function! ToggleNetrw()
	if &ft ==# "netrw"
		:Rex
	else
		:Ex
	endif
endfunc

nnoremap <leader>e :call ToggleNetrw()<cr>

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete

" }}}

" Plugins:
" => Plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugins-storage')

" colorscheme
Plug 'morhetz/gruvbox'

" CSS colors: needs Golang installed,
" also after PlugInstall, you also need to go to
" cd ~/.config/nvim/plugins-storage/vim-hexokinase/
" and then $ make hexokinase
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Indent Guides
Plug 'Yggdroot/indentLine'

" Loremipsum
Plug 'vim-scripts/loremipsum' " :Loremipsum [wordcount]

" Auto Closing Brackets
" Plug 'rstacruz/vim-closer'
Plug 'jiangmiao/auto-pairs'

" Markdown Stuff
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Language Support ==============
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim' " <TAB>
Plug 'AndrewRadev/tagalong.vim' " automatically rename matching HTML tags
Plug 'tpope/vim-commentary' " Commenting out code with gc
Plug 'sheerun/vim-polyglot'
Plug 'salcode/vim-wordpress-dict'
Plug 'captbaritone/better-indent-support-for-php-with-html'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " <C-p>
Plug 'junegunn/fzf.vim'

" git
Plug 'tpope/vim-fugitive'

" Zen mode
Plug 'junegunn/goyo.vim'

" Status bar
Plug 'itchyny/lightline.vim'

" Surrounding tags etc.
Plug 'tpope/vim-surround'

" surrounding tags etc.
Plug 'danielmiessler/vimblog'


call plug#end()
"!!!!! Don't forget to quit and reopen nvim, then run PlugInstall!!!!


" }}}

" => Colorscheme {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme gruvbox
colorscheme daytona
set background=dark

" Find Syntax Elements with <leader>co
nmap <leader>co :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set t_Co=256

" }}}



" Plugin Settings:

" indentLine :IndentLinesToggle => {{{
let g:indentLine_enabled = 0

let g:indentLine_fileTypeExclude = ["vimwiki", "coc-explorer", "help", "undotree", "diff"]
let g:indentLine_bufTypeExclude = ["help", "terminal"]
let g:indentLine_indentLevel = 10

" Conceal settings
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = "inc"
let g:indentLine_conceallevel = 2

let g:indentLine_char = '┆'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" 16 Color
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" 256
let g:indentLine_color_term = 239

" True Color
let g:indentLine_color_gui = '#616161'

" }}}

" => Vim Commentary {{{

" autocmd FileType php setlocal commentstring=//\ %s

" }}}

" => Hexokinase Color Highlights {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Hexokinase_highlighters = ['virtual']
let g:Hexokinase_ftEnabled = ['vim', 'css', 'html', 'javascript', 'scss']


" }}}

" => Coc - Conquer of Completion settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc extensions to be auto installed
let g:coc_global_extensions = [
			\ 'coc-css',
			\ 'coc-diagnostic',
			\ 'coc-eslint',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-marketplace',
			\ 'coc-phpls',
			\ 'coc-prettier',
			\ 'coc-python',
			\ 'coc-stylelintplus',
			\ 'coc-tsserver',
			\]

" CoC (taken from github.com/neoclide/coc.nvim with comments removed)
set nowritebackup
set cmdheight=1
set updatetime=1000
"set shortmess+=a
let php_htmlInStrings = 1

" Set the height of suggestion window
set pumheight=10

" Map choosing suggestions j,k and u
" inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : coc#refresh()
" inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : coc#refresh()
inoremap <expr> <c-u> pumvisible() ? coc#_select_confirm() : coc#refresh()

" Disabling the Enter key from autocompleting
inoremap <expr> <cr> "\<C-g>u\<CR>"
" inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Note WP site -> make sure there is a .git folder in the public folder,
" otherwise coc gets messed up. Can be an empty .git folder.


" }}}

" => Ale Linting settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {'php': ['php', 'langserver', 'phan', 'csslint', 'html']}
let g:ale_php_langserver_executable = expand('~/.config/composer/vendor/bin/php-language-server.php')
let g:ale_php_phan_executable = expand('~/bin/phan_client_auto')
let g:ale_php_phan_use_client = 1
set shortmess+=at

" intelliphense???


" }}}

" => Status Line Lightline Plugin {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ 'active': {
			\	'left': [ [ 'mode', 'paste' ],
			\				[ 'gitbranch', 'readonly', 'filename', 'absolutepath', 'modified' ] ]
			\ },
			\ 'component_function': {
			\	'gitbranch': 'FugitiveHead'
			\ },
			\ }

" }}}

" => Scrollbar Plugin setup for Neovim 0.5 {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ScrollbarInit
	autocmd!
	autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
	autocmd WinEnter,FocusGained				* silent! lua require('scrollbar').show()
	autocmd WinLeave,FocusLost				* silent! lua require('scrollbar').clear()
augroup end


" }}}

" => Goyo Plugin for Zen Writing {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
" :Goyo
" :Goyo!
" :Go
" :Go!

let g:goyo_linenr=1


" command! Go Goyo 70%+80x100%
" offset+widthxheight
" offset moves the screen to the left

let g:goyo_width=80
let g:goyo_height=100

" }}}

" => Markdown Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlighting in ```code blocks```
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'css', 'javascript', 'js=javascript', 'json=javascript', 'sass', 'xml', 'jsx=javascript.jsx']

" Creating ready-made code blocks in markdown:
command! Codej :-1read ~/coding-files/my-snippets/block-js.md | execute "normal! j" | startinsert
command! Codeb :-1read ~/coding-files/my-snippets/block-bash.md | execute "normal! j" | startinsert
command! Codeh :-1read ~/coding-files/my-snippets/block-html.md | execute "normal! j" | startinsert


" Automatically set file to wrap if markdown or txt file:
augroup Markdown
	autocmd!
	autocmd FileType markdown,text setlocal wrap
augroup END

" Turn off indentLine plugin on markdown files
autocmd FileType markdown let g:indentLine_enabled = 0

" plasticboy/vim-markdown plugin ==============
let g:vim_markdown_folding_disabled = 1 " Turn off auto folding at titles.
let g:vim_markdown_conceal = 0 " Turn off concealing syntax in md source file
let g:vim_markdown_conceal_code_blocks = 0 " Turn off concealing syntax in md source file
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_autowrite = 1 " If you follow a link using the ge shortcut, automatically save any edits you made before moving

" iamcco/markdown-preview.nvim =================
nmap <leader>m <Plug>MarkdownPreview
" let g:mkdp_auto_start = 1 " Automatically open the .md file preview
" let g:mkdp_auto_open= 1 " Automatically open the .md file browser preview
let g:mkdp_auto_close = 1 " Automatically close the .md file browser preview
let g:mkdp_refresh_slow = 1
" setting up a custom css file for markdown previews in the browser:
let g:mkdp_markdown_css='/Users/mike/.config/nvim/github-markdown.css'
" this is actually the file that appears as markdown.css in the browser
" inspector. It must be substiting but keeping the original/variable name.

" Note css is currently coming from both the above custom css and the default page.css located here:
" /Users/mike/.config/nvim/plugins-storage/markdown-preview.nvim/app/_static

" Another option for viewing markdown files that uses node:
" :!npx markdown-preview % &


" }}}

" => Printing {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn off double sided printing
" duplex is double sided
set printoptions=paper:A4,duplex:off,number:y,portrait:y,left:0pc
set printfont=Courier:h10

" Neither of these work with lines that wrap
command! Hardcopy :call Hardcopy()
function! Hardcopy()
	:syntax off
	:hardcopy
	:syntax on
endfunction

command! Print :call Print()
function! Print()
	:TOhtml
	/<!
	:normal dit
	:w
	:exe ':silent !open -a /Applications/Google\ Chrome.app %'
endfunction

" @media print {
"   * {
"     white-space: pre-wrap;
"   }
" }

" VS Code Solution using PrintCode extension:
command! Vs :! code %
" Then press fn + f1
" type PrintCode

" }}}

" => Changing Filetypes {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change PHP filetype to html
:command! Fth :set ft=html
:command! Ftj :set ft=javascript
:command! Ftp :set ft=php

" }}}

" => tagalong.vim {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagalong_filetypes = ['html', 'javascript', 'php', 'jsx', 'xml']

" }}}

" copy pwd to clipboard
:command! Pwd let @+ = expand('%:p')

nnoremap <leader>pp :!wp new ~/coding-files/blog/

" => Search Patterns/Regex {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" From the cursor position onwards, move all sentences onto their own line:
" :,$s/\. /\r/gc

" }}}


" => Macros `m {{{

" Notice the <Esc> etc. have to be escaped with \

" CSS add !important
let @i="0f;i !important\<esc>"

" Surrounding Code with Paragraph Backticks
let @u="o`\<esc>kko\<esc>i`\<esc>"

" Add reset comment to css
let @r="A /* reset */"

" Convert html to css class
let @p="0df\"i.\<esc>f\"Da {"

" Marker for grid containers
let @y="A/* ------------------------------------------------ */\<esc>"

" Wordpress Image Path
let @t="a<?php bloginfo('template_directory'); ?>/"

" Changing general text into a Fold heading
let @j=":Fold\<cr>\<esc>3j0dawv$hd3k2lp"
let @k="d2kp"

" Html comments in PHP
let @h="I<!-- \<esc>A -->\<esc>V<\<esc>"
let @g="^dt<\<esc>f>lD"

" Change beginning of word to Capital
let @s="b~"

let @m="0f\"r{astyles.\<esc>f\"r}"

" }}}

" => Snippets {{{

nnoremap <leader>sn :-1read ~/coding-files/my-snippets/

" Folds
command! Fold :call Fold()
function! Fold()
	if &ft ==# "markdown"
		:-1read ~/Coding/my-folds/md-fold.md | execute "normal! zoell" | startinsert
	elseif &ft ==# "html"
		:-1read ~/Coding/my-folds/html-fold.html | execute "normal! zoell" | startinsert
	elseif &ft ==# "javascript"
		:-1read ~/Coding/my-folds/javascript-fold.js | execute "normal! zoell" | startinsert
	elseif &ft ==# "php"
		:-1read ~/Coding/my-folds/html-fold.html | execute "normal! zoell" | startinsert
	elseif &ft ==# "css"
		:-1read ~/Coding/my-folds/css-fold.css | execute "normal! zof>ll" | startinsert
	elseif &ft ==# "vim"
		:-1read ~/Coding/my-folds/vim-fold.vim | execute "normal! zoell" | startinsert
	elseif &ft ==# "tmux"
		:-1read ~/Coding/my-folds/vim-fold.vim | execute "normal! zoell" | startinsert
	endif
endfunction

" }}}

" => Abbreviations {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations only work for one liners:

" Usage - type the shortcut and then just hit the space key or any other normal syntax key.
abbr bbbb border: 1px solid black;
abbr bwbw border: 1px solid white;
abbr jsjs ``` Javascript
abbr htht ``` html

" }}}

" => Creating Own Startify {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" AutoOpen a file on vim startup
augroup open-planning-on-startup
	autocmd!
	autocmd VimEnter * nested if argc() == 0 | edit ~/Coding-notes/planning.md | endif
	" autocmd VimEnter * nested if argc() == 0 | source ~/.config/nvim/sessions/js.vim | endif
augroup END

nnoremap <leader>sl :source ~/.config/nvim/sessions/
nnoremap <leader>ss :mks! ~/.config/nvim/sessions/
nnoremap <leader>sh :e ~/coding-files/coding-notes/planning.md<cr>

" }}}


:finish


