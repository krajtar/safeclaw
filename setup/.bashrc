# Load env vars from .env file (written by run.sh)
[ -f /home/sclaw/.env ] && . /home/sclaw/.env

# Auto-cd into cloned repo workdir if set
if [ -n "$SAFECLAW_WORKDIR" ] && [ -d "$SAFECLAW_WORKDIR" ]; then
    cd "$SAFECLAW_WORKDIR"
fi

# Claude Code aliases
alias c='claude'
alias cs='claude --dangerously-skip-permissions'

# Gemini alias
alias g='gemini'

# Claude --fs shortcut
claude() {
  local args=()
  for arg in "$@"; do
    if [[ "$arg" == "--fs" ]]; then
      args+=("--fork-session")
    else
      args+=("$arg")
    fi
  done
  command claude "${args[@]}"
}
