# Load utility functions
source ~/.aliases
source ~/.utils

# Paths configuration
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# Enable CLI Colours
export CLICOLOR=1

# Set Vim as default editor
export EDITOR=vim

# Set colour variables
RED="\[\033[0;31m\]"
GRN="\[\033[0;32m\]"
YLW="\[\033[0;33m\]"
BLU="\[\033[0;34m\]"
RST="\[\033[0m\]"
ITL="\e[3m\]"

# Set prompt config
PS1="$GRN\u$RST$ITL in $BLU\W$YLW$ITL\$([[ -n \$(git branch 2> /dev/null) ]] && echo \"$RST$ITL on\")$YLW\$(git_branch)$RST\n» "
