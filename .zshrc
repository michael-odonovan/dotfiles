## Paths ===========================
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# This sets up the source for my bash scripts:
export PATH=$PATH:~/bin:~/.local/bin

# Path to yarn
PATH=$PATH:~/.yarn/bin


# ZSH ===============================
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

## zsh theme
ZSH_THEME="af-magic"

## oh-my-zsh plugins
plugins=(
  # zsh-syntax-highlighting
)

# oh my zsh plugin manager
source $ZSH/oh-my-zsh.sh

## custom plugins from elsewhere
# zsh auto sugggestions
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# vim stuff ==================================================
export EDITOR='vim'

# Using vim functionality in Bash
# does this work???
set -o vi


# Aliases ===================
# utilities
alias ..='cd ..'
alias largefiles='ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n20'
alias root='cd `git rev-parse --show-toplevel`'
alias kill3000='kill -9 $(lsof -ti:3000)'
alias kill8000='kill -9 $(lsof -ti:8000)'
alias v='nvim' # If ever need to open nvim just use $ vi
alias vim='nvim' # If ever need to open nvim just use $ vi
alias vi='nvim'
alias yabaistart='brew services start yabai'
alias yabairestart='brew services restart yabai'
alias yabaistop='brew services stop yabai'
alias clearbranches='git branch | grep -v "master" | xargs git branch -D'
alias lg='Lazygit'
alias yarnlong='yarn install --verbose --network-timeout 1000000'
alias trashnvim='rm -rf ~/.local/share/nvim/ && rm -rf ~/.config/nvim'
alias tp='trash-put'
alias pipe='vim ~/pipe.txt'

# yarn
alias y="yarn"
alias ya="yarn add"
alias yad="yarn add --dev"
alias ybs="yarn build-serve"
alias ycc="yarn cache clean"
alias ys='yarn start'
alias yd='yarn dev'

# fzf =================
function f() {
  local fname
  fname=$(fzf) || return
  vim "$fname"
}

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
alias fp='kitty @ launch --type=tab $(find ~/Documents/Projects -type d -maxdepth 1 | fzf)'


# tmux =================
# Open tmux automatically on terminal start ==================
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
# fi

function t() {
  tmux "$1"
}


# files =================
alias init='cd ~/.config/nvim && vim .'
alias zsh='vim ~/.zshrc'
alias wiki='cd ~/repos/Wiki && vim index.md'
alias scratch='vim ~/desktop/scratch.md'
### vscode
alias settings='cd ~/Library/Application\ Support/Code/User/ && vim settings.json'
alias keybindings='cd ~/Library/Application\ Support/Code/User/ && vim keybindings.json'

# repos
alias repos='cd ~/repos && ls -a'
alias dotfiles='cd ~/repos/dotfiles && vim .'
alias gitpractise='cd ~/repos/gitpractise && vim .'
alias cv='cd ~/repos/cv && vim michael-odonovan-CV.md'
alias writing='cd ~/repos/writing && tree'
alias printing3d='cd ~/repos/printing3d && ls -a'
alias myl='cd ~/repos/mylearningsite/ && ls -a'
alias mike='cd ~/repos/michaelodonovan.net/ && tree'

# folders
alias eliz='cd ~/ElizHelp && ls -a'
alias config='cd ~/.config && tree'
alias nvimfolder='cd ~/.config/nvim/ && tree'
alias snippets='cd ~/.config/nvim/snippets-luasnip-vscode/snippets/javascript-ecosystem/ && vim .'
alias documents='cd ~/Documents && ls -a'
alias scripts='cd ~/bin && ls -a'
alias photos='cd ~/Pictures/Photos && ls -a'

# areas
alias desktop='cd ~/Desktop && ls -a'
alias downloads='cd ~/Downloads && tree'
alias trash='cd ~/.local/share/Trash/files/'

# Current Workplace
alias cr='cd ~/cr/comicrelief-contentful/ && ls -a'
alias cl='cd ~/cr/component-library/ && ls -a'
alias yst='yarn styleguide'
alias donate='cd ~/cr/react-donation/ && ls -a'
alias tickets='cd ~/repos/tickets/ && vim .'
alias snaps='yarn test -u'
alias trashgql='trash-put ./graphql/schema.gql'

# git ================================
alias gpempty='git commit --allow-empty -m "Empty commit to trigger build" && git push'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
function gpo() {
  git pull origin "$1"
}
function gac() {
  git add -A 
  git commit -m "$1"
}
function gacp() {
  git add -A
  git commit -m "$1"
  git push
}
function bosh() {
  git add -A 
  git commit -m "update" 
  git push
}

 
# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# expanding an alias with <C-x>a
local cmd_alias=""
# Reveal Executed Alias
alias_for() {
  [[ $1 =~ '[[:punct:]]' ]] && return
  local search=${1}
  local found="$( alias $search )"
  if [[ -n $found ]]; then
    found=${found//\\//} # Replace backslash with slash
    found=${found%\'} # Remove end single quote
    found=${found#"$search="} # Remove alias name
    found=${found#"'"} # Remove first single quote
    echo "${found} ${2}" | xargs # Return found value (with parameters)
  else
    echo ""
  fi
}

expand_command_line() {
  first=$(echo "$1" | awk '{print $1;}')
  rest=$(echo ${${1}/"${first}"/})

  if [[ -n "${first//-//}" ]]; then # is not hypen
    cmd_alias="$(alias_for "${first}" "${rest:1}")" # Check if there's an alias for the command
    if [[ -n $cmd_alias ]] && [[ "${cmd_alias:0:1}" != "." ]]; then # If there was and not start with dot
      echo "${T_GREEN}❯ ${T_YELLOW}${cmd_alias}${F_RESET}" # Print it
    fi
  fi
}
pre_validation() {
  [[ $# -eq 0 ]] && return                    # If there's no input, return. Else...
  expand_command_line "$@"
}
autoload -U add-zsh-hook                      # Load the zsh hook module. 
add-zsh-hook preexec pre_validation           # Adds the hook 


# fzf fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

