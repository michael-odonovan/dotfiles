## Paths ===========================
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# This sets up the source for my bash scripts:
export PATH=$PATH:~/bin:~/.local/bin

# Path to yarn
PATH=$PATH:~/.yarn/bin

# Homebrew to path
export PATH=/opt/homebrew/bin:$PATH

# path to python ??? not sure this is working
export Path=$HOME/Library/Python/3.11/bin

# VS Code to path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# ChatGPT / Open AI
source "$HOME/.openai_key.zsh"

# ZSH ===============================
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

## zsh theme
ZSH_THEME="af-magic"

## oh-my-zsh plugins
plugins=(
  git
)

# oh my zsh plugin manager
source $ZSH/oh-my-zsh.sh

## custom plugins from elsewhere
# zsh auto sugggestions
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# vim stuff ==================================================
export EDITOR='nvim'

# Using vim functionality in Bash / Zsh
set -o vi

# note: can open vanilla vim with just $ vi, ie on new install
alias vi='vim'
alias vim='vim'
# or use just v
function v() {
  nvim "$1"
}


# Aliases ===================
# utilities
alias ..='cd ..'
alias largefiles='ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n20'
alias root='cd `git rev-parse --show-toplevel`'

alias kill3000='kill -9 $(lsof -ti:3000)'
alias kill8000='kill -9 $(lsof -ti:8000)'

alias yabaistart='yabai --start-service'
alias yabairestart='yabai --restart-service'
alias yabaistop='yabai --stop-service'
alias skhdstart='skhd --start-service'
alias skhdrestart='skhd --restart-service'
alias skhdstop='skhd --stop-service'

alias clearbranches='git branch | grep -v "master" | xargs git branch -D'
alias lg='Lazygit'
alias yarnlong='yarn install --verbose --network-timeout 1000000'
alias trashnvim='rm -rf ~/.local/share/nvim/ && rm -rf ~/.config/nvim'
alias tp='trash-put'
alias snaps='yarn test -u'
alias lsa='ls -a -1'
# cypress errors
alias cyp='yarn cy:run &> ~/Desktop/cl-cy-errors.md | tee'
alias lintfix='yarn run lint -- --fix && yarn lint'
alias gitclear='cd .git && tp index.lock'


# yarn
alias y="yarn"
alias ya="yarn add"
alias yad="yarn add --dev"
alias ybs="yarn build-serve"
alias ycc="yarn cache clean"
alias ys='yarn start'
alias yd='yarn dev'
alias yo='yarn outdated'
alias yb='yarn build'
function yu() {
  yarn upgrade $1@latest
}


# fzf =================
function f() {
  local fname
  fname=$(fzf) || return
  nvim "$fname"
}

export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --border
'

export FZF_DEFAULT_COMMAND='find .'

# tmux =================
# Open tmux automatically on terminal start ==================
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
# fi

function t() {
  tmux "$1"
}

# alias ts='tmux-sessions.sh && tmux attach'


# files =================
alias init='cd ~/.config/nvim && nvim .'
alias zsh='nvim ~/.zshrc'
alias wiki='cd ~/repos/Wiki && nvim index.md'
alias scratch='nvim ~/desktop/scratch.md'
### vscode
alias settings='cd ~/Library/Application\ Support/Code/User/ && nvim settings.json'
alias keybindings='cd ~/Library/Application\ Support/Code/User/ && nvim keybindings.json'
alias new-install='nvim ~/repos/notes/code/new-install.md'

# repos
alias repos='cd ~/repos && lsa'
alias dotfiles='cd ~/repos/dotfiles && nvim .'
alias gitpractise='cd ~/repos/gitpractise && nvim .'
alias cv='cd ~/repos/cv && nvim michael-odonovan-CV.md'
alias writing='cd ~/repos/writing && tree -L 2'
alias printing3d='cd ~/repos/printing3d && lsa'
alias myl='cd ~/repos/my-learning-site/ && lsa'
alias mike='cd ~/repos/michaelodonovan.net/ && tree -L 2'
alias notes='cd ~/repos/notes/ && lsa'
alias diy='cd ~/repos/notes/diy/ && nvim .'
alias dig='nvim ~/repos/notes/planning/3.digital-standup.md'
alias todo='nvim ~/repos/notes/planning/1.today-todo.md'
alias planning='nvim ~/repos/notes/planning/'
alias dig='nvim ~/repos/notes/planning/2.digital-standup.md'
alias wr='cd ~/repos/wr/'
alias v1='cd ~/repos/vite1-scratch/ && lsa'
alias v2='cd ~/repos/vite2-scratch/ && lsa'
alias js1='cd ~/repos/js1-scratch/ && lsa'

# folders
alias eliz='cd ~/elizhelp && lsa'
alias config='cd ~/.config && lsa'
alias nvimfolder='cd ~/.config/nvim/ && tree'
alias snippets='cd ~/.config/nvim/snippets/snippets/javascript-ecosystem/ && nvim .'
alias documents='cd ~/Documents && lsa'
alias scripts='cd ~/bin && lsa'
alias photos='cd ~/Pictures/Photos && lsa'

# areas
alias desktop='cd ~/Desktop && lsa'
alias downloads='cd ~/Downloads && tree -L 2'
alias trash='cd ~/.local/share/Trash/files/'

# Current Workplace
alias comic='cd ~/comic-relief && lsa'
alias cr='cd ~/comic-relief/comicrelief-contentful/ && lsa'
alias cl='cd ~/comic-relief/component-library/ && lsa'
alias storybook='cd ~/comic-relief/storybook/ && lsa'
alias yst='yarn styleguide'
alias donate='cd ~/comic-relief/react-donation/ && lsa'
alias tickets='cd ~/repos/tickets/ && lsa'
alias trashgql='trash-put ./graphql/schema.gql'

# git ================================
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias gpempty='git commit --allow-empty -m "Empty commit to trigger build" && git push'

function gpo() {
  git pull origin "$1" && yarn
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


# bun completions
[ -s "/Users/mike4031/.bun/_bun" ] && source "/Users/mike4031/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
