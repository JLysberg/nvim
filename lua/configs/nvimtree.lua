local options = {
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  on_attach = function(bufnr)
    local api = require "nvim-tree.api"

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.del("n", "E", { buffer = bufnr })
  end,
}

return options
