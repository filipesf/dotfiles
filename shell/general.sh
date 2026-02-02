# ─────────────────────────────────────────────
# General shell aliases
# ─────────────────────────────────────────────

# List all files and directories in a human-readable format
alias ll="ls -lhG"

# Use Python 3 by default
alias python="python3"

# Remove all .DS_Store files (⚠️ destructive)
# Usage: dsclean
# Description: Remove all .DS_Store files from the system. This command is destructive and will remove all .DS_Store files without prompting for confirmation. Use with caution.
dsclean() {
  if confirm "Remove ALL .DS_Store files from the system? (sudo required)"; then
    sudo find / -name '.DS_Store' -depth -exec rm {} \;
  else
    echo "Aborted."
  fi
}

# Dotfiles
# Usage: dot
# Description: Change into the dotfiles directory.
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Code/dotfiles}"
alias dot="cd $DOTFILES_DIR"

# Check the status of all repos in the current directory
# Usage: check_repos
# Description: Check the status of all repositories in the current directory. This command will print the status of each repository.
check_repos() {
  find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;
}

# Get current working git branch
# Usage: git_branch
# Description: Get the current working git branch.
git_branch() {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ \1/"
}
