# ─────────────────────────────────────────────
# Viserya
# ─────────────────────────────────────────────

VISERYA_DIR="${VISERYA_DIR:-$HOME/Code/viserya}"
VISERYA_SSH_KEY="${VISERYA_SSH_KEY:-$HOME/.ssh/do_key}"

alias v="cd $VISERYA_DIR"
alias vapp="v; cd viserya-app"
alias vbot="v; cd viserya-bot"

# Attach or create main Viserya tmux session
voryn() {
  tmux_attach_or_run "Viserya" tmux new -s Viserya
}

# Start / attach Viserya VTT (Foundry + ngrok)
vtt() {
  tmux_attach_or_run "ViseryaVTT" _viserya_vtt_start
}

_viserya_vtt_start() {
  local session="ViseryaVTT"

  tmux new-session -d -s "$session" -n "Foundry"
  tmux send-keys -t "$session:Foundry" "cd $VISERYA_DIR" C-m
  tmux send-keys -t "$session:Foundry" "ngrok http http://localhost:36111/" C-m

  tmux attach -t "$session"
}

# Start full Viserya stack
von() {
  _viserya_run
  v
}

_viserya_run() {
  tmux_attach_or_run "Viserya" _viserya_run_start
}

_viserya_run_start() {
  local session="Viserya"

  tmux new-session -d -s "$session" -n "App"
  tmux send-keys -t "$session:App" "cd $VISERYA_DIR" C-m
  tmux send-keys -t "$session:App" "npm run dev" C-m

  tmux new-window -t "$session" -n "Bot"
  tmux send-keys -t "$session:Bot" "cd $VISERYA_DIR" C-m
  tmux send-keys -t "$session:Bot" "npm run bot" C-m

  tmux attach -t "$session"
}

# HARD stop (⚠️ destructive)
voff() {
  if confirm "Kill tmux session: Viserya?"; then
    tmux kill-session -t Viserya 2>/dev/null
  else
    echo "Aborted."
  fi
}

vreset() {
  voff && sleep 1 && von
}

if [ -n "${VISERYA_CONSOLE_HOST-}" ]; then
  alias vconsole="ssh -i $VISERYA_SSH_KEY root@$VISERYA_CONSOLE_HOST"
fi
