require "nvchad.options"

-- add yours here!
local o = vim.o
-- o.cursorlineopt ='both'
o.cursorlineopt = "number"

o.relativenumber = true

vim.notify = require "notify"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99

-- Ensure .NET apphosts can locate the system runtime when Neovim is started from an environment that lacks DOTNET_ROOT.
local dotnet_root = "/usr/share/dotnet"
if vim.fn.isdirectory(dotnet_root) == 1 then
  vim.env.DOTNET_ROOT = dotnet_root
end
local dotnet_tools = vim.fn.expand "$HOME/.dotnet/tools"
if vim.fn.isdirectory(dotnet_tools) == 1 and not string.find(vim.env.PATH or "", dotnet_tools, 1, true) then
  vim.env.PATH = dotnet_tools .. ":" .. (vim.env.PATH or "")
end
