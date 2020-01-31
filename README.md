# dotfiles

"Simple, but extensive customization of ZSH, TMUX, and Vim."

> This repo is my customized dotfiles setup based off the great install script from [Parth](https://github.com/Parth). You can find his original dotfiles repo with setup and installation info [here](https://github.com/Parth/dotfiles). If you've wanted to add customization to your Vim/TMUX workflow, but you find yourself a bit overwelmed on what exactly to do, his easy setup script is a great place to start.

## Changes

### vimrc.vim

Plugins:

- ['scrooloose/nerdcommenter'](https://github.com/preservim/nerdcommenter)
- ['ctrlpvim/ctrlp.vim'](https://github.com/ctrlpvim/ctrlp.vim)
- ['townk/vim-autoclose'](https://github.com/Townk/vim-autoclose)
- ['airblade/vim-gitgutter'](https://github.com/airblade/vim-gitgutter)
- ['mxw/vim-jsx'](https://github.com/mxw/vim-jsx)
- ['pangloss/vim-javascript'](https://github.com/pangloss/vim-javascript)

General settings:

```
set noswapfile " << at your own risk

" Create Ctrl-/ or Cmd-/ bind in iTerm to send "^^"
    vmap ^^ <plug>NERDCommenterToggle
    nmap ^^ <plug>NERDCommenterToggle

" CtrlP open in new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" Moving lines in Vim
" Normal mode
    nnoremap <C-j> :m .+1<CR>==
    nnoremap <C-k> :m .-2<CR>==
" Insert mode
    inoremap <C-j> <ESC>:m .+1<CR>==gi
    inoremap <C-k> <ESC>:m .-2<CR>==gi
" Visual mode
    vnoremap <C-j> :m '>+1<CR>gv=gv
    vnoremap <C-k> :m '<-2<CR>gv=gv

" Status line
    set laststatus=2
    set statusline+=\ %F
    set statusline+=%=
    set statusline+=%L
    set statusline+=:
    set statusline+=%l
    set statusline+=:
    set statusline+=%c
    set statusline+=\ 
```

### zshrc.sh

Helpful aliases:

```
# Aliases
    alias v='vim -p'
    mkdir -p /tmp/log
    alias cd..='cd ..'
    alias ll='ls -alF'
    alias lsa='ls -la'
    alias la='ls -A'
    alias ls='ls -CF'
    alias cls='clear'
    alias n='nano -m'
    alias g++="g++-9"

# Git aliases
    alias ga='git add'
    alias gaa='git add .'
    alias gaaa='git add -A'
    alias gc='git commit'
    alias gcm='git commit -m'
    alias gd='git diff'
    alias gi='git init'
    alias gl='git log'
    alias gp='git pull'
    alias gpsh='git push'
    alias gss='git status -s'
    alias gcnt='git ls-files | wc -l'
```

### tmux.conf

```
# Start windows and panes at 1
set -g base-index 1
set -g status-right '#[fg=colour233,bg=colour245,bold] %A %-I:%M #[fg=colour255,bg=colour000] #(whoami)@#W '
```
