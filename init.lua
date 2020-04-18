-- My user Settings

local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

-- Needed to acces certain functions
local common = require "core.common"

-- Set the scale variable to make the whole editor scale
local _SCALE = 1.2

-- Copied from: core/config.lua
config.treeview_size = 200 * _SCALE

-- Copied from: core/style.lua
style.padding = { x = common.round(14 * _SCALE), y = common.round(7 * _SCALE) }
style.divider_size = common.round(1 * _SCALE)
style.scrollbar_size = common.round(4 * _SCALE)
style.caret_width = common.round(2 * _SCALE)
style.tab_width = common.round(170 * _SCALE)

style.font = renderer.font.load(_EXEDIR .. "/data/fonts/font.ttf", 14 * _SCALE)
style.big_font = renderer.font.load(_EXEDIR .. "/data/fonts/font.ttf", 34 * _SCALE)
style.icon_font = renderer.font.load(_EXEDIR .. "/data/fonts/icons.ttf", 14 * _SCALE)
style.code_font = renderer.font.load(_EXEDIR .. "/data/fonts/monospace.ttf", 13.5 * _SCALE)

-- key bindings:
keymap.add {
  ["alt+right"] = "find-replace:repeat-find",
  ["alt+left"] = "find-replace:previous-find",
}
