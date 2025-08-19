## Paths ===========================
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# This sets up the source for my bash scripts:
export PATH=$PATH:~/bin:~/.local/bin

# Path to yarn
PATH=$PATH:~/.yarn/bin

# Homebrew to path
export PATH=/opt/homebrew/bin:$PATH

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

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
# alias root='cd `git rev-parse --show-toplevel`'
alias root='cd $(git rev-parse --show-toplevel)'

alias kill3000='kill -9 $(lsof -ti:3000)'
alias kill8000='kill -9 $(lsof -ti:8000)'

alias yabaistart='yabai --start-service'
alias yabairestart='yabai --restart-service'
alias yabaistop='yabai --stop-service'
alias yabairc='nvim ~/.yabairc'
alias skhdstart='skhd --start-service'
alias skhdrestart='skhd --restart-service'
alias skhdstop='skhd --stop-service'
alias skhdrc='nvim ~/.skhdrc'

alias yarnlong='yarn install --verbose --network-timeout 1000000'
alias trashnvim='rm -rf ~/.local/share/nvim/ && rm -rf ~/.config/nvim'
alias tp='trash-put'
alias snaps='yarn jest -u'
alias lsa='ls -a -1'
# cypress errors
alias cyp='yarn cy:run &> ~/Desktop/cl-cy-errors.md | tee'
alias lintfix='yarn eslint src --fix'

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

# for upgrading packages
function yu() {
  yarn upgrade $1@latest
}

# run playwright tests locally
alias playwrightlocal="npx playwright test"
alias playlocal="npx playwright test"

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
alias scratch2='nvim ~/desktop/scratch2.md'
### vscode
alias settings='cd ~/Library/Application\ Support/Code/User/ && nvim settings.json'
alias keybindings='cd ~/Library/Application\ Support/Code/User/ && nvim keybindings.json'
alias new-install='nvim ~/repos/notes/code/new-install.md'

# repos
alias repos='cd ~/repos && lsa'
alias dotfiles='cd ~/repos/dotfiles && nvim .'
alias gitpractise='cd ~/repos/gitpractise && nvim .'
alias cv='cd ~/repos/cv && nvim michael-odonovan-CV.md'
alias writing='cd ~/repos/writing/aboriginal-tracker-ned-kelly-detective/ && nvim .'
alias printing3d='cd ~/repos/printing3d && lsa'
alias myl='cd ~/repos/my-learning-site/ && lsa'
alias mike='cd ~/repos/michaelodonovan.net/ && tree -L 2'
alias notes='cd ~/repos/notes/ && lsa'
alias car='cd ~/repos/notes/car/ && lsa'
alias storage='cd ~/repos/storage/ && nvim .'
alias music='cd ~/repos/notes/music/ && nvim .'
alias diy='cd ~/Desktop/diy-notes-photos/ && nvim .'
alias todo='nvim ~/repos/notes/planning/1.today-todo.md'
alias planning='nvim ~/repos/notes/planning/'
alias dig='nvim ~/repos/notes/planning/3.digital-standup.md'
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
alias Desktop='cd ~/Desktop && lsa'
alias downloads='cd ~/Downloads && tree -L 2'
alias trash='cd ~/.local/share/Trash/files/'

# Current Workplace
alias comic='cd ~/comic-relief && lsa'
alias cr='cd ~/comic-relief/comicrelief-contentful/ && lsa'
alias cl='cd ~/comic-relief/component-library/ && lsa'
alias storybook='cd ~/comic-relief/storybook/ && lsa'
alias yst='yarn styleguide'
alias donate='cd ~/comic-relief/react-donation/ && lsa'

alias tickets='nvim ~/Desktop/tickets.md'

alias trashgql='trash-put ./graphql/schema.gql'
alias gatsbyclean='yarn rebuild-schema-dev'

function resizeImages() {
  mogrify -resize 600x600\> *.png
  mogrify -resize 600x600\> *.jpg
}

# git ================================
# git stuff
alias branch='git branch --show-current | pbcopy'
alias clearbranches='git branch | grep -v "master" | xargs git branch -D'
alias lg='Lazygit'
alias gitclear='cd .git && tp index.lock'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpempty='git commit --allow-empty -m "Empty commit to trigger build" && git push'

function gpo() {
  git pull --no-edit origin "$1" && yarn
  git add -A
  git commit -m "merge main/master"
  git push
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


function sc() {
  yarn add -D babel-plugin-styled-components &&
  echo '{"plugins": [["babel-plugin-styled-components", { "displayName": true }]]}' > .babelrc &&
  echo "Babel styled-components plugin installed"
}


# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ydmax='export NODE_OPTIONS=--max_old_space_size=8192; yarn dev'

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

# Playwright test runner function for zsh config
# Usage: playwright_run [test_file]
# Add this to your .zshrc file
playwright_run() {
  local test_file="$1"
  local base_dir="$(pwd)"
  local playwright_config="playwright.config.js"
  local playwright_ts_config="playwright.config.ts"
  local config_file=""

  # Check for existence of config files
  if [[ -f "$base_dir/$playwright_config" ]]; then
    config_file="$playwright_config"
  elif [[ -f "$base_dir/$playwright_ts_config" ]]; then
    config_file="$playwright_ts_config"
  fi

  # Check if playwright is installed
  if ! npm list --depth=0 | grep -q "playwright"; then
    if ! npm list -g --depth=0 | grep -q "playwright"; then
      echo "Error: Playwright not found. Please install it locally or globally."
      return 1
    fi
  fi

  # Determine version to handle compatibility
  local playwright_version=""
  if [[ -f "$base_dir/node_modules/playwright/package.json" ]]; then
    playwright_version=$(cat "$base_dir/node_modules/playwright/package.json" | grep \"version\" | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | tr -d ' ')
  elif [[ -f "$base_dir/node_modules/@playwright/test/package.json" ]]; then
    playwright_version=$(cat "$base_dir/node_modules/@playwright/test/package.json" | grep \"version\" | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | tr -d ' ')
  fi

  echo "Using Playwright version: $playwright_version"

  # Set command based on whether a specific test was requested
  local command=""
  if [[ -n "$test_file" ]]; then
    echo "Running specific test: $test_file"
    command="npx playwright test $test_file"
  else
    echo "Running all tests"
    command="npx playwright test"
  fi

  # Check if we need to explicitly specify a config file
  if [[ -n "$config_file" ]]; then
    command="$command --config=$config_file"
  fi

  # Add compatibility flags based on version if needed
  if [[ -n "$playwright_version" ]]; then
    # Compare versions and add compatibility flags if needed
    # This is a simplified version check - you can expand this for specific version requirements
    major_version=$(echo $playwright_version | cut -d. -f1)
    minor_version=$(echo $playwright_version | cut -d. -f2)

    # Example of version-specific flags
    if [[ $major_version -lt 1 || ($major_version -eq 1 && $minor_version -lt 20) ]]; then
      # Add flags for older versions if needed
      command="$command --reporter=list"
    else
      # Newer version flags
      command="$command --reporter=html"
    fi
  fi

  # Execute the command
  echo "Executing: $command"
  eval $command
  return $?
}

# Optional alias for shorter command
alias ptest='playwright_run'
