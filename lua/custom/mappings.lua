
local M = {}

M.general = {
  n = {
    -- primeagen motions
    ["<C-d>"] = { "<C-d>zz", "Move half screen down and center" },
    ["<C-u>"] = { "<C-u>zz", "Have half screen up and center" },
    ["n"] = { "nzzzv", "Move to next match and center" },
    ["N"] = { "Nzzzv", "Hove to previous match and center" },

    -- yank to clipboard
    ["<leader>y"] = { "\"+y", "Yank to clipboard" },
    ["<leader>Y"] = { "\"+Y", "Yank line to clipboard" },

    -- paste from clipboard
    ["<leader>p"] = { "\"+p", "Paste from clipboard" },

    -- todo: find new bindings for dvorak
    -- move current line / block with ala vscode
    -- ["J"] = { "mzJ`z" },
    -- ["Q"] = { "<nop>" },

    -- todo: install undotree
    -- ["<leader>u"] = { function() vim.cmd.UndotreeToggle() end, "Toggle undotree" },

    -- todo: fix
    -- ["<leader>s"] = { "[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]", "Rename current word in buffer" },
    -- ["<leader>vip"] = { "<cmd>source ~/.config/nvim/init.lua<CR>", "Reload init.lua" },
  },

  v = {
    -- yank to clipboard
    ["<leader>y"] = { "\"+y" },

    -- todo: find new bindings for dvorak
    -- move selected line / block of text
    -- ["J"] = { ":m '>+1<CR>gv=gv" },
    -- ["K"] = { ":m '>-2<CR>gv=gv" },
  },

  t = {
    ["<esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" }
  },
}

M.harpoon = {
  n = {
    ["<C-m>"] = { function() require("harpoon"):list():append() end, "Append file to Harpoon list"},
    ["<C-e>"] = { function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, "Toggle Harpoon UI" },
    ["<C-h>"] = { function() require("harpoon"):list():select(1) end, "Select first Harpoon file" },
    ["<C-t>"] = { function() require("harpoon"):list():select(2) end, "Select second Harpoon file"},
    ["<C-n>"] = { function() require("harpoon"):list():select(3) end, "Select third Harpoon file" },
    ["<C-s>"] = { function() require("harpoon"):list():select(4) end, "Select fourth Harpoon file" },
  }
}

M.windows = {
  n = {
    -- switch between windows
    ["<leader><Left>"] = { "<C-w>h", "Window left" },
    ["<leader><Right>"] = { "<C-w>l", "Window right" },
    ["<leader><Down>"] = { "<C-w>j", "Window down" },
    ["<leader><Up>"] = { "<C-w>k", "Window up" },

    -- window resize
    ["="] = { "[[<cmd>vertical resize +5<cr>]]", "Increase window size vertically" },
    ["-"] = { "[[<cmd>vertical resize -5<cr>]]", "Decrease window size vertically" },
    ["+"] = { "[[<cmd>horizontal resize +2<cr>]]", "Increase window size horizontally" },
    ["_"] = { "[[<cmd>horizontal resize -2<cr>]]", "Decrease window size horizontally" },

    -- create windows
    ["<leader>h"] = { "<cmd>split<cr><cmd>ter<cr>i", "Create horizontal terminal" },
    ["<leader>v"] = { "<cmd>vsplit<cr><cmd>ter<cr>i", "Create vertical terminal" },

    -- toggle zen mode
    ["<leader>z"] = { function() require("zen-mode").toggle() end, "Toggle zen mode" }
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = { function() require('dap-python').test_method() end, "Debug python run" }
  }
}

M.tabufline = {
  n = {
    -- close buffer/hide terminal buffer and close window
    ["<leader>X"] = {
      function()
        require("nvchad.tabufline").close_buffer()
        vim.cmd("q")
      end,
      "Close buffer and window",
    },
  }
}

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader>rn"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["gr"] = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "LSP references",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>E"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

return M
