# Export ZSH folder
export ZSH=~/.oh-my-zsh
# Load ZSH
source $ZSH/oh-my-zsh.sh
# Load prompt settings
source ~/.prompt

# Set Vim as default editor
export EDITOR=vim

# Aliases
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias sassw="sass --watch --sourcemap=none --no-cache"
alias sassu="sass --update --sourcemap=none --no-cache"

# Run a server on the current directory
server() {
  open "http://localhost:${1}" && python -m SimpleHTTPServer $1
}
