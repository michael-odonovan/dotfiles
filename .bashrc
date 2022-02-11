## If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

## append to the history file, don't overwrite it
shopt -s histappend

## History
HISTSIZE=1000
HISTFILESIZE=2000

## check the window size after each command and, if necessary,
## update the values of LINES and COLUMNS.
shopt -s checkwinsize

## make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## enable programmable completion features (you don't need to enable
## this, if it's already enabled in /etc/bash.bashrc and /etc/profile
## sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ========== Bash Prompt ===========
# Getting the git branch:
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# This follows the Linux Command Line book, page 149.
# good color guide: https://gist.github.com/vratiu/9780109
PS1="\[\033[0;95m\] [\h] \[\033[0;36m\]\w \[\033[0;31m\]\$(parse_git_branch)\[\033[0;36m\] \$\[\033[0m\] "
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
alias root='cd `git rev-parse --show-toplevel`'
alias kill3000='kill -9 $(lsof -ti:3000)'
alias Project='cd ~/Javascript/client-sites/rbcmobility/recycle-mobility-nextjs && ls -a'
alias Blog='cd ~/Javascript/michaelodonovan-net && ls -a'
alias Scratch='cd ~/CodingNotes/ && vim scratch.md'
alias Testing='cd ~/Javascript/Learning/testing-nextjs && ls -a'
alias Printing3d='cd ~/Printing3d && ls -a'
alias Learning='cd ~/Javascript/Learning && ls -a'

alias ..='cd ..'

# connect to bluetooth amplifier
alias Sound='bluetoothctl connect 00:13:EF:A0:45:F5'
# show largest 20 files in a folder:
alias LargeFiles='ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n20'

# Open Files
alias Init='cd ~/.config/nvim/ && vim init.vim'
alias Bashrc='cd && vim .bashrc'

# Go To Folders
alias Nvim='cd ~/.config/nvim/ && ls -a'
alias Documents='cd ~/Documents && ls -a'
alias Javascript='cd ~/Javascript && ls -a'
alias Js='cd ~/Javascript && ls -a'
alias Cn='cd ~/CodingNotes && ls -a'
alias Coding='cd ~/Coding && ls -a'
alias Snippets='cd ~/Coding/my-snippets && ls -a'
alias Sessions='cd ~/.config/nvim/sessions && ls -a'
alias Fel='cd ~/Coding/front-end-learning && ls -a'
alias Notes-General='cd ~/Documents/notes-general && ls -a'
alias Nvimvim='cd ~/.config/nvim/ && ls -a'
alias Cronjobs='cd ~/myscripts && ls -a'
alias Scripts='cd ~/bin && ls -a'
alias Writing='cd ~/Documents/notes-writing && ls -a'
alias Pictures='cd ~/Pictures && ls -a'
alias Dotfiles='cd ~/Dotfiles && ls -a'
alias NewInstall='cd ~/NewInstall && ls -a'

# Areas
alias Desk='cd ~/Desktop && ls -a'
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
function gac() {
	git add -A
	git commit -m "$1"
}

dotbosh() {
	collect-dotfiles.sh
	Dotfiles
	bosh
}

totalbosh() {

	Coding
	bosh

	Cn
	bosh

  # NewInstall - ignore this as have alread done Dotfiles
	Dotbosh

  # NewInstall - 
  # mkdir Javascript
  # mkdir Javascript/client-sites
  # cd Javascript/client-sites
  # download jan gh repo
  cd ~/Javascript/client-sites/janandsonscleaningsolutions
	bosh

  Learning
  bosh

  Blog
  bosh

  # NewInstall 
  # mkdir ~/Javascript/apps
  cd ~/Javascript/apps/next-slider
	bosh

  cd ~/Javascript/nextjs-template
	bosh

	Notes-General
	bosh

	Writing
	bosh

	Pictures
	bosh

  Printing3d
  bosh

  # New Install -
  # mkdir ~/Javascript/rbcmobility
  cd ~/Javascript/client-sites/rbcmobility/recycle-mobility-nextjs
	bosh

  cd ~/Javascript/client-sites/rbcmobility/rbcmobility-sanityio
  bosh

  cd ~/Javascript/my-apps/react-phone-clock-apps
	bosh

	Scripts
	bosh

  cd ~/WoollyRhinoBackup
	bosh

	cd ~/
}

newinstall() {

# adding number navigation to Workspaces
gsettings set org.gnome.shell.keybindings switch-to-application-1  []
gsettings set org.gnome.shell.keybindings switch-to-application-2  []
gsettings set org.gnome.shell.keybindings switch-to-application-3  []
gsettings set org.gnome.shell.keybindings switch-to-application-4  []
gsettings set org.gnome.shell.keybindings switch-to-application-5  []
gsettings set org.gnome.shell.keybindings switch-to-application-6  []
gsettings set org.gnome.shell.keybindings switch-to-application-7  []
gsettings set org.gnome.shell.keybindings switch-to-application-8  []
gsettings set org.gnome.shell.keybindings switch-to-application-9  []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1  "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2  "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3  "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4  "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5  "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6  "['<Super>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7  "['<Super>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8  "['<Super>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9  "['<Super>9']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1  "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2  "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3  "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4  "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5  "['<Super><Shift>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6  "['<Super><Shift>6']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7  "['<Super><Shift>7']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8  "['<Super><Shift>8']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9  "['<Super><Shift>9']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Super><Shift>0']"

# github
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh


}
