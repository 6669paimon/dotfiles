-- ============================================================================
--  Hyprland config (Lua, Hyprland 0.55+)
--  Hardware: Intel HD 630 (card2, renders desktop) + GTX 1050 Mobile (card1)
--  Ref: https://wiki.hypr.land/Configuring/Start/
--  หมายเหตุ: บรรทัดที่มี [CHANGED] คือจุดที่แก้จากไฟล์เดิม
-- ============================================================================


-- ----------------------------------------------------------------------------
--  1. ENVIRONMENT
-- ----------------------------------------------------------------------------

-- GPU: Intel เป็นตัวหลัก (วาด desktop), NVIDIA เป็นตัวรอง (รองรับจอนอกในอนาคต)
-- [CHANGED] เดิมไม่ได้ตั้ง ทำให้เลือก GPU เอง + ตัวแปร NVIDIA ปนกันจน crash
-- ตรวจเลข card ด้วย: ls -l /dev/dri/by-path/   (card2 = Intel, card1 = NVIDIA)
-- ถ้าไม่ต้องการ NVIDIA เลย ใช้ "/dev/dri/card2" ตัวเดียวได้
hl.env("AQ_DRM_DEVICES", "/dev/dri/card2:/dev/dri/card1")

-- Video decode ด้วย Intel (iHD) [CHANGED] เดิมเป็น nvidia
hl.env("LIBVA_DRIVER_NAME", "iHD")

-- [CHANGED] ลบตัวแปร NVIDIA ระดับเซสชันออกทั้งหมด (GBM_BACKEND, __GLX_VENDOR_LIBRARY_NAME,
-- __NV_PRIME_RENDER_OFFLOAD, __VK_LAYER_NV_optimus, VDPAU_DRIVER, NVD_BACKEND ฯลฯ)
-- ถ้าจะใช้ NVIDIA กับบางแอป ให้รันด้วย: prime-run <app>

-- Session
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

-- Toolkits
hl.env("GDK_BACKEND", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("NO_AT_BRIDGE", "1")

-- Qt
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Cursor
hl.env("XCURSOR_THEME", "McMojave")
hl.env("XCURSOR_SIZE", "20")


-- ----------------------------------------------------------------------------
--  2. MONITORS
-- ----------------------------------------------------------------------------
-- auto = จอใหม่ที่เสียบเพิ่มจะถูกตั้งค่าให้อัตโนมัติ
-- [CHANGED] เอา cm = "srgb" ออกเพื่อลดความซับซ้อนของ render pipeline (ใส่กลับได้)
hl.monitor({ output = "", mode = "highres", position = "auto", scale = 1 })


-- ----------------------------------------------------------------------------
--  3. PROGRAMS & AUTOSTART
-- ----------------------------------------------------------------------------

local terminal    = "alacritty"
local fileManager = "thunar"
local menu        = "killall wofi || wofi --show drun"

hl.on("hyprland.start", function()
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("awww-daemon & sleep 1 && awww img ~/Wallpaper/make.png")
  hl.exec_cmd("waybar")
end)


-- ----------------------------------------------------------------------------
--  4. LOOK AND FEEL
-- ----------------------------------------------------------------------------

hl.config({
  cursor = {
    -- [CHANGED] เดิม true (workaround ของ NVIDIA) ตอนนี้ render บน Intel ใช้ hardware cursor ได้
    -- ถ้าเคอร์เซอร์ผิดปกติ ให้เปลี่ยนกลับเป็น true
    no_hardware_cursors = false,
  },

  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_size = 1,
    col = {
      active_border = "rgba(133c63ee)",
      inactive_border = "rgba(08131aee)",
    },
    layout = "dwindle",
    allow_tearing = false,
  },

  decoration = {
    rounding = 3,
    dim_special = 0.0,

    blur = {
      enabled = true,
      xray = true,
      size = 5,
      passes = 2,
      noise = 0.05,
      brightness = 0.9,
    },

    shadow = {
      enabled = true,
      range = 10,
      render_power = 3,
      color = "rgba(02070dee)",
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
  },

  misc = {
    disable_hyprland_logo = true,
  },
})

-- Animations
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "default" })

-- Touchpad gestures ปิดอยู่ (ไม่มี hl.gesture() = ไม่มี swipe)
-- เปิดใช้: hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })


-- ----------------------------------------------------------------------------
--  5. INPUT
-- ----------------------------------------------------------------------------

hl.config({
  input = {
    kb_layout = "us,th",
    kb_variant = "",
    kb_model = "",
    kb_options = "grp:win_space_toggle,altwin:menu_win,ctrl:nocaps",
    kb_rules = "",

    follow_mouse = 1,
    sensitivity = 0.35, -- -1.0 ถึง 1.0

    touchpad = {
      natural_scroll = false,
    },
  },
})


-- ----------------------------------------------------------------------------
--  6. WINDOW RULES
-- ----------------------------------------------------------------------------
-- [CHANGED] รวมกฎที่ซ้ำซ้อนของแอปเดียวกันให้เหลือกฎเดียว (ผลลัพธ์เหมือนเดิม)

-- Floating apps
hl.window_rule({
  match = { class = "^(imv|mpv|Steam|nwg-look|pavucontrol-qt|pavucontrol|Waydroid)$" },
  float = true,
})

-- Terminals
hl.window_rule({
  match = { class = "^(Alacritty)$" },
  float = true,
  size = "860 575",
  move = "550 50",
})
hl.window_rule({
  match = { class = "^(kitty)$" },
  float = true,
  size = "860 600",
  move = "550 100",
})

-- File manager
hl.window_rule({
  match = { class = "^([Tt]hunar)$" },
  float = true,
  size = "860 575",
  move = "550 50",
  opacity = "0.80 0.80",
})

hl.window_rule({
  match = { class = "^(xarchiver)$" },
  float = true,
  size = "860 575",
  move = "550 50",
  opacity = "0.80 0.80",
})

-- Browsers
hl.window_rule({
  match = { class = "^(firefox)$" },
  workspace = "2 silent",
  float = true,
  size = "1660 960",
})
hl.window_rule({
  match = { class = "^(google-chrome)$" },
  workspace = "2 silent",
  border_size = 0,
})
hl.window_rule({
  match = { class = "^([Cc]hromium)$" },
  workspace = "2 silent",
})
hl.window_rule({
  match = { class = "^(google-chrome)$", title = "^(Open File|Save File)$" },
  float = true,
})

-- Documents / notes
hl.window_rule({
  match = { class = "^(org.pwmt.zathura)$" },
  float = true,
  size = "1050 1050",
  center = true,
})
hl.window_rule({
  match = { class = "^(md.obsidian.Obsidian)$" },
  float = true,
  size = "1050 1050",
  center = true,
})

-- Translucent utilities
hl.window_rule({
  match = { class = "^(nwg-look|pavucontrol)$" },
  opacity = "0.80 0.80",
})

-- ueberzugpp image overlay
hl.window_rule({
  name        = "ueberzugpp-overlay",
  match       = { title = "^ueberzugpp_.*" },
  float       = true,
  border_size = 0,
  no_blur     = true,
  no_anim     = true,
  no_focus    = true,
  pin         = true,
})


-- ----------------------------------------------------------------------------
--  7. KEYBINDINGS
-- ----------------------------------------------------------------------------

local mainMod = "SUPER"

-- [CHANGED] ค่าและฟังก์ชันกลางสำหรับ "คอลัมน์ชิดขวา" ใช้ร่วมกันระหว่าง SUPER+Return และ SUPER+SHIFT+L
-- แก้ที่นี่ที่เดียว ทั้งสองคีย์จะเปลี่ยนตาม
local BAR_TOP = 24  -- ความสูง waybar ด้านบน (px) ดูจาก: hyprctl monitors (reserved)
local GAP     = 8   -- เท่ากับ general.gaps_out
local TERM_W  = 860 -- ความกว้างของ terminal ที่เปิดใหม่ (px)

-- คืนค่าตำแหน่งและขนาด (x, y, w, h) ของหน้าต่างที่ชิดขวาและสูงพอดีจอ
local function rightColumn(width)
  local okM, mon = pcall(hl.get_active_monitor)
  local sw = (okM and mon and mon.width) or 1920 -- ค่าสำรองถ้าอ่านขนาดจอไม่ได้
  local sh = (okM and mon and mon.height) or 1080
  return {
    x = sw - width - GAP,
    y = BAR_TOP + GAP,
    w = width,
    h = sh - BAR_TOP - 2 * GAP,
  }
end

-- Apps
-- [CHANGED] เปิด terminal พร้อมขนาด/ตำแหน่งเดียวกับ SUPER+SHIFT+L (ชิดขวา สูงพอดีจอ)
-- ใช้ rules ของ exec_cmd: float + size + move
hl.bind(mainMod .. " + Return", function()
  local g = rightColumn(TERM_W)
  hl.dispatch(hl.dsp.exec_cmd(terminal, {
    float = true,
    size  = { g.w, g.h },
    move  = { g.x, g.y },
  }))
end)
hl.bind("CTRL + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Window management
hl.bind(mainMod .. " + X", hl.dsp.window.close())
hl.bind(mainMod .. " + A", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + C", hl.dsp.window.center())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())       -- dwindle
hl.bind(mainMod .. " + N", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())

-- [CHANGED] เดิม bind ALT+Tab ซ้ำสองครั้ง (อันหลังทับอันแรก) รวมเป็นฟังก์ชันเดียว
hl.bind("ALT + Tab", function()
  hl.dispatch(hl.dsp.window.cycle_next())
  hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- Fullscreen
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "set" }))
hl.bind("F11", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- [CHANGED] SUPER+SHIFT+L: ย้ายหน้าต่างไปขวาสุด + ขยายความสูงให้พอดีจอ
-- เดิมใช้ resize/move แบบ relative จึงโตเพิ่มทุกครั้งที่กด และตำแหน่งเพี้ยนตามขนาดเดิม
-- ตอนนี้ใช้ค่าสัมบูรณ์ (relative = false) กดกี่ครั้งผลก็เท่าเดิม
hl.bind(mainMod .. " + SHIFT + L", function()
  -- อ่านความกว้างปัจจุบันของหน้าต่าง (คงความกว้างเดิมไว้ ถ้าอ่านไม่ได้ใช้ TERM_W)
  local ww = TERM_W
  local okW, win = pcall(hl.get_active_window)
  if okW and win and type(win.size) == "table" then
    ww = win.size.x or win.size[1] or ww
  end
  local g = rightColumn(ww)

  -- ใช้ action = "enable" (ค่าที่เอกสารระบุ: toggle / enable / disable)
  hl.dispatch(hl.dsp.window.float({ action = "enable" }))
  hl.dispatch(hl.dsp.window.resize({ x = g.w, y = g.h, relative = false }))
  hl.dispatch(hl.dsp.window.move({ x = g.x, y = g.y, relative = false }))
end)

-- Focus (vim keys)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move window (arrow keys)
hl.bind(mainMod .. " + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.window.move({ direction = "down" }))

-- Workspaces 1-10 (key 0 = workspace 10)
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = tostring(i) }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(i) }))
end

hl.bind(mainMod .. " + F", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + B", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse drag / resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Screenshots (hyprshot)
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region"))

-- Utilities
-- [CHANGED] แก้ช่องว่างก่อน "+" ที่ขาดไปให้เหมือน bind อื่น
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-border.sh"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

-- Submap: resize (SUPER+SHIFT+R)
hl.define_submap("resize", function()
  hl.bind("l", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
  hl.bind("h", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
  hl.bind("k", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
  hl.bind("j", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
  hl.bind("CTRL + C", hl.dsp.submap("reset"))
  hl.bind("Escape", hl.dsp.submap("reset"))
  hl.bind("q", hl.dsp.submap("reset"))
end)
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.submap("resize"))

-- Submap: move (SUPER+W)
hl.define_submap("move", function()
  hl.bind("l", hl.dsp.window.move({ x = 30, y = 0, relative = true }), { repeating = true })
  hl.bind("h", hl.dsp.window.move({ x = -30, y = 0, relative = true }), { repeating = true })
  hl.bind("k", hl.dsp.window.move({ x = 0, y = -30, relative = true }), { repeating = true })
  hl.bind("j", hl.dsp.window.move({ x = 0, y = 30, relative = true }), { repeating = true })
  hl.bind("CTRL + C", hl.dsp.submap("reset"))
  hl.bind("Escape", hl.dsp.submap("reset"))
  hl.bind("q", hl.dsp.submap("reset"))
end)
hl.bind(mainMod .. " + W", hl.dsp.submap("move"))

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioMedia", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { locked = true })

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 +5%"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 -5%"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
  { locked = true, repeating = true })

-- Brightness
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))

-- Power profiles
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("powerprofilesctl set performance"))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("powerprofilesctl set balanced"))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd("powerprofilesctl set power-saver"))
