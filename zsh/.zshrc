HISTFILE=~/.cache/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob interactive_comments
unsetopt beep
bindkey -v
export KEYTIMEOUT=1
zstyle :compinstall filename '/home/devboy/.config/zsh/.zshrc'

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# ============= ENV_VARS =======================
export POWERLEVEL9K_INSTANT_PROMPT=quiet

NPM_PACKAGES="${HOME}/.npm-packages"

path+=("$NPM_PACKAGES/bin")
path+=("$HOME/go/bin")
path+=("$HOME/.cabal/bin")
path+=("$HOME/.ghcup/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.config/emacs/bin")
path+=("$HOME/.config/composer/vendor/bin")

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

stty stop undef		# Disable ctrl-s to freeze terminal.

MY_SITE_DIR="$HOME/Documents/code/my-static-site"
GTK_THEME="Ultimate-Maia-Blue"
EDITOR=nvim
# ================ ALIASES =============================
alias zc="$EDITOR $ZDOTDIR/.zshrc"
alias emacs="emacsclient -c -a 'emacs'"
alias sc="source $HOME/.zshrc"
alias site="cd $MY_SITE_DIR && tmux new-session nvim"
alias swayc="nvim $XDG_CONFIG_HOME/sway/config"
alias termc="nvim $XDG_CONFIG_HOME/alacritty/alacritty.yml"
alias w-vpn="sudo openvpn $HOME/Documents/koshelek_work/configs/koshelek-user-20.conf"

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

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

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^f' autosuggest-accept # ctrl-f

eval "$(zoxide init zsh)"

ZSH_THEME="robbyrussell"

plugins=(git)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

# use it always in the end
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

