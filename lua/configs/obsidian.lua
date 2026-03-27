local function expand(path)
  return vim.fs.normalize(vim.fn.expand(path))
end

local function first_existing(paths)
  for _, path in ipairs(paths) do
    local expanded = expand(path)

    if vim.fn.isdirectory(expanded) == 1 then
      return expanded
    end
  end

  return nil
end

local default_workspace = first_existing {
  vim.env.OBSIDIAN_VAULT,
  "~/vaults/personal",
}

local opts = {
  legacy_commands = false,
  workspaces = {
    {
      name = "personal",
      path = default_workspace,
    },
  },
  daily_notes = {
    folder = "daily",
    template = "daily.md",
    default_tags = { "log", "daily" },
  },
  templates = {
    folder = "templates",
  },
  picker = {
    name = "telescope.nvim",
  },
  attachments = {
    folder = "assets/imgs",
  },
  open_notes_in = "current",
  checkbox = {
    order = { " ", "x", ">", "~" },
  },
  footer = {
    enabled = false,
  },
}

return opts
