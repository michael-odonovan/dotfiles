# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# From mac days ====================
# ========== Bash Prompt ===========
# Getting the git branch:
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# This follows the Linux Command Line book, page 149.
# good color guide: https://gist.github.com/vratiu/9780109
PS1="\[\033[0;95m\] [\u@\h] \[\033[0;36m\]\w \[\033[0;31m\]\$(parse_git_branch)\[\033[0;36m\] \$\[\033[0m\] "
export PS1

# ========== General ===========

# Remove Background Colors or writable folders:
# followed this guide here:
# https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
export CLICOLOR=1

# goes foreground/background ie. ex is one type.
export LSCOLORS=exxxxxxxxxxxxxxxxxexex


# This sets up the source for my bash scripts:
export PATH=$PATH:~/bin

# This was to solve an error I was getting in nvim terminal:
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

# Python Stuff, using pyenv https://opensource.com/article/19/5/python-3-default-mac
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# Using vim functionality in Bash
set -o vi

# Open tmux automatically on terminal start
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
 exec tmux
fi

# ========== Aliases ===========
alias Project='cd ~/Javascript/recycle-mobility && ls -a'
alias Scratch='cd ~/Coding-notes/ && vim scratch.md'
alias Keyboard='cd ~/Coding-notes/keyboard && ls -a'
alias CopyFile='vim ~/bin/copy-file.sh'
alias Testing='cd ~/Javascript/learning/testing-nextjs && ls -a'
alias Patterns='cd ~/Javascript/learning/patterns && ls -a'
alias Learning='cd ~/Javascript/learning && ls -a'

alias session='vim -S Session.vim'
alias ..='cd ..'

# connect to bluetooth amplifier
alias Sound='bluetoothctl connect 00:13:EF:A0:45:F5'
# show largest 20 files in a folder:
alias LargeFiles='ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n20'

# Open Files
alias Init='cd ~/.config/nvim/ && vim init.vim'
alias Bashrc='cd && vim .bashrc'

# Go To Folders
alias Documents='cd ~/Documents && ls -a'
alias Javascript='cd ~/Javascript && ls -a'
alias Js='cd ~/Javascript && ls -a'
alias Cn='cd ~/Coding-notes && ls -a'
alias Coding='cd ~/Coding && ls -a'
alias Snippets='cd ~/Coding/my-snippets && ls -a'
alias Sessions='cd ~/.config/nvim/sessions && ls -a'
alias Pedal='cd ~/local\ sites/pedal-woocommerce/app/public/wp-content/themes/pedal-woocommerce && ls -a'
alias Template='~/local\ sites/my-underscores-template/app/public/wp-content/themes/my-underscores-template'
alias Fel='cd ~/Coding/front-end-learning && ls -a'
alias Notes='cd ~/Documents/notes-general && ls -a'
alias Template='cd ~/local\ sites/my-underscores-template/app/public/wp-content/themes/my-underscores && ls -a'
alias Woolly='cd ~/local\ sites/woolly-rhino/app/public/wp-content/themes/my-underscores && ls -a'
alias Parts='cd ~/Coding/parts && ls -a'
alias Locals='cd ~/local\ sites && ls -a' # can't have ls or local!
alias Nvimvim='cd ~/.config/nvim/ && ls -a'
alias Cronjobs='cd ~/myscripts && ls -a'
alias Scripts='cd ~/bin && ls -a'
alias Sites='cd ~/Sites && ls -a'
alias Writing='cd ~/Documents/notes-writing && ls -a'
alias Pictures='cd ~/Pictures && ls -a'
alias eBooks='cd ~/Documents/eBooks && ls -a'
alias Dotfiles='cd ~/Dotfiles && ls -a'

# Areas
alias Desk='cd ~/desktop && ls -a'
alias Downloads='cd ~/Downloads && ls -a'

# Neovim stuff.
# If ever need to open original vim just use $ vi
alias vim='nvim'
alias vi='vim'
export EDITOR='nvim'

# FZF Fuzzy Finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPS="--extended"

# Stopping nvim terminal nesting
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr -cc e --remote-wait +'set bufhidden=wipe'"
else
  export VISUAL="nvim"
fi
alias vim="$VISUAL"

# ========== Git Stuff ===========
alias gst='git status'

function bosh() {
	git add -A
	git commit -m "update"
	git push
}

# Add all, commit and push (to origin) all at once
# $ gacp "commit message"
function gacp() {
	git add -A
	git commit -m "$1"
	git push origin
}

dotbosh() {
	collect-dotfiles.sh
	Dotfiles
	bosh
}

totalbosh() {

	echo 'sites-general ============================================'
  Sites
	echo 'pushing "Sites"'
	bosh
	echo 'sites-general done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'react-phone-clock-apps ============================================'
	echo 'pushing "react-phone-clock-apps"'
  cd ~/Javascript/my-apps/react-phone-clock-apps
	bosh
	echo 'react-phone-clock-apps done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'react-pomodoro-timer ============================================'
  cd ~/Javascript/my-apps/react-pomodoro-timer
	echo 'pushing "react-pomodoro-timer"'
	bosh
	echo 'react-pomodoro-timer done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'next-slider ============================================'
  cd ~/Javascript/my-apps/next-slider
	echo 'pushing "next-slider"'
	bosh
	echo 'next-slider done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'nextjs-template ============================================'
  cd ~/Javascript/nextjs-template
	echo 'pushing "nextjs-template"'
	bosh
	echo 'nextjs-template done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'recycle-mobility ============================================'
  cd ~/Javascript/recycle-mobility
	echo 'pushing "recycle-mobility"'
	bosh
	echo 'recycle-mobility done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'my-nextjs-blog ============================================'
  cd ~/Javascript/my-nextjs-blog
	echo 'pushing "my-nextjs-blog"'
	bosh
	echo 'my-nextjs-blog done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'dotbosh ============================================'
	dotbosh
	echo 'pushing "Dotfiles"'
	echo 'dotbosh done --------------------------------------'
	sleep 2
	echo $'\n'

	echo 'Coding-notes ============================================'
	Cn
	bosh
	echo 'pushing "Coding-notes"'
	echo 'Coding-notes done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'Pictures ============================================'
	Pictures
	bosh
	echo 'pushing "Pictures"'
	echo 'Pictures done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'eBooks ============================================'
	eBooks
	bosh
	echo 'pushing "eBooks"'
	echo 'eBooks ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'notes-writing ============================================'
	Writing
	bosh
	echo 'pushing "notes-writing"'
	echo 'notes-writing done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'notes-general ============================================'
	Notes
	bosh
	echo 'pushing "notes-general"'
	echo 'notes-general ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'Coding ============================================'
	Coding
	bosh
	echo 'pushing "Coding"'
	echo 'Coding done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'Sites ============================================'
	Sites
	bosh
	echo 'pushing "Sites"'
	echo 'Sites done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'Scripts ============================================'
	Scripts
	bosh
	echo 'pushing "Scripts"'
	echo 'Scripts done ----------------------------------------'
	sleep 2
	echo $'\n'

	cd ~/
}

