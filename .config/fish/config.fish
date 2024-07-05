# if status is-interactive
    # Commands to run in interactive sessions can go here
# end
alias vi=nvim
alias vim=nvim
alias ls="eza --icons"
# alias lt="eza --icons --tree"

set -gx EDITOR nvim
# set BAT_CONFIG_PATH "/home/Arawan/.config/bat/config"
set fzf_fd_opts --hidden --max-depth 5 \
    --follow --exclude .cache --exclude .npm \
    --exclude .git --exclude .wget --exclude .local \
    --exclude .cargo --exclude .mozilla --exclude .nv \
    --exclude .config/google-chrome --exclude .config/chromium \
    --exclude .gnupg --exclude .config/Postman

# if status --is-interactive
#     and not set -q TMUX
#     and set -q FISH_ALACRITTY
#     and test "$FISH_ALACRITTY" = "1"
#     tmux attach-session -t default || tmux new-session -s default
# end

starship init fish | source
