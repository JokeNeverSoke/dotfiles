

echo
print -P "%F{magenta}======= Begin ZSH Initialization =======%f"
echo


llog () {
  print -P "%F{red}$(gdate +%M:%S.%3N) %f- %F{blue}$*%f"
}

llog \'llog\' func setup

# show tmux status
llog tmux status: $TMUX

llog add environmental variables
source ~/.config/zsh/.env

llog add secret variables
source ~/.config/zsh/.secrets

llog configuring p10k
source ~/.config/zsh/.p10k.zsh

# load plugins
llog loading plugins...
source ~/.config/zsh/.pluginrc

# Hook for desk activation
# [ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

llog add custom aliases
# load self-defined aliases
source ~/.config/zsh/.aliasrc

llog adding custom PATHS
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$HOME/bin:$HOME/.bin:$PATH"
export PATH="$PATH:/Users/zengjoseph/.local/bin"

llog hooking direnv
eval "$(direnv hook zsh)"

bindkey "^H" vi-backward-delete-char
bindkey "^Q" vi-quoted-insert
bindkey "^U" vi-kill-line
bindkey "^V" vi-quoted-insert
bindkey "^W" vi-backward-kill-word
bindkey "^[" vi-cmd-mode
bindkey "^[OC" vi-forward-char
bindkey "^[OD" vi-backward-char
bindkey "^[[C" vi-forward-char
bindkey "^[[D" vi-backward-char
bindkey "^?" vi-backward-delete-char

llog calling compinit
autoload -Uz compinit && compinit


llog done\!

