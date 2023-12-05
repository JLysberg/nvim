-- snippet paths
vim.g.vscode_snippets_path = "your snippets path"
vim.g.snipmate_snippets_path = "your snippets path"
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/lua_snippets"

vim.o.relativenumber = true
vim.o.hlsearch = true

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


