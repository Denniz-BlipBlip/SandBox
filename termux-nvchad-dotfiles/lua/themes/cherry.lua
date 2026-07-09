local M = {}

-- ============================
-- BASE 30 — general UI colors
-- ============================
M.base_30 = {
  white         = "#f0eeec", -- main text — used for user-created names (vars, classes, funcs)

  black         = "#000000", -- pure black — main editor background
  darker_black  = "#000000", -- true black — sidebar, statusline bg
  black2        = "#0d0d12", -- barely lighter than black — popups, floating windows

  one_bg        = "#121014", -- normal background areas (e.g. NvimTree bg)
  one_bg2       = "#1a1a1f", -- slightly raised elements
  one_bg3       = "#241f22", -- even more raised (selected items, etc)

  grey          = "#3a3238", -- general grey, borders/inactive elements
  grey_fg       = "#4a3f45", -- muted text/icons
  grey_fg2      = "#5c4f55", -- slightly less muted
  light_grey    = "#6e5f66", -- lightest grey — comments, subtle text

  red           = "#ff375f", -- errors, deletions, git-remove
  baby_pink     = "#ff4fa0", -- bright cherry — folder icons (shade 2)
  pink          = "#e2036f", -- CORE cherry pink — keywords accent

  line          = "#1a1a1f", -- separator lines (vertsplit, etc)

  green         = "#8fbf6a", -- strings/success alt (kept distinct from pink family)
  vibrant_green = "#a3d47e", -- brighter green — diagnostics, etc

  nord_blue     = "#c9105e", -- muted "blue" slot repurposed — darker cherry shade
  blue          = "#c9105e", -- functions/links slot — darker cherry shade (shade 3)

  yellow        = "#f2b544", -- warnings, types — kept warm/gold so it stands apart from pink
  sun           = "#f7c869", -- brighter warning/highlight tone

  purple        = "#e2036f", -- keywords slot — CORE cherry pink
  dark_purple   = "#c9105e", -- deeper secondary shade

  teal          = "#e8a1c4", -- soft blush pink — support/regex, kept muted so it doesn't clash

  orange        = "#d1187a", -- constants, numbers — mid-shade pink (shade 4, distinct from keyword pink)

  cyan          = "#ff4fa0", -- support functions/misc — bright cherry shade

  statusline_bg = "#000000", -- background of the bottom statusline
  lightbg       = "#1a1a1f", -- background for popups/menus (cmp, telescope, etc)

  pmenu_bg      = "#e2036f", -- selected popup menu item — CORE cherry pink
  folder_bg     = "#ff375f", -- folder icons (NvimTree) — bright cherry shade, distinct from file text
}

-- ==========================================
-- BASE 16 — syntax highlighting (base16 spec)
-- ==========================================
M.base_16 = {
  base00 = "#000000", -- default background — pure black
  base01 = "#0d0d12", -- lighter background (status bars, line highlighting)
  base02 = "#1a1a1f", -- selection background
  base03 = "#3a3238", -- comments, invisibles, line highlighting
  base04 = "#6e5f66", -- dark foreground (status bars)
  base05 = "#f0eeec", -- default foreground, caret, delimiters — white
  base06 = "#f5f3f1", -- light foreground (rarely used)
  base07 = "#fbf9f8", -- lightest foreground (rarely used)

  base08 = "#f0eeec", -- variables, tags — WHITE (user-created names)
  base09 = "#d1187a", -- integers, booleans, constants — mid cherry shade
  base0A = "#f0eeec", -- classes, search text background — WHITE (user-created names)
  base0B = "#e8a1c4", -- strings, inserted text (diff) — soft blush, kept distinct
  base0C = "#ff4fa0", -- support, regex, escape characters — bright cherry
  base0D = "#f0eeec", -- functions, methods, headings — WHITE (user-created names)
  base0E = "#e2036f", -- keywords, storage, selector — CORE cherry pink
  base0F = "#c9105e", -- deprecated, embedded language tags — darker cherry
}

-- "dark" or "light" — affects how Neovim renders default backgrounds
M.type = "dark"

return M
