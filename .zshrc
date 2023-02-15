## Paths ===========================
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# This sets up the source for my bash scripts:
export PATH=$PATH:~/bin:~/.local/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to yarn
PATH=$PATH:~/.yarn/bin

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# zsh theme ===============================
ZSH_THEME="af-magic"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# MY STUFF ==================================================
export EDITOR='vim'

# Open tmux automatically on terminal start ==================
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
# fi

# Using vim functionality in Bash
# does this work???
set -o vi


# Aliases ===================

# utilities
alias ..='cd ..'
alias LargeFiles='ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n20'
alias root='cd `git rev-parse --show-toplevel`'
alias kill3000='kill -9 $(lsof -ti:3000)'
alias vim='lvim' # If ever need to open original vim just use $ vi
alias vi='vim'
alias yabaistart='brew services start yabai'
alias yabairestart='brew services restart yabai'
alias yabaistop='brew services stop yabai'
alias yd='yarn dev'
alias ys='yarn start'
alias live='live-server'

# files
alias Init='cd ~/.config/lvim && vim config.lua'
# alias Init='cd ~/.config/nvim && vim init.lua'
alias Bashrc='vim ~/.bashrc'
alias Zsh='vim ~/.zshrc'
alias GitConfig='vim ~/.gitconfig'
alias wiki='cd ~/Repos/Wiki && vim index.md'
alias scratch='vim ~/desktop/scratch.md'
### vscode
alias Settings='cd ~/Library/Application\ Support/Code/User/ && vim settings.json'
alias Keybindings='cd ~/Library/Application\ Support/Code/User/ && vim keybindings.json'

# Repos
alias Repos='cd ~/Repos && ls -a'
alias Dotfiles='cd ~/Repos/Dotfiles && vim .'
alias GitPractise='cd ~/Repos/GitPractise && vim .'
alias CV='cd ~/Repos/CV && vim michael-odonovan-CV.md'
alias Writing='cd ~/Repos/Writing && ls -a'
alias Printing3d='cd ~/Repos/Printing3d && ls -a'
alias myl='cd ~/Learning/my-learning-site/ && ls -a'
alias gitprac='cd ~/Learning/git-practise && ls -a'
alias learn='cd ~/Learning && ls -a'
alias Pictures='cd ~/Repos/Pictures && ls -a'
alias Wr='cd ~/Repos/Wr && ls -a'
alias mike='cd ~/Repos/michaelodonovan.net/ && ls -a'
alias Gold='cd ~/ElizHelp/goldfinch-carpentry && ls -a'


# folders
alias eliz='cd ~/ElizHelp && ls -a'
alias Nvim='cd ~/.config/nvim/ && ls -a'
alias snippets='cd ~/.config/nvim/snippets-luasnip-vscode/snippets/javascript-ecosystem/ && vim .'
alias snips='cd ~/.config/nvim/snippets-luasnip-vscode/snippets/javascript-ecosystem/ && vim .'
alias docs='cd ~/Documents && ls -a'
alias scripts='cd ~/bin && ls -a'
alias photos='cd ~/Pictures/Photos && ls -a'

# areas
alias desk='cd ~/Desktop && ls -a'
alias down='cd ~/Downloads && ls -a'
alias trash='cd ~/.local/share/Trash/files/'

# Current Workplace
alias cr='cd ~/CR/comicrelief-contentful/ && ls -a'
alias cl='cd ~/CR/component-library/ && ls -a'
alias yst='yarn styleguide'
alias donate='cd ~/CR/react-donation/ && ls -a'
alias tickets='cd ~/Desktop/tickets/ && ls -a'
alias snaps='yarn test -u && gacp "snaps"'
alias trash-gql='trash-put ./graphql/schema.gql'

# git ================================
alias gpempty='git commit --allow-empty -m "Empty commit to trigger build" && git push'

# $ gpo "master" / "main"
function gpo() {
  git pull origin "$1"
}

# $ gac "commit message"
function gac() {
	git add -A
	git commit -m "$1"
}

# $ gac "commit message"
function gac() {
	git add -A
	git commit -m "$1"
}

# $ gacp "commit message"
function gacp() {
	git add -A
	git commit -m "$1"
  git push
}

# lazy lazy git update for personal repos
function bosh() {
	git add -A
	git commit -m "update"
	git push
}


