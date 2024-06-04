# if status is-interactive
    # Commands to run in interactive sessions can go here
# end
alias vi=nvim
alias vim=nvim
alias ls="eza --icons"
alias tree="eza --icons --tree"

set -gx EDITOR nvim
# set BAT_CONFIG_PATH "/home/Arawan/.config/bat/config"
set fzf_fd_opts --hidden --max-depth 5
starship init fish | source
