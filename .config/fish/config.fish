# === Alias === #
alias vi=nvim
alias vim=nvim
alias ls="eza --icons"
alias tree="eza --icons --tree"
alias gs="git status"
alias ga="git add"
alias gcm="git commit -m"
alias x=exit
alias ...="cd ../.."
alias ....="cd ../../.."

set -gx EDITOR nvim
# set BAT_CONFIG_PATH "/home/Arawan/.config/bat/config"
set fzf_fd_opts --hidden --max-depth 5 \
    --follow --exclude .cache --exclude .npm \
    --exclude .git --exclude .wget --exclude .local \
    --exclude .cargo --exclude .mozilla --exclude .nv \
    --exclude .config/google-chrome --exclude .config/chromium \
    --exclude .gnupg --exclude .config/Postman

# fzf neofusion color
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#031B26,bg:#06101e,spinner:#fd5e3a,hl:#e2d9c5 \
--color=fg:#08435E,header:#e2d9c5,info:#35b5ff,pointer:#fa7a61 \
--color=marker:#fd5e3a,fg+:#66def9,prompt:#35b5ff,hl+:#fd5e3a"

# change default color
# set -U fish_color_command '#5db2f8'

set -Ux VAULT_PATH "/home/Arawan/Documents/Obsidian Vault/"

# === Zoxide === #
zoxide init fish | source

# === Prompt === #
starship init fish | source


# Create new note
function note
  cd "$VAULT_PATH"

  if test (count $argv) -eq 1
    set note_group "$VAULT_PATH/note"
    set note_path "$note_group/$argv[1].md"
    nvim $note_path

  else if test (count $argv) -eq 2
    set note_group "$VAULT_PATH/$argv[1]"

    if not test -d $note_group
      mkdir -p $note_group
    end

    set note_path "$note_group/$argv[2].md"

    if test -f $note_path
        nvim $note_path
    else
      echo "---
tags: $argv[1]
---
">$note_path
      nvim $note_path
    end

  else
    echo "usage: note {filename} or note {group or directories} {filename}"
  end
end
