vim9script

#  _   _ ________  ___ _____ _____ _____ _   _ ______ _____ _____ 
# | | | |_   _|  \/  ||  _  /  __ \  _  | \ | ||  ___|_   _|  __ \
# | | | | | | | .  . || |_| | /  \/ | | |  \| || |_    | | | |  \/
# | | | | | | | |\/| |\____ | |   | | | | . ` ||  _|   | | | | __ 
# \ \_/ /_| |_| |  | |.___/ / \__/\ \_/ / |\  || |    _| |_| |_\ \
#  \___/ \___/\_|  |_/\____/ \____/\___/\_| \_/\_|    \___/ \____/
                                                                
# MANUAL
# ----------
# 1. Install vim-plug
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 2. Compile ycm
# cd ~/.vim/plugged/YouCompleteMe && python3 install.py


plug#begin('~/.vim/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'mattn/emmet-vim'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-eunuch'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'preservim/nerdcommenter'
	Plug 'ziglang/zig.vim'
	Plug 'sainnhe/everforest'
	Plug 'leafgarland/typescript-vim'
	Plug 'pangloss/vim-javascript'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'justinmk/vim-sneak'
	Plug 'ycm-core/YouCompleteMe'
plug#end()

#######################################################################################################

&t_ut = ''

if has('termguicolors')
	set termguicolors
endif

colorscheme everforest

set history=1000

filetype plugin on 
filetype indent on

set omnifunc=syntaxcomplete#Complete

# With a map leader it's possible to do extra key combinations
# like <leader>w saves the current file
nnoremap <space> <nop>
g:mapleader = " "

# :W sudo saves the file
# (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

# Turn on the Wild menu
set wildmenu

# Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

# Set line numbers
set number

# Always show current position
set ruler

# Height of the command bar
set cmdheight=1

# A buffer becomes hidden when it is abandoned
set hid

# Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

# Ignore case when searching
set ignorecase

# When searching try to be smart about cases
set smartcase

# Highlight search results
set hlsearch

# Makes search act like search in modern browsers
set incsearch

# Don't redraw while executing macros (good performance config)
set lazyredraw

# For regular expressions turn magic on
set magic

# Show matching brackets when text indicator is over them
set showmatch

# How many tenths of a second to blink when matching brackets
set mat=1

# No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

# Enable syntax highlighting
syntax enable

# Set regular expression engine automatically
set regexpengine=0

# Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

set background=dark

# Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

# Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

# Use Unix as the standard file type
set ffs=unix,dos,mac

# Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

# Be smart when using tabs ;)
set smarttab

set shiftwidth=4
set tabstop=4

# Linebreak on 500 characters
set lbr
set tw=500


# Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

# Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

# Always show the status line
set laststatus=2

# Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

##########################################################################################################################
# MAPPINGS #
###########################################################################################################################

# Remap VIM 0 to first non-blank character
map 0 ^

# Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

# Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

# Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

# Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

# Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

# Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

# Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

# Fast saving
nmap <C-s> :w!<cr>

# Visual mode pressing * or # searches for the current selection
# Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

# Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

# Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

# Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

# Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

# Let 'tl' toggle between this and the last accessed tab
g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * g:lasttab = tabpagenr()

# Opens a new tab with the current buffer's path
# Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

# Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

map <C-p> :GFiles<cr>
map <leader>p :Files<cr>
map <leader>b :Buffers<cr>
map <C-g> :Rg<cr>
map <leader>p :Rg<cr>
map <leader>fl :Lines<cr>
