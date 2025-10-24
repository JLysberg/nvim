local M = {}

M.opts = {
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
  },
}

function M.setup(opts)
  require("harpoon"):setup(opts)
end

return M
