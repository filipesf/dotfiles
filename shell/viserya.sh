# ─────────────────────────────────────────────
# Viserya
# ─────────────────────────────────────────────

alias v="cd ~/Code/viserya"
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
  tmux send-keys -t "$session:Foundry" "cd ~/Code/viserya" C-m
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
  tmux send-keys -t "$session:App" "cd ~/Code/viserya" C-m
  tmux send-keys -t "$session:App" "npm run dev" C-m

  tmux new-window -t "$session" -n "Bot"
  tmux send-keys -t "$session:Bot" "cd ~/Code/viserya" C-m
  tmux send-keys -t "$session:Bot" "npm run bot" C-m

  tmux attach -t "$session"
}

# HARD stop (⚠️ destructive)
voff() {
  if confirm "Kill ALL node, next-server and tmux processes?"; then
    pkill -9 node
    pkill -9 next-server
    pkill -9 tmux
  else
    echo "Aborted."
  fi
}

vreset() {
  voff && sleep 1 && von
}

alias vconsole="ssh -i ~/.ssh/do_key root@24.199.90.52"
