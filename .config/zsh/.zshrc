# Created by newuser for 5.9

# ----- environment variables -----
# prompt
autoload -U colors && colors
PROMPT='[%F{blue}%n@%m%f %B%~%b]$ '

# terminal history
HISTSIZE=99999999
SAVEHIST=99999999
HISTFILE="${XDG_CASHE_HOME:-$HOME/.cache}/zsh/history"

# default libvirt uri path
export LIBVIRT_DEFAULT_URI='qemu:///system'

# ----- options -----
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


# vim keys in menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '?' backward-delete-char

#aliases
alias vim="nvim"
alias p="sudo pacman"
alias SS="sudo systemctl"
alias ls="ls -ogh --color"
alias r="lfcd"
alias spyder="conda run spyder"
alias gc="git clone --recursive"
alias shut="sudo shutdown now"
alias xbl="xbacklight"
alias odm="onedrive --monitor"
alias ods="onedrive --synchronize"
alias hss="hugo server --noHTTPCache --disableFastRender --bind 192.168.6.220 --baseURL http://192.168.6.220 --port 1313"

# ------ commands -------

lfcd () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# ----- plugins -----
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
