export PATH=~/.npm-global/bin:$PATH

# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history

	git config --global push.default current

# Aliases
    alias v='vim -p'
	mkdir -p /tmp/log
    alias cd..='cd ..'
    alias ll='ls -alF'
    alias lsa='ls -hla'
    alias lsr='ls -lR'
    alias la='ls -A'
    alias ls='ls -CF'
    alias cls='clear'
    alias n='nano -m'
    alias g++="g++-9"
    alias kata="cd /Users/Bloumbs/dev/cw-katas"
    alias top="vtop --theme=wizard"
    alias oldtop="/usr/bin/top"
    alias vasm="/Users/Bloumbs/vasm/vasm6502_oldstyle"

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
    alias gss='git status'
    alias gcnt='git ls-files | wc -l'
    alias lg='lazygit'

# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
	export VISUAL=vim
    export EDITOR=vim

    source ~/dotfiles/zsh/plugins/fixls.zsh

#Functions
	# Loop a command and show the output in vim
	loop() {
		echo ":cq to quit\n" > /tmp/log/output 
		fc -ln -1 > /tmp/log/program
		while true; do
			cat /tmp/log/program >> /tmp/log/output ;
			$(cat /tmp/log/program) |& tee -a /tmp/log/output ;
			echo '\n' >> /tmp/log/output
			vim + /tmp/log/output || break;
			rm -rf /tmp/log/output
		done;
	}

 	# Custom cd
 	c() {
        cd $1;
 	  	ls;
 	}
 	#alias cd="c"

    # "grepr" search function
    grepr() {
        grep -inRw -E "$1" "$2" --include=\*.{c,h,cpp,hpp,py,js,ts,html} --exclude-dir={.git,__pycache__,.vscode,bin,lib,include,node_modules}
    }

# For vim mappings: 
	stty -ixon

# Completions
# These are all the plugin options available: https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3/plugins
#
# Edit the array below, or relocate it to ~/.zshrc before anything is sourced
# For help create an issue at github.com/parth/dotfiles

autoload -U compinit

plugins=(
	docker
)

for plugin ($plugins); do
    fpath=(~/dotfiles/zsh/plugins/oh-my-zsh/plugins/$plugin $fpath)
done

compinit

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/prompt.sh
export PATH=$PATH:$HOME/dotfiles/utils
export PATH=$PATH:$HOME/Qt/5.15.0/clang_64/bin
export PATH=$PATH:~/scripts
