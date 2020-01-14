# dotfiles

"Simple, but extensive customization of ZSH, TMUX, and Vim."

> This repo is my customized dotfiles setup based off the great install script from [Parth](https://github.com/Parth). You can find his original dotfiles repo with setup and installation info [here](https://github.com/Parth/dotfiles). If you've wanted to add customization to your Vim/TMUX workflow, but you find yourself a bit overwelmed on what exactly to do, his easy setup script is a great place to start.

## Changes

### vimrc.vim

Colorscheme:

- [monokain](https://github.com/flazz/vim-colorschemes/blob/master/colors/monokain.vim)

Plugins:

- ['scrooloose/nerdcommenter'](https://github.com/preservim/nerdcommenter)
- ['ctrlpvim/ctrlp.vim'](https://github.com/ctrlpvim/ctrlp.vim)
- ['townk/vim-autoclose'](https://github.com/Townk/vim-autoclose)

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
```

### tmux.conf

```
# Start windows and panes at 1
set -g base-index 1
```
