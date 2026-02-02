# ----------------------------------------------------------------------------#
# Clickmax
# ----------------------------------------------------------------------------#

CLICKMAX_DIR="${CLICKMAX_DIR:-$HOME/Code/clickmax/monorepo}"

# ----------------------------------------------------------------------------#
# Aliases
# ----------------------------------------------------------------------------#

# Change directory to Clickmax
alias cmax="cd $CLICKMAX_DIR"

# Install dependencies and build Clickmax
alias cmaxb="cmax; pnpm install; pnpm build; pnpm denv pull"

# Start / attach Clickmax tmux session
alias cmaxw="cmax; pnpm dep-down; pnpm dep-up; pnpm dev-web"

# ----------------------------------------------------------------------------#
# Functions
# ----------------------------------------------------------------------------#

# Start / attach Clickmax tmux session
# @description Start or attach Clickmax tmux session
# @example cmaxon
cmaxon() {
  tmux_attach_or_run "Clickmax" _clickmax_start
}

# Start Clickmax tmux session
# @description Start Clickmax tmux session
# @example cmaxatt
cmaxatt() {
  cmaxon
}

# Start Clickmax tmux session
# @description Start Clickmax tmux session and run commands
# @param {string} session - tmux session name
# @param {function} callback - function to run after session is started
_clickmax_start() {
  local session="Clickmax"

  tmux new-session -d -s "$session" -n "Web"
  tmux send-keys -t "$session:Web" "cd $CLICKMAX_DIR" C-m
  tmux send-keys -t "$session:Web" "pnpm dep-down" C-m
  tmux send-keys -t "$session:Web" "pnpm dep-up" C-m
  tmux send-keys -t "$session:Web" "pnpm dev-web" C-m

  tmux new-window -t "$session" -n "Build"
  tmux send-keys -t "$session:Build" "cd $CLICKMAX_DIR" C-m

  tmux select-window -t "$session:Web"
  tmux attach -t "$session"
}

# Kill Clickmax tmux session
# @description Kill Clickmax tmux session
# @example cmaxoff
cmaxoff() {
  if confirm "Kill tmux session: Clickmax?"; then
    (cd "$CLICKMAX_DIR" && pnpm dep-down)
    tmux kill-session -t Clickmax 2>/dev/null
  else
    echo "Aborted."
  fi
}

# Kill and start Clickmax tmux session
# @description Kill and start Clickmax tmux session
# @example cmaxreset
cmaxreset() {
  cmaxoff && sleep 1 && cmaxon
}

