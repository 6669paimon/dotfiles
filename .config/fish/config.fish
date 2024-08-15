# if status is-interactive
    # Commands to run in interactive sessions can go here
# end
alias v=nvim
alias vi=nvim
alias vim=nvim
alias ls="eza --icons"
alias tree="eza --icons --tree"
alias gs="git status"
alias ga="git add"
alias gm="git commit -m"

set -gx EDITOR nvim
# set BAT_CONFIG_PATH "/home/Arawan/.config/bat/config"
set fzf_fd_opts --hidden --max-depth 5 \
    --follow --exclude .cache --exclude .npm \
    --exclude .git --exclude .wget --exclude .local \
    --exclude .cargo --exclude .mozilla --exclude .nv \
    --exclude .config/google-chrome --exclude .config/chromium \
    --exclude .gnupg --exclude .config/Postman

# neofusion color
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#031B26,bg:#06101e,spinner:#fd5e3a,hl:#e2d9c5 \
--color=fg:#08435E,header:#e2d9c5,info:#35b5ff,pointer:#fa7a61 \
--color=marker:#fd5e3a,fg+:#66def9,prompt:#35b5ff,hl+:#fd5e3a"


# change default color
# set -U fish_color_command '#5db2f8'

# if status --is-interactive
#     and not set -q TMUX
#     and set -q FISH_ALACRITTY
#     and test "$FISH_ALACRITTY" = "1"
#     tmux attach-session -t default || tmux new-session -s default
# end

zoxide init fish | source
starship init fish | source
