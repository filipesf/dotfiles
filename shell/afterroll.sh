# ─────────────────────────────────────────────
# Afterroll
# ─────────────────────────────────────────────

AFTERROLL_DIR="${AFTERROLL_DIR:-$VISERYA_DIR/afterroll}"

alias ar="cd $AFTERROLL_DIR"

alias arb="ar; npm install; npm run build"
alias ard="ar; npm run db:start; npm run dev"
alias ardb="ar; npm run db:stop; npm run db:start"
alias ardbm="ar; npm run db:reset; npm run db:start; npm run db:migrate"

# Start / attach Afterroll tmux session
aron() {
  tmux_attach_or_run "Afterroll" _afterroll_start
}

aratt() {
  aron
}

_afterroll_start() {
  local session="Afterroll"

  tmux new-session -d -s "$session" -n "Dev"
  tmux send-keys -t "$session:Dev" "cd $AFTERROLL_DIR" C-m
  tmux send-keys -t "$session:Dev" "npm run db:start" C-m
  tmux send-keys -t "$session:Dev" "npm run dev" C-m

  tmux new-window -t "$session" -n "DB"
  tmux send-keys -t "$session:DB" "cd $AFTERROLL_DIR" C-m

  tmux new-window -t "$session" -n "Shell"
  tmux send-keys -t "$session:Shell" "cd $AFTERROLL_DIR" C-m

  tmux select-window -t "$session:Dev"
  tmux attach -t "$session"
}

aroff() {
  if confirm "Kill tmux session: Afterroll?"; then
    tmux kill-session -t Afterroll 2>/dev/null
  else
    echo "Aborted."
  fi
}

arreset() {
  aroff && sleep 1 && aron
}
