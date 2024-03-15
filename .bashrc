[[ $- != *i* ]] && return

# FIXME: uncomment only if in WSL
# export BROWSER=wslview
# alias explorer="/mnt/c/Windows/explorer.exe"

export EDITOR=nvim
# remove background color from ls
LS_COLORS=$LS_COLORS:'tw=00;33:ow=01;33:'
export LS_COLORS

eval "$(starship init bash)"
eval "$(zoxide init bash)"

alias ..="cd .."
alias ....="cd ../.."
alias cd="z"
alias ls="ls --color=auto"
alias nswitch="sudo nix-rebuild switch --flake /etc/nixos"

export PAGER="less -R"
export LESS="--RAW-CONTROL-CHARS"
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

function cheat() {
  curl cheat.sh/$@ | less
}

function ll() {
  ls --color=always -al $@ | awk '{print $9}'
}

# pnpm
export PNPM_HOME="/home/mrcapivaro/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
