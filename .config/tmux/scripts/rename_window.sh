#!/bin/sh
window_name=$(tmux display-message -p '#W' | tr '[:lower:]' '[:upper:]')
tmux rename-window "$window_name"
