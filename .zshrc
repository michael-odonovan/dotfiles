# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


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
alias PR='vim ~/Repos/GitPractise/PR-template.md'
alias Init='cd ~/.config/nvim && vim init.lua'
alias Bashrc='vim ~/.bashrc'
alias Zsh='vim ~/.zshrc'
alias GitConfig='vim ~/.gitconfig'
alias Wiki='cd ~/Repos/Wiki && vim index.md'
alias CV='cd ~/CV && vim .'
alias Scratch='cd && vim scratch.md'

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
  cp ~/.gitmessage ~/Repos/DotFiles/.gitmessage
  cp ~/.gitconfig ~/Repos/DotFiles/.gitconfig
  cp ~/.zshrc ~/Repos/DotFiles/.zshrc
  cp ~/.bashrc ~/Repos/DotFiles/.bashrc
  cp ~/.bashrc-new-install ~/Repos/DotFiles/.bashrc-new-install
  cp ~/.bash_profile ~/Repos/DotFiles/.bash_profile
  cp ~/.tmux.conf ~/Repos/DotFiles/.tmux.conf
  cp ~/.config/alacritty/alacritty.yml ~/Repos/DotFiles/alacritty.yml
  cp ~/.config/nvim-old/init.vim ~/Repos/DotFiles/init.vim
  cp ~/.config/Code/User/settings.json ~/Repos/DotFiles/vs-code/settings.json
  cp ~/.config/Code/User/keybindings.json ~/Repos/DotFiles/vs-code/keybindings.json
  cp ~/.config/karabiner/karabiner.json ~/Repos/DotFiles/karabiner.json
  cp ~/.config/yabai/yabairc ~/Repos/DotFiles/yabairc
  cp ~/.config/skhd/skhdrc ~/Repos/DotFiles/skhdrc
  cd ~/Repos/DotFiles
  bosh
}
