source ~/.profile
source ~/.aliases

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LC_CTYPE=en_US.UTF-8

# Export Paths
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin/git:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/opt/subversion/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
export PYTHONPATH="/usr/local/lib/python2.7"

# Git Aware Prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

# Terminal input template
export PS1="\[\033[$txtred\u \[$txtrst\]in \[\033[$txtgrn\W \[$txtrst\]\$git_branch\$git_dirty\[$txtrst\]$ "
