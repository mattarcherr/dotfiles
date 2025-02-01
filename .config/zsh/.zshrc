# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9
# ----- environment variables -----
autoload -U colors && colors

# terminal history
HISTSIZE=99999999
SAVEHIST=99999999
HISTFILE="${XDG_CASHE_HOME:-$HOME/.cache}/zsh/zsh_history"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# ----- options -----
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist
eval "$(fzf --zsh)" # fzf intergration for reverse-search (crtl-r)
compinit
_comp_options+=(globdots)

# Keybinds
bindkey -e # keep default keybinds
bindkey "\e[1;5A" history-search-backward
bindkey "\e[1;5B" history-search-forward

# Aliases
alias vim="nvim"
alias v="nvim"
alias p="sudo pacman"
alias SS="sudo systemctl"
alias ls="ls -ogh --color"
alias r="y"
#alias r="lfcd"
#alias lf="lfcd"
## git
alias gcl="git clone --recursive"
alias gs="git status"
alias ga="git add"
alias gco="git commit -m"

alias shut="sudo shutdown now"
alias xbl="xbacklight"
alias hss="hugo server --noHTTPCache --disableFastRender --bind 192.168.6.220 --baseURL http://192.168.6.220 --port 1313"

# ------ commands -------

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#lfcd () {
#    tmp="$(mktemp)"
#    # `command` is needed in case `lfcd` is aliased to `lf`
#    command lf -last-dir-path="$tmp" "$@"
#    if [ -f "$tmp" ]; then
#        dir="$(cat "$tmp")"
#        rm -f "$tmp"
#        if [ -d "$dir" ]; then
#            if [ "$dir" != "$(pwd)" ]; then
#                cd "$dir"
#            fi
#        fi
#    fi
#}

# ----- plugins -----
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme # Prompt

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
