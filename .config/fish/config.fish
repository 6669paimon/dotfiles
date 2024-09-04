#############
### Alias ###
#############

alias vi=nvim
alias vim=nvim
alias py=python
alias ls="eza --icons"
alias tree="eza --icons --tree"
alias gs="git status"
alias ga="git add"
alias gcm="git commit -m"
alias x=exit
alias ...="cd ../.."
alias ....="cd ../../.."
alias frc="nvim ~/.dotfiles/.config/fish/config.fish"
alias hrc="nvim ~/.dotfiles/.config/hypr/hyprland.conf"
alias oo="cd /home/Arawan/Documents/Obsidian\ Vault/"

# === Editor === #
set -gx EDITOR nvim

# === FZF exclude === #
set fzf_fd_opts --hidden --max-depth 5 \
    --follow --exclude .cache --exclude .npm \
    --exclude .git --exclude .wget --exclude .local \
    --exclude .cargo --exclude .mozilla --exclude .nv \
    --exclude .config/google-chrome --exclude .config/chromium \
    --exclude .gnupg --exclude .config/Postman

# === FZF color === #
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#031B26,bg:#06101e,spinner:#fd5e3a,hl:#e2d9c5 \
--color=fg:#08435E,header:#e2d9c5,info:#35b5ff,pointer:#fa7a61 \
--color=marker:#fd5e3a,fg+:#66def9,prompt:#35b5ff,hl+:#fd5e3a"

# === Vault path === #
set -Ux VAULT_PATH "/home/Arawan/Documents/Obsidian Vault/"

# === Zoxide === #
zoxide init fish | source

# === Prompt === #
starship init fish | source


#####################
### Take new note ###
#####################

function note
  cd "$VAULT_PATH"
  set -l today_date (date +"%d-%m-%Y")

  # note 
  if test (count $argv) -eq 0
    set -l note_group "$VAULT_PATH/daily"
    set -l note_path "$note_group/$today_date.md"
    if test -f $note_path
        nvim $note_path
    else
      echo "---
tags: [daily]
---
">$note_path
      nvim $note_path
    end

  # note filename
  else if test (count $argv) -eq 1
    set -l note_group "$VAULT_PATH/notes"
    set -l note_path "$note_group/$today_date-$argv[1].md"
    if test -f $note_path
        nvim $note_path
    else
      echo "---
tags: [note]
---
">$note_path
      nvim $note_path
    end

  # note folder filename
  else if test (count $argv) -eq 2
    set -l note_group "$VAULT_PATH/$argv[1]"
    
    # Check exists directory
    if not test -d $note_group
      read -l -P "Can't find the directory you want to create? (y/N)" confirm
      switch $confirm
        case y Y
          mkdir -p $note_group
          echo "Create directory to $note_group"
        case '' n N
          return 1
      end
    end

    set -l note_path "$note_group/$argv[2].md"

    if test -f $note_path
        nvim $note_path
    else
      echo "---
tags: [$argv[1]]
---
">$note_path
      nvim $note_path
    end

  else
    echo "usage: note {filename} or note {group or directories} {filename}"
  end
end


######################
### backup restore ###
######################

function bak
  set file $argv[1]

  # Check if the string ends with .bak
  if string match -r '\.bak$' -- $file
    # If the file is a backup (.bak), rename it back to the original file
    set originalFile (string replace ".bak" "" -- $file)
    if test -e $originalFile
      # Prompt the user for confirmation to replace the existing original file
      read -P "File '$originalFile' already exists. Do you want to replace it? (Y/n) " response
      if test -z "$response"; or test "$response" = "Y"; or test "$response" = "y"
        # Remove the existing original file before renaming
        rm -rf $originalFile
        mv $file $originalFile
        echo "Restored '$file' to '$originalFile'."
      else
        echo "Operation canceled. '$originalFile' was not replaced."
      end
    else
      mv $file $originalFile
      echo "Restored '$file' to '$originalFile'."
    end
  else
    # If the file is not a .bak, create a backup
    set backupFile "$file.bak"
    if test -e $backupFile
      # Prompt the user for confirmation to replace the existing backup file
      read -P "Backup file '$backupFile' already exists. Do you want to replace it? (Y/n) " response
      if test -z "$response"; or test "$response" = "Y"; or test "$response" = "y"
        # Remove the existing backup file before creating a new one
        rm -rf $backupFile
        cp -r $file $backupFile
        echo "Backed up '$file' to '$backupFile' (replaced existing backup)."
      else
        echo "Operation canceled. '$backupFile' was not replaced."
      end
    else
      cp -r $file $backupFile
      echo "Backed up '$file' to '$backupFile'."
    end
  end
end
