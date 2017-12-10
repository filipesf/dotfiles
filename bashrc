# Enable CLI Colours
export CLICOLOR=1

# Set Sublime as default editor
export EDITOR=subl



# Check the status of all repos in the current directory
function check_repos () {
  find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;
}



# Get current working git branch
function git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# Set colour variables
RED="\[\033[0;31m\]"
GRN="\[\033[0;32m\]"
YLW="\[\033[0;33m\]"
BLU="\[\033[0;34m\]"
RST="\[\033[0m\]"
ITL="\e[3m\]"

# Set prompt config
PS1="$GRN\u $BLU\w$YLW\$(git_branch)$RST » "



# Better Vim
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
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



# Youtube Downloader
alias yt='youtube-dl -f mp4'



# Run a server on the current directory
server() {
  open "http://localhost:${1}" && python -m SimpleHTTPServer $1
}

