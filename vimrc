set fileformat=unix
syntax on
filetype on
set ignorecase
set number
set smartcase
set encoding=utf-8

set spell spelllang=en_gb

filetype indent on
set hlsearch
set backspace=eol,start,indent

if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'chriskempson/base16-vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'Rykka/easydigraph.vim'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'vim-scripts/SudoEdit.vim'
"NeoBundle 'mhinz/vim-signify'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'roman/golden-ratio'
NeoBundle 'bling/vim-airline'
set noshowmode
set laststatus=2

filetype plugin indent on

" General configuration start {
" Override as needed later

    " Align the new line indent with the previous line">>
    set autoindent

    " Convert tabs to spaces
    set expandtab

    " Operation >> indents 4 columns; << unindents 4 columns
    set shiftwidth=4
 
    " Insert/delete 4 spaces when hitting a TAB/BACKSPACE
    set softtabstop=4

    " A hard TAB displays as 4 columns
    set tabstop=4

    " Shortcut to toggle paste mode
    set pastetoggle=<F10>"

    " Enable incremental search
    set incsearch

    " Shortcuts for easy navigation between windows
    nnoremap <A-Up>    :wincmd k <CR>
    nnoremap <A-Down>  :wincmd j <CR>
    nnoremap <A-Left>  :wincmd h <CR>
    nnoremap <A-Right> :wincmd l <CR>

    " Set default shell to Z shell
    set shell=/bin/zsh

" } General configuration end

" Syntastic configuration start {

    let g:syntastic_auto_loc_list=1
    let g:syntastic_check_on_open=1

    " Shortcut to recompile
    nnoremap <F5> :SyntasticCheck<CR>

    " Shortcut to disable errors pane
    nnoremap <F6> :SyntasticReset<CR>

"} Syntastic configuration end

" You Complete Me configuration start {

    let g:ycm_semantic_triggers =  {
      \   'c' : ['->', '.'],
      \   'cpp' : ['->', '.', '::'],
      \   'java, vim' : ['.'],
      \ }

    " Close preview after completion is chosen
    let g:ycm_autoclose_preview_window_after_completion = 1

    " Don't ask for YCM configuration file load confirmation once
    let g:ycm_confirm_extra_conf = 0

    " Collect identifiers from strings and comments
    let g:ycm_collect_identifiers_from_comments_and_strings = 1

    " Show completion for comments
    let g:ycm_complete_in_comments = 1

    " Set location of configuration file
    let g:ycm_global_ycm_extra_conf = '$HOME/.ycm_extra_conf.py'

    " Unset blacklist
    let g:ycm_filetype_blacklist = {}

" } You Complete Me configuration end
 
" delimitMate configuration start {

    " Characters delimitMate will match
    let delimitMate_matchpairs = "(:),[:],{:},<:>"

" } delimitMate configuration end

" NERDTree configuration start {

    " Automatically quit if NERDTree is the only window
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    " Shortcut to NERDTreeToggle
    nnoremap <F2> :NERDTreeToggle <CR>

    " NERDTreeIgnore list
    let NERDTreeIgnore = []

" } NERDTree configuration end

" Solarized theme configuration start {

    syntax enable
    set t_Co=256
    let g:solarized_termcolors=256
    set background=dark
    let base16colorspace=256
    colorscheme solarized
" } Solarized theme configuration end


" C configuration start {
    autocmd BufNewFile,BufRead *.h set ft=c
" } C configuration end

" Python configuration start {

    autocmd FileType python setlocal linebreak smartindent

    " lines longer than 79 columns will be broken
    autocmd FileType python setlocal textwidth=79

    " round indent to multiple of 'shiftwidth'
    autocmd FileType python setlocal shiftround

    " Ignore compiled files
    set wildignore+=*.pyc,*.pyo
    set wildignore+=*.egg,*.egg-info

    " Don't display compiled files in NERDTree.
    let NERDTreeIgnore += ['.*.pyc$', '*.pyc$']

    " Disable spell check in python files
    autocmd FileType python setlocal spell spelllang = ""

" } Python configuration end

" Django configuration start {

    " Set filetype for common Django files
    autocmd BufNewFile,BufRead admin.py setlocal filetype=python.django
    autocmd BufNewFile,BufRead forms.py setlocal filetype=python.django
    autocmd BufNewFile,BufRead local_settings.py setlocal filetype=python.django
    autocmd BufNewFile,BufRead models.py setlocal filetype=python.django
    autocmd BufNewFile,BufRead settings.py setlocal filetype=python.django
    autocmd BufNewFile,BufRead urls.py setlocal filetype=python.django
    autocmd BufNewFile,BufRead views.py setlocal filetype=python.django

    " Set filetype for rest_framework's files
    autocmd BufNewFile,BufRead serializers.py setlocal filetype=python.django
    autocmd BufNewFile,BufRead permissions.py setlocal filetype=python.django

    " Increase textwidth if python file in a Django project
    autocmd FileType python.django setlocal textwidth=124

" } Django configuration end

" Instant Markdown configuration start {

    " Don't start markdown preview unless requested
    let g:instant_markdown_autostart = 0

    " Shortcut to display Markdown preview
    :nnoremap <F3> :InstantMarkdownPreview <CR>

" } Instant Markdown configuration end

" vim-indent-guides configuration start {

    " Start level for indent highlight
    let g:indent_guides_start_level = 2
    
    " Size of indent guide
    let g:indent_guides_guide_size = 1

    " Disable default colours
    let g:indent_guides_auto_colors = 0

    " Set indent highlight colours: even is DarkOrange3, odd is RoyalBlue1
    " See http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim for all 256 colours
    autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd  ctermbg=238
    autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=236
    autocmd FileType * IndentGuidesEnable

" } vim-indent-guides configuration end

" vim-signify configuration start {

    " Highlight the changed lines
    let g:signify_line_highlight = 1

" } vim-signify configuration end

" Installation check.
NeoBundleCheck

" Font
set guifont=Neep\ 18
