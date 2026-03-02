local shade_was_active = false

local function has_shade_overlay()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local ok, winhl = pcall(vim.api.nvim_get_option_value, "winhighlight", { win = win })
    if ok and type(winhl) == "string" and string.find(winhl, "Normal:ShadeOverlay", 1, true) then
      return true
    end
  end

  return false
end

local function toggle_shade()
  local ok, shade = pcall(require, "shade")
  if ok and type(shade.toggle) == "function" then
    shade.toggle()
    return true
  end

  return false
end

local options = {
  window = {
    -- width = 152, -- full width of 175% 4k portrait
    width = 135, -- half width of 175% 4k landscape
  },
  plugins = {
    options = {
      enabled = true,
      laststatus = 0, -- turn off the statusline in zen mode
    },
  },
  on_open = function()
    shade_was_active = has_shade_overlay()
    if shade_was_active then
      toggle_shade()
    end
  end,
  on_close = function()
    if shade_was_active then
      toggle_shade()
    end
    shade_was_active = false
  end,
}

return options
