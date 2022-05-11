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
export PATH=$PATH:~/bin:~/.local/bin

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
alias Project='cd ~/RbcMobilityNextJs && ls -a'
alias Blog='cd ~/Blog && ls -a'
alias Scratch='cd && vim scratch.md'
alias Printing3d='cd ~/Printing3d && ls -a'
alias Learning='cd ~/Learning && ls -a'
alias Pictures='cd ~/Pictures'
alias Trash='cd ~/.local/share/Trash/files/'

alias ..='cd ..'

# connect to bluetooth amplifier
alias Sound='bluetoothctl connect 00:13:EF:A0:45:F5'
# show largest 20 files in a folder:
alias LargeFiles='ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n20'

# Open Files
alias Init='cd ~/.config/nvim && vim init.lua'
alias Bashrc='vim ~/.bashrc'
alias GitConfig='vim ~/.gitconfig'
alias Wiki='cd ~/Wiki && vim index.md'
alias Coding='cd ~/Wiki && vim Coding-Notes.md'
alias CV='cd ~/CV && vim .'

# Go To Folders
alias GitPractise='cd ~/GitPractise/ && vim .'
alias Nvim='cd ~/.config/nvim/ && ls -a'
alias Snippets='cd ~/.config/nvim/snippets-luasnip-vscode/snippets/javascript-ecosystem/ && vim .'
alias Documents='cd ~/Documents && ls -a'
alias Cn='cd ~/CodingNotes && ls -a'
alias Sessions='cd ~/.config/nvim/sessions && ls -a'
alias NotesGeneral='cd ~/NotesGeneral && ls -a'
alias Scripts='cd ~/bin && ls -a'
alias Writing='cd ~/Writing && ls -a'
alias Photos='cd ~/Pictures/Photos && ls -a'
alias DotFiles='cd ~/DotFiles && ls -a'
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
alias czInit='pip install -U commitizen'

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

function dotbosh() {
  cd
  cp ~/.gitconfig ~/DotFiles/.gitconfig
  cp ~/.bashrc ~/DotFiles/.bashrc
  cp ~/.bashrc-new-install ~/DotFiles/.bashrc-new-install
  cp ~/.bash_profile ~/DotFiles/.bash_profile
  cp ~/.tmux.conf ~/DotFiles/.tmux.conf
  cp ~/.config/alacritty/alacritty.yml ~/DotFiles/alacritty.yml
  cp ~/.config/nvim-old/init.vim ~/DotFiles/init.vim
  cp ~/.config/Code/User/settings.json ~/DotFiles/vs-code/settings.json
  cp ~/.config/Code/User/keybindings.json ~/DotFiles/vs-code/keybindings.json
  # cp ~/.config/karabiner/karabiner.json ~/DotFiles/karabiner.json
  # cp ~/.config/yabai/yabairc ~/DotFiles/yabairc
  # cp ~/.config/skhd/skhdrc ~/DotFiles/skhdrc
  cd DotFiles
  bosh
}

totalbosh() {
  echo Scripts =========================
  cd ~/bin
  bosh
  echo 

  echo Bookmarks =========================
  cd ~/Bookmarks
  bosh
  echo 

  echo Coding =========================
  cd ~/CodingWiki
  bosh
  echo 

  echo Coding Notes =========================
  cd ~/CodingNotes
  bosh
  echo 

  echo dotbosh =========================
  echo 

  dotbosh
  echo

  echo Learning =========================
  cd ~/Learning
  bosh
  echo

  echo NewInstall =========================
  cd ~/NewInstall
  bosh
  echo

  echo NotesGeneral =========================
  cd ~/NotesGeneral
  bosh
  echo

  echo nvim =========================
  cd ~/.config/nvim
  bosh
  echo

  echo Photos =========================
  cd ~/Pictures/Photos
  bosh
  echo

  echo Printing3d =========================
  cd ~/Printing3d
  bosh
  echo 

  echo WRBackup =========================
  cd ~/WRBackup
  bosh
  echo

  echo Writing =========================
  cd ~/Writing
  bosh
  echo

  cd ~/
}

