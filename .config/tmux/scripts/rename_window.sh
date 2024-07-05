#!/bin/sh
window_name=$(tmux display-message -p '#W' | tr '[:lower:]' '[:upper:]')
if [ "$window_name" = "FISH" ];
then
  window_name="TERM"
  tmux rename-window "$window_name"
else
  tmux rename-window "$window_name"
fi

