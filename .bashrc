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
alias Project='cd ~/Javascript/michaelodonovan-net && ls -a'
alias Blog='cd ~/Javascript/michaelodonovan-net && ls -a'
alias Scratch='cd ~/CodingNotes/ && vim scratch.md'
alias Testing='cd ~/Javascript/Learning/testing-nextjs && ls -a'
alias Printing3d='cd ~/Printing3d && ls -a'
alias Learning='cd ~/Javascript/learning-site && ls -a'

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
alias Cn='cd ~/CodingNotes && ls -a'
alias Coding='cd ~/Coding && ls -a'
alias Snippets='cd ~/Coding/my-snippets && ls -a'
alias Sessions='cd ~/.config/nvim/sessions && ls -a'
alias Fel='cd ~/Coding/front-end-learning && ls -a'
alias Notes='cd ~/Documents/notes-general && ls -a'
alias Nvimvim='cd ~/.config/nvim/ && ls -a'
alias Cronjobs='cd ~/myscripts && ls -a'
alias Scripts='cd ~/bin && ls -a'
alias Writing='cd ~/Documents/notes-writing && ls -a'
alias Pictures='cd ~/Pictures && ls -a'
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

Dotbosh() {
	collect-dotfiles.sh
	Dotfiles
	bosh
}

totalbosh() {

	Coding
	bosh

	Cn
	bosh

	Dotbosh

  cd ~/Javascript/client-sites/janandsonscleaningsolutions
	bosh

  Learning
  bosh

  Blog
  bosh

  cd ~/Javascript/apps/next-slider
	bosh

  cd ~/Javascript/nextjs-template
	bosh

	Notes
	bosh

	Writing
	bosh

	Pictures
	bosh

  cd ~/Javascript/my-apps/react-pomodoro-timer
	bosh

  Printing3d
  bosh

  cd ~/Javascript/client-sites/rbcmobility/recycle-mobility-nextjs
	bosh

  cd ~/Javascript/client-sites/rbcmobility/sanityRecycleMobility
  bosh

  cd ~/Javascript/my-apps/react-phone-clock-apps
	bosh

	Scripts
	bosh

  cd ~/WoollyRhinoBackup
	bosh

	cd ~/
}

