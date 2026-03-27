-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gatekeeper",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

M.term = {
  sizes = { vsp = 0.4 },
  float = {
    row = 0.15, -- slightly less than (1-height)/2
    col = 0.15, -- (1-width)/2
    height = 0.6,
    width = 0.7,
  },
}

return M
