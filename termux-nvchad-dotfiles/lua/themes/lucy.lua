local M = {}

-- ============================
-- BASE 30 — general UI colors
-- ============================
M.base_30 = {
  white         = "#b8b3ae", -- main text color (default foreground) — muted grayish white

  black         = "#000000", -- pitch black — main editor background
  darker_black  = "#000000", -- true black — sidebar, statusline bg
  black2        = "#0a0908", -- barely lighter than black — popups, floating windows

  one_bg        = "#100e0d", -- normal background areas (e.g. NvimTree bg)
  one_bg2       = "#1a1715", -- slightly raised elements
  one_bg3       = "#241f1c", -- even more raised (selected items, etc)

  grey          = "#443a34", -- general grey, borders/inactive elements
  grey_fg       = "#54473f", -- muted text/icons
  grey_fg2      = "#61524a", -- slightly less muted
  light_grey    = "#716056", -- lightest grey — comments, subtle text

  red           = "#e8503a", -- errors, deletions, git-remove (glowing coal red)
  baby_pink     = "#ff8a70", -- softer red — warnings/highlights
  pink          = "#ff6f61", -- accent pink

  line          = "#1a1512", -- separator lines (vertsplit, etc)

  green         = "#a9b665", -- strings, git-add, success indicators
  vibrant_green = "#8fae4a", -- brighter green — diagnostics, etc

  nord_blue     = "#c98a5e", -- muted "blue" slot, ember-tinted
  blue          = "#d99a63", -- functions, links, info diagnostics

  yellow        = "#e6a23c", -- warnings, types
  sun           = "#f2b544", -- brighter warning/highlight tone

  purple        = "#c47a5a", -- keywords, burnt sienna accent
  dark_purple   = "#a8623f", -- deeper secondary accent

  teal          = "#c9825a", -- syntax elements / plugin UI
  orange        = "#f2661a", -- constants, numbers — the primary "ember" accent

  cyan          = "#d68a4a", -- support functions, regex, misc syntax

  statusline_bg = "#000000", -- background of the bottom statusline
  lightbg       = "#1a1715", -- background for popups/menus (cmp, telescope, etc)

  pmenu_bg      = "#f2661a", -- selected popup menu item highlight
  folder_bg     = "#f2661a", -- folder icons (NvimTree, etc)
}

-- ==========================================
-- BASE 16 — syntax highlighting (base16 spec)
-- ==========================================
M.base_16 = {
  base00 = "#000000", -- default background — pitch black
  base01 = "#0a0908", -- lighter background (status bars, line highlighting)
  base02 = "#1a1512", -- selection background
  base03 = "#443a34", -- comments, invisibles, line highlighting
  base04 = "#716056", -- dark foreground (status bars)
  base05 = "#b8b3ae", -- default foreground, caret, delimiters — muted grayish white
  base06 = "#e8e2da", -- light foreground (rarely used)
  base07 = "#f5f0ea", -- lightest foreground (rarely used)

  base08 = "#e8503a", -- variables, tags, XML attributes (ember red)
  base09 = "#f2661a", -- integers, booleans, constants (ember orange)
  base0A = "#e6a23c", -- classes, search text background (amber)
  base0B = "#a9b665", -- strings, inserted text (diff)
  base0C = "#d68a4a", -- support, regex, escape characters
  base0D = "#d99a63", -- functions, methods, headings
  base0E = "#c47a5a", -- keywords, storage, selector, changed text (diff)
  base0F = "#a8623f", -- deprecated, embedded language tags
}

-- "dark" or "light" — affects how Neovim renders default backgrounds
M.type = "dark"

return M
