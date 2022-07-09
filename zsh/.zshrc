HISTFILE=~/.cache/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob interactive_comments
unsetopt beep
bindkey -e
stty stop undef		# Disable ctrl-s to freeze terminal.

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setxkbmap -option 'ctrl:rctrl_ralt'

# ============= ENV_VARS =======================
export NPM_PACKAGES="${HOME}/.npm-packages"
export KEYTIMEOUT=1
export MOZ_ENABLE_WAYLAND=1

path+=("$NPM_PACKAGES/bin")
path+=("$HOME/go/bin")
path+=("$HOME/.cabal/bin")
path+=("$HOME/.ghcup/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.config/emacs/bin")
path+=("$HOME/.config/composer/vendor/bin")
path+=("$HOME/Documents/scripts")

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export EDITOR=nvim

# ================ ALIASES =============================
alias zc="$EDITOR $XDG_CONFIG_HOME/zsh/.zshrc"
alias emacsc="emacsclient -c -a 'emacs'"
alias nvimc="$EDITOR $XDG_CONFIG_HOME/nvim"

# Use lf to switch directories
f () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

source $XDG_CONFIG_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^f' autosuggest-accept # ctrl-f

# use it always in the end
source $XDG_CONFIG_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


alias luamake=/home/devboy/Programs/lua-language-server/3rd/luamake/luamake
