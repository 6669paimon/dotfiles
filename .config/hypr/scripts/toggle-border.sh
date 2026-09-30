#!/usr/bin/env bash
# สลับ border ของหน้าต่างที่ focus อยู่ (0 <-> 1)
addr=$(hyprctl activewindow -j | jq -r '.address')
cur=$(hyprctl getprop "address:$addr" border_size 2>/dev/null | grep -o '[0-9]\+' | head -1)

if [ "$cur" = "0" ]; then
  new=1
else
  new=0
fi

hyprctl dispatch "hl.dsp.window.set_prop({ prop = \"border_size\", value = \"$new\", window = \"address:$addr\" })"
