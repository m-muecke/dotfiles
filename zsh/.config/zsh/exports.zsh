export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR="vim"
else
	export EDITOR="nvim"
fi
