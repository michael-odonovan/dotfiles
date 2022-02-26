
# This little script pulls all the stuff in from .bashrc file:
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi


# This is about bash completion, bash autocomplete, example git tab tab:
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


##
# Your previous /Users/mike/.bash_profile file was backed up as /Users/mike/.bash_profile.macports-saved_2021-02-26_at_18:04:06
##

# MacPorts Installer addition on 2021-02-26_at_18:04:06: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

. "$HOME/.cargo/env"
