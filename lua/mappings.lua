require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- cmd
map("n", ";", ":", { desc = "Enter command mode" })

-- term
map("t", "<esc>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })

-- general
map("n", "<C-q>", function()
  require("nvchad.tabufline").close_buffer()
  vim.cmd "q"
end, { desc = "Close buffer and window" })
map("n", "n", "nzz", { desc = "Next match and center" })
map("n", "N", "Nzz", { desc = "Prev match and center" })

map(
  "n",
  "<leader>s",
  "mz:%s/\\<<C-r><C-w>\\>//g | silent update | normal! `z<S-Left><S-Left><S-Left><S-Left><S-Left><S-Left><Left><Left><Left><C-r><C-w>",
  { desc = "Rename current word in buffer" }
)

-- yank
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
map("n", "<leader>yf", '<cmd> call setreg("+",@%) <cr>', { desc = "Yank file name to clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- window
map("n", "<C-Left>", "<C-w>h", { desc = "Switch to left window" })
map("n", "<C-Right>", "<C-w>l", { desc = "Switch to right window" })
map("n", "<C-Down>", "<C-w>j", { desc = "Switch to window below" })
map("n", "<C-Up>", "<C-w>k", { desc = "Switch to window above" })
map("n", "=", "<cmd>vertical resize +5<cr>", { desc = "Increase window size vertically" })
map("n", "-", "<cmd>vertical resize -5<cr>", { desc = "Decrease window size vertically" })
map("n", "+", "<cmd>horizontal resize +2<cr>", { desc = "Increase window size horizontally" })
map("n", "_", "<cmd>horizontal resize -2<cr>", { desc = "Decrease window size horizontally" })
map("n", "<leader>h", "<cmd>split<cr><cmd>ter<cr>i", { desc = "Create horizontal terminal" })
map("n", "<leader>v", "<cmd>vsplit<cr><cmd>ter<cr>i", { desc = "Create vertical terminal" })
map("n", "<leader>z", function()
  require("zen-mode").toggle()
end, { desc = "Toggle zen mode" })

-- harpoon
-- map("n", "<C-m>", require("harpoon"):list():add(), { desc = "HARPOON Append file to Harpoon list" })
-- map("n", "<C-e>", require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()), { desc = "HARPOON Toggle Harpoon UI"  })
-- map("n", "<C-h>", require("harpoon"):list():select(1), { desc = "HARPOON Select first Harpoon file"  })
-- map("n", "<C-t>", require("harpoon"):list():select(2), { desc = "HARPOON Select second Harpoon file" })
-- map("n", "<C-n>", require("harpoon"):list():select(3), { desc = "HARPOON Select third Harpoon file"  })
-- map("n", "<C-s>", require("harpoon"):list():select(4), { desc = "HARPOON Select fourth Harpoon file"  })

-- lsp
map("n", "[d", function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = "Previous diagnostic with float" })

map("n", "]d", function()
  vim.diagnostic.jump { count = 1, float = true }
  vim.diagnostic.open_float { scope = "line" }
end, { desc = "Next diagnostic with float" })

map("n", "<leader>fl", function()
  vim.diagnostic.open_float { scope = "line" }
end, { desc = "Show diagnostics float" })

map("n", "K", function()
  vim.lsp.buf.hover { border = "rounded" }
end, { desc = "LSP hover" })

-- telescope
map("n", "<leader>gc", "<cmd> Telescope git_commits <cr>", { desc = "Git commits (Telescope)" })
map("n", "<leader>gs", "<cmd> Telescope git_status <cr>", { desc = "Git status (Telescope)" })
map("n", "<leader>gs", "<cmd> Telescope git_status <cr>", { desc = "Git status (Telescope)" })
map("n", "<leader>fk", "<cmd> Telescope keymaps <cr>", { desc = "Display full keymap overview (Telescope)" })
map("n", "<leader>fd", "<cmd> Telescope lsp_definitions <cr>", { desc = "Telescope lsp definitions" })
map("n", "<leader>fr", "<cmd> Telescope lsp_references <cr>", { desc = "Telescope lsp references" })
map("n", "<leader>fD", "<cmd> Telescope diagnostics <cr>", { desc = "Telescope diagnostics" })

-- git
map("n", "<leader>gb", function()
  require("gitsigns").blame_line()
end, { desc = "Git blame" })

map("n", "]h", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to next hunk" })

map("n", "[h", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to prev hunk" })

map("n", "<leader>ghr", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })

map("n", "<leader>ghp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })

map("n", "<leader>gtd", function()
  require("gitsigns").toggle_deleted()
end, { desc = "Toggle deleted" })

nomap("n", "<leader>cm") -- default telescope git commits
nomap("n", "<leader>gt") -- default telescope git status
