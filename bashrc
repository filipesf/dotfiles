# Enable CLI Colours
export CLICOLOR=1

# Set Sublime as default editor
export EDITOR=subl



# Check the status of all repos in the current directory
function check_repos() {
  find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;
}



# Get current working git branch
function git_branch() {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ \(\1\)/"
}

# Set colour variables
RED="\[\033[0;31m\]"
GRN="\[\033[0;32m\]"
YLW="\[\033[0;33m\]"
BLU="\[\033[0;34m\]"
RST="\[\033[0m\]"
ITL="\e[3m\]"

# Set prompt config
# PS1="$GRN\u$RST$ITL in $BLU\w$YLW$ITL\$([[ -n \$(git branch 2> /dev/null) ]] && echo \"$RST$ITL on\")$YLW\$(git_branch)$RST » "
PS1="$BLU\W$YLW$ITL\$([[ -n \$(git branch 2> /dev/null) ]] && echo \"\")$YLW\$(git_branch)$RST » "


# Sass Watch and Update Shorthand
alias sassw="sass --watch --sourcemap=none --no-cache"
alias sassu="sass --update --sourcemap=none --no-cache"
# Readable Files List
alias ll="ls -lhG"
# Find IDs
alias ackid="ack --css -i '#[-_a-z][-_a-z0-9]*(?=[^}]*\{)'"
# Background Shorthand
alias ackbg="ack --css -i 'background:\s*#[a-f0-9]*;'"
# Find Unitted Zeroes
alias ackzr="ack --css '\b0(px|r?em)'"
# Find Decimal Pixel Values
alias ackdc="ack --css '\d*\.\d*px'"



# Dotfiles dit
alias dot="cd ~/Code/.dotfiles"
# Choco la Design dir
alias cld="cd ~/Code/chocoladesign"
# BetBright dir
alias bb="cd ~/Code/betbright"
alias bbui="cd ~/Code/betbright/bb-design"
alias bbvag="cd ~/Code/betbright/.neft/vagrant3"
alias bbweb="cd ~/Code/betbright/sportsbook_web"
alias bbadm="cd ~/Code/betbright/sportsbook_admin"



# Git Flow Aliases
# Init
gfi() { git flow init $1; }
# Feature
gcf()  { git checkout feature/$1; }
gffs() { git flow feature start $1; }
gfff() { git flow feature finish -F $(git_flow_current_branch); }
# Hotfix
gch()  { git checkout hotfix/$1; }
gfhs() { git flow hotfix start $1; }
gfhf() { git fetch --tags; git pull origin master; git flow hotfix finish -F $(git_flow_current_branch); }
# Release
gcr()  { git checkout release/$1;  }
gfrs() { git flow release start $1; }
gfrf() { git flow release finish -F $(git_flow_current_branch); }
# Get current branch
git_flow_current_branch(){ git rev-parse --abbrev-ref HEAD | cut -d'/' -f 2; }



# Youtube Downloader
alias yt='youtube-dl -f mp4'



# Run a server on the current directory
server() {
  open "http://localhost:${1}" && python -m SimpleHTTPServer $1
}
