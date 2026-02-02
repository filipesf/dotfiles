# ─────────────────────────────────────────────────────
# Viserya
# ─────────────────────────────────────────────────────

# Directory where Viserya is located
: ${VISERYA_DIR:-$HOME/Code/viserya}
VISERYA_DIR="${VISERYA_DIR:-$HOME/Code/viserya}"

# SSH key to use for connecting to the Viserya console
: ${VISERYA_SSH_KEY:-$HOME/.ssh/do_key}
VISERYA_SSH_KEY="${VISERYA_SSH_KEY:-$HOME/.ssh/do_key}"

# Aliases for quick navigation
alias v="cd $VISERYA_DIR"
alias vapp="v; cd viserya-app"
alias vbot="v; cd viserya-bot"

# Attach or create main Viserya tmux session
# @description Attach to the main Viserya tmux session or create it if it does not exist.
# @example voryn
voryn() {
  tmux_attach_or_run "Viserya" tmux new -s Viserya
}

# Start / attach Viserya VTT (Foundry + ngrok)
# @description Start the Viserya VTT (Foundry + ngrok) tmux session or attach to it if it already exists.
# @example vtt
vtt() {
  tmux_attach_or_run "Viserya" _viserya_vtt_start
}

# Start the Viserya VTT (Foundry + ngrok) tmux session
# @description Start the Viserya VTT (Foundry + ngrok) tmux session.
# @note This function is called by vtt.
_viserya_vtt_start() {
  local session="Viserya"

  tmux new-session -d -s "$session" -n "Foundry"
  tmux send-keys -t "$session:Foundry" "cd $VISERYA_DIR" C-m
  tmux send-keys -t "$session:Foundry" "ngrok http http://localhost:36111/" C-m

  tmux attach -t "$session"
}

# Start full Viserya stack
# @description Start the full Viserya stack (Backend + Bot).
# @example von
von() {
  tmux_attach_or_run "Viserya" _viserya_start
}

# Start the full Viserya stack
# @description Start the full Viserya stack (Backend + Bot).
# @note This function is called by von.
vatt() {
  von
}

# Start the full Viserya stack
# @description Start the full Viserya stack (Backend + Bot).
# @note This function is called by _viserya_run.
_viserya_start() {
  local session="Viserya"

  tmux new-session -d -s "$session" -n "Backend"
  tmux send-keys -t "$session:Backend" "vapp" C-m
  # tmux send-keys -t "$session:Backend" "yarn install" C-m
  # tmux send-keys -t "$session:Backend" "yarn build" C-m
  tmux send-keys -t "$session:Backend" "yarn dev" C-m

  tmux new-window -t "$session" -n "Bot"
  tmux send-keys -t "$session:Bot" "vbot" C-m
  # tmux send-keys -t "$session:Bot" "yarn install" C-m
  # tmux send-keys -t "$session:Bot" "yarn build" C-m
  tmux send-keys -t "$session:Bot" "yarn dev" C-m

  tmux attach -t "$session"
}

# HARD stop (destructive)
# @description Kill the Viserya tmux session.
# @example voff
voff() {
  if confirm "Kill tmux session: Viserya?"; then
    tmux kill-session -t Viserya 2>/dev/null
  else
    echo "Aborted."
  fi
}

# Reset the Viserya stack
# @description Kill the Viserya tmux session and start it again.
# @example vreset
vreset() {
  voff && sleep 1 && von
}

if [ -n "${VISERYA_CONSOLE_HOST-}" ]; then
  # Alias for quick access to the Viserya console
  # @description Connect to the Viserya console using SSH.
  # @example vconsole
  alias vconsole="ssh -i $VISERYA_SSH_KEY root@$VISERYA_CONSOLE_HOST"
fi
