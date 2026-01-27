# ─────────────────────────────────────────────
# Clickmax
# ─────────────────────────────────────────────

CLICKMAX_DIR="${CLICKMAX_DIR:-$HOME/Code/clickmax/monorepo}"

alias cmax="cd $CLICKMAX_DIR"

alias cmaxb="cmax; pnpm install; pnpm build; pnpm denv pull"
alias cmaxw="cmax; pnpm dep-down; pnpm dep-up; pnpm dev-web"

# Start / attach Clickmax tmux session
cmaxon() {
  tmux_attach_or_run "Clickmax" _clickmax_start
}

cmaxatt() {
  cmaxon
}

_clickmax_start() {
  local session="Clickmax"

  tmux new-session -d -s "$session" -n "Web"
  tmux send-keys -t "$session:Web" "cd $CLICKMAX_DIR" C-m
  tmux send-keys -t "$session:Web" "pnpm dep-down" C-m
  tmux send-keys -t "$session:Web" "pnpm dep-up" C-m
  tmux send-keys -t "$session:Web" "pnpm dev-web" C-m

  tmux new-window -t "$session" -n "Build"
  tmux send-keys -t "$session:Build" "cd $CLICKMAX_DIR" C-m

  tmux new-window -t "$session" -n "Shell"
  tmux send-keys -t "$session:Shell" "cd $CLICKMAX_DIR" C-m

  tmux select-window -t "$session:Web"
  tmux attach -t "$session"
}

cmaxoff() {
  if confirm "Kill tmux session: Clickmax?"; then
    tmux kill-session -t Clickmax 2>/dev/null
  else
    echo "Aborted."
  fi
}

cmaxreset() {
  cmaxoff && sleep 1 && cmaxon
}
