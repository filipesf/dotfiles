# ------------------------------------------------------------------------------
# Core helpers (shared across all projects)
# ------------------------------------------------------------------------------

# Explicit confirmation for destructive actions
# Ask user for confirmation before running a command
#
# Example:
#   confirm "Are you sure?"#   if [[ "$?" == "y" ]]; then
#     # run command
#   fi
#
confirm() {
  read -r "?⚠️  $1 [y/N] " response
  [[ "$response" =~ ^[Yy]$ ]]
}

# Attach to tmux session if it exists, otherwise run starter command
#
# Example:
#   tmux_attach_or_run my_session "make"
#
tmux_attach_or_run() {
  local session="$1"
  shift

  # Check if the tmux session exists
  if tmux has-session -t "$session" 2>/dev/null; then
    # Attach to the existing tmux session
    tmux attach -t "$session"
  else
    # Run the starter command if the session does not exist
    "$@"
  fi
}
