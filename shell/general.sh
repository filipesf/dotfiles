# ─────────────────────────────────────────────
# General shell aliases
# ─────────────────────────────────────────────

alias ll="ls -lhG"
alias python="python3"

# Remove all .DS_Store files (⚠️ destructive)
dsclean() {
  if confirm "Remove ALL .DS_Store files from the system? (sudo required)"; then
    sudo find / -name '.DS_Store' -depth -exec rm {} \;
  else
    echo "Aborted."
  fi
}

# Dotfiles
alias dot="cd ~/Code/dotfiles"

# Check the status of all repos in the current directory
check_repos() {
  find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;
}

# Get current working git branch
git_branch() {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ \1/"
}
