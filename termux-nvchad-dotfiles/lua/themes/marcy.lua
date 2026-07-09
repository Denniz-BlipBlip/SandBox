local M = {}

-- ============================
-- BASE 30 — general UI colors
-- ============================
M.base_30 = {
  white         = "#e8e6e3", -- main text — default foreground

  black         = "#000000", -- pure black — main editor background
  darker_black  = "#000000", -- pure black — sidebar, statusline bg
  black2        = "#12121f", -- barely lighter than black — popups, floating windows

  one_bg        = "#0e0e1c", -- normal background areas (e.g. NvimTree bg)
  one_bg2       = "#181828", -- slightly raised elements
  one_bg3       = "#202032", -- even more raised (selected items, etc)

  grey          = "#3a3a4d", -- general grey, borders/inactive elements
  grey_fg       = "#4a4a5e", -- muted text/icons — matches line number color
  grey_fg2      = "#5c5c70", -- slightly less muted
  light_grey    = "#6b6b7d", -- lightest grey — comments (matches comment color)

  red           = "#ff2d78", -- errors, deletions — same pink as keywords (kept consistent)
  baby_pink     = "#ff5f94", -- softer pink — warnings/highlights
  pink          = "#ff2d78", -- CORE accent — keywords AND operators

  line          = "#181828", -- separator lines (vertsplit, etc)

  green         = "#7ad494", -- strings/success alt — method/builtin calls (append, join, int)
  vibrant_green = "#8fe0a8", -- brighter green — diagnostics, etc

  nord_blue     = "#4dd8e8", -- muted "blue" slot — user function names
  blue          = "#4dd8e8", -- functions/links — CYAN, your own function definitions

  yellow        = "#e8d44d", -- warnings/types — class names + strings
  sun           = "#f0e070", -- brighter warning/highlight tone

  purple        = "#e8a0c4", -- keywords slot repurposed — muted rose, used for `self`
  dark_purple   = "#d488ac", -- deeper secondary shade of rose

  teal          = "#7ad494", -- support/regex — matches method call green

  orange        = "#e8d44d", -- constants, numbers — same yellow as class names/strings

  cyan          = "#4dd8e8", -- support functions/misc — matches function name cyan

  statusline_bg = "#000000", -- background of the bottom statusline
  lightbg       = "#181828", -- background for popups/menus (cmp, telescope, etc)

  pmenu_bg      = "#ff2d78", -- selected popup menu item — core pink
  folder_bg     = "#ff375f", -- folder icons (NvimTree, Ctrl+N) — as requested
}

-- ==========================================
-- BASE 16 — syntax highlighting (base16 spec)
-- ==========================================
M.base_16 = {
  base00 = "#000000", -- default background — pure black
  base01 = "#12121f", -- lighter background (status bars, line highlighting)
  base02 = "#181828", -- selection background
  base03 = "#4a4a5e", -- comments, invisibles, line highlighting
  base04 = "#6b6b7d", -- dark foreground (status bars)
  base05 = "#e8e6e3", -- default foreground, caret, delimiters — off-white
  base06 = "#f0efec", -- light foreground (rarely used)
  base07 = "#f8f7f4", -- lightest foreground (rarely used)

  base08 = "#e8a0c4", -- variables, tags — muted rose (`self` and instance refs)
  base09 = "#e8d44d", -- integers, booleans, constants — yellow
  base0A = "#e8d44d", -- classes, search text background — YELLOW (class names)
  base0B = "#e8d44d", -- strings, inserted text (diff) — same yellow as classes
  base0C = "#7ad494", -- support, regex, escape chars — GREEN (method/builtin calls)
  base0D = "#4dd8e8", -- functions, methods, headings — CYAN (your function names)
  base0E = "#ff2d78", -- keywords, storage, selector, operators — CORE PINK
  base0F = "#d488ac", -- deprecated, embedded language tags — deeper rose
}

-- "dark" or "light" — affects how Neovim renders default backgrounds
M.type = "dark"

return M
