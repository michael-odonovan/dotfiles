# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zsh theme
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.

# MY STUFF ==================================================
export EDITOR='nvim'

# This sets up the source for my bash scripts:
export PATH=$PATH:~/bin:~/.local/bin

# Open tmux automatically on terminal start ==================
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
 exec tmux
fi

# Using vim functionality in Bash
# does this work???
set -o vi

# Aliases ===================
# utilities
alias ..='cd ..'
alias LargeFiles='ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n20'
alias root='cd `git rev-parse --show-toplevel`'
alias kill3000='kill -9 $(lsof -ti:3000)'
alias vim='nvim' # If ever need to open original vim just use $ vi
alias vi='vim'
alias yabaistart='brew services start yabai'
alias yabaistop='brew services stop yabai'

# files
alias Dotfiles='cd ~/Repos/Dotfiles && vim .'
alias PR='vim ~/Repos/GitPractise/PR-template.md'
alias Init='cd ~/.config/nvim && vim init.lua'
alias Bashrc='vim ~/.bashrc'
alias Zsh='vim ~/.zshrc'
alias GitConfig='vim ~/.gitconfig'
alias Wiki='cd ~/Repos/Wiki && vim index.md'
alias CV='cd ~/CV && vim .'
alias Scratch='cd && vim scratch.md'
### vscode
alias Settings='cd ~/Library/Application\ Support/Code/User/ && vim settings.json'
alias Keybindings='cd ~/Library/Application\ Support/Code/User/ && vim keybindings.json'

# folders
alias Repos='cd ~/Repos && ls -a'
alias CR='cd ~/ComicRelief && ls -a'
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

# areas
alias Desk='cd ~/Desktop && ls -a'
alias Downloads='cd ~/Downloads && ls -a'
alias Project='cd ~/RbcMobilityNextJs && ls -a'
alias Blog='cd ~/Blog && ls -a'
alias Printing3d='cd ~/Printing3d && ls -a'
alias Learning='cd ~/Learning && ls -a'
alias Pictures='cd ~/Pictures'
alias Trash='cd ~/.local/share/Trash/files/'

# git ================================
alias gst='git status'
# ??? delete this? =>
alias czInit='pip install -U commitizen'

function bosh() {
	git add -A
	git commit -m "update"
	git push
}

# $ gacp "commit message"
function gac() {
	git add -A
	git commit -m "$1"
}


# backups ======================================
function dotbosh() {
  cd
  # git
  cp ~/.gitmessage ~/Repos/DotFiles/.gitmessage
  cp ~/.gitconfig ~/Repos/DotFiles/.gitconfig

  cp ~/.zshrc ~/Repos/DotFiles/.zshrc
  cp ~/.bashrc ~/Repos/DotFiles/.bashrc
  cp ~/.bash_profile ~/Repos/DotFiles/.bash_profile
  cp ~/.tmux.conf ~/Repos/DotFiles/.tmux.conf

  # window manager
  cp ~/.yabairc ~/Repos/DotFiles/.yabairc
  cp ~/.skhdrc ~/Repos/DotFiles/.skhdrc

  # vscode
  cp ~/Library/Application\ Support/Code/User/settings.json ~/Repos/DotFiles/vs-code/settings.json 
  cp ~/Library/Application\ Support/Code/User/keybindings.json ~/Repos/DotFiles/vs-code/keybindings.json 

  cd ~/Repos/DotFiles
  bosh
}
