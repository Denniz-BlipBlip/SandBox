--File path ~/.config/nvim/lua/chadrc.lua

---@type ChadrcConfig
local M = {}
M.base46 = {
  theme = "marcy",
}

M.ui = {
  hl_override = {
    ["@keyword"]            = { fg = "#ff1493" }, -- if, else, return, etc
    ["@keyword.conditional"] = { fg = "#ff1493" },
    ["@keyword.repeat"]     = { fg = "#ff1493" }, -- for, while, etc
    ["@keyword.function"]   = { fg = "#ff1493" }, -- function/def/fn keyword itself
    ["@keyword.return"]     = { fg = "#ff1493" },
    ["@keyword.import"]     = { fg = "#ff1493" }, -- import/include/use
    ["@keyword.operator"]   = { fg = "#ff1493" }, -- and/or/not/in (Python etc)

    ["@type.builtin"]       = { fg = "#ff1493" }, -- void, int, bool, string, etc
    ["@type"]               = { fg = "#f0eeec" }, -- user-defined class/type names — stays white

    ["@constant.builtin"]   = { fg = "#c71585" }, -- true/false/null/nil
    ["@variable.builtin"]   = { fg = "#f0eeec" }, -- self/this — still a "name", stays white
  },
}

return M
