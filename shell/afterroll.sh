# ------------------------------------------------------------------------------
# Afterroll
# ------------------------------------------------------------------------------

AFTEROLL_DIR="${AFTEROLL_DIR:-$VISERYA_DIR/afterroll}"

# ------------------------------------------------------------------------------
# Shortcuts
# ------------------------------------------------------------------------------

# Change directory to Afterroll project root
alias ar="cd $AFTERROLL_DIR"

# Change directory to Afterroll project root, install dependencies and build the project
alias arb="ar; npm install; npm run build"

# Change directory to Afterroll project root, start the database and run the development server
alias ard="ar; npm run db:start; npm run dev"

# Change directory to Afterroll project root, stop the database and start it again
alias ardb="ar; npm run db:stop; npm run db:start"

# Change directory to Afterroll project root, reset the database, start it and run the migrations
alias ardbm="ar; npm run db:reset; npm run db:start; npm run db:migrate"

# Change directory to Afterroll project root and open the project in Codex
alias arx="ar; codex --add-dir ./thoughts"

# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

# Start / attach Afterroll tmux session
# Start a new tmux session for Afterroll, or attach to an existing one
aron() {
  tmux_attach_or_run "Afterroll" _afterroll_start
}

# Attach to Afterroll tmux session
# Attach to an existing tmux session for Afterroll
aratt() {
  aron
}

# Start tmux session for Afterroll
_afterroll_start() {
  local session="Afterroll"

  tmux new-session -d -s "$session" -n "Dev"
  tmux send-keys -t "$session:Dev" "cd $AFTERROLL_DIR" C-m
  tmux send-keys -t "$session:Dev" "npm install" C-m
  tmux send-keys -t "$session:Dev" "npm run build" C-m
  tmux send-keys -t "$session:Dev" "npm run db:start" C-m
  tmux send-keys -t "$session:Dev" "npm run dev" C-m

  tmux select-window -t "$session:Codex"
  tmux attach -t "$session"
}

# Kill tmux session for Afterroll
# Kill the tmux session for Afterroll
aroff() {
  if confirm "Kill tmux session: Afterroll?"; then
    (cd "$AFTERROLL_DIR" && npm run db:stop)
    tmux kill-session -t Afterroll 2>/dev/null
  else
    echo "Aborted."
  fi
}

# Reset tmux session for Afterroll
# Kill the tmux session for Afterroll and start a new one
arreset() {
  aroff && sleep 1 && aron
}
