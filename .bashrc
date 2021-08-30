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

# Folder Colors when using $ ls
# -F is the trailing "/", -G is the folder name colors
# alias ls='ls -F'

# Remove Background Colors or writable folders:
# followed this guide here:
# https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
export CLICOLOR=1

# goes foreground/background ie. ex is one type.
export LSCOLORS=exxxxxxxxxxxxxxxxxexex


# This sets up the source for my bash scripts:
export PATH=$PATH:~/bin

# This was to solve an error I was getting in terminal:
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Python Stuff, using pyenv https://opensource.com/article/19/5/python-3-default-mac
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Using vim functionality in Bash
set -o vi

# Auto starting tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
 exec tmux
fi

# ========== Aliases ===========
alias Project='cd ~/Js-projects/pomodoros/react-pomodoro-timer/src && ls -a'

alias session='vim -S Session.vim'
alias ..='cd ..'

# Custom Bits
# show largest 20 files in a folder:
alias LargeFiles='ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n20'

# Open Files
alias Init='cd ~/.config/nvim/ && vim init.vim'
alias Bashrc='cd && vim .bashrc'

# Go To Folders
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
alias Testing='cd ~/Coding/testing && ls -a'
alias Nvimvim='cd ~/.config/nvim/ && ls -a'
alias Cronjobs='cd ~/myscripts && ls -a'
alias Scripts='cd ~/bin && ls -a'
alias Js='cd ~/Js-projects && ls -a'
alias Jsnotes='cd ~/Coding-notes/js-learning/ && ls -a'
alias Sites='cd ~/Sites && ls -a'
alias Writing='cd ~/Documents/notes-writing && ls -a'
alias Pictures='cd ~/Pictures && ls -a'
alias eBooks='cd ~/Documents/eBooks && ls -a'
alias Dotfiles='cd ~/Dotfiles && ls -a'

# Areas
alias Desk='cd ~/desktop && ls -a'
alias Downloads='cd ~/downloads && ls -a'

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
	git add .
	git commit -m "update"
	git push
}

# Add all, commit and push (to origin) all at once
# $ gacp "commit message"
function gacp() {
	git add .
	git commit -m "$1"
	git push origin
}

dotbosh() {
	collect-dotfiles.sh
	Dotfiles
	bosh
}

totalbosh() {
	echo 'dotbosh ============================================'
	dotbosh
	echo 'dotbosh done --------------------------------------'
	sleep 2
	echo $'\n'

	echo 'Coding-notes ============================================'
	Cn
	bosh
	echo 'Coding-notes done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'Pictures ============================================'
	Pictures
	bosh
	echo 'Pictures done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'eBooks ============================================'
	eBooks
	bosh
	echo 'eBooks ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'notes-writing ============================================'
	Writing
	bosh
	echo 'notes-writing done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'notes-general ============================================'
	Notes
	bosh
	echo 'notes-general ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'Coding ============================================'
	Coding
	bosh
	echo 'Coding done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'Sites ============================================'
	Sites
	bosh
	echo 'Sites done ----------------------------------------'
	sleep 2
	echo $'\n'

	echo 'Scripts ============================================'
	Scripts
	bosh
	echo 'Scripts done ----------------------------------------'
	sleep 2
	echo $'\n'

	cd ~/
}

