# ─────────────────────────────────────────────
# Core helpers (shared across all projects)
# ─────────────────────────────────────────────

# Explicit confirmation for destructive actions
confirm() {
  read -r "?⚠️  $1 [y/N] " response
  [[ "$response" =~ ^[Yy]$ ]]
}

# Attach to tmux session if it exists, otherwise run starter command
tmux_attach_or_run() {
  local session="$1"
  shift

  if tmux has-session -t "$session" 2>/dev/null; then
    tmux attach -t "$session"
  else
    "$@"
  fi
}
