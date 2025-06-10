local autocmd = vim.api.nvim_create_autocmd

-- highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  pattern = "*",
})

-- change cwd on vim enter
autocmd("VimEnter", {
  callback = function(data)
    -- return if buffer is not a directory
    local directory = vim.fn.isdirectory(data.file) == 1
    if not directory then
      return
    end

    -- change directory
    vim.cmd.cd(data.file)
  end,
})

-- hide unmodified buffers from tabufline
autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
  callback = function()
    vim.t.bufs = vim.tbl_filter(function(bufnr)
      return vim.api.nvim_get_option_value("modified", { buf = bufnr })
    end, vim.t.bufs)
  end,
})

-- fix file type of .env files for treesitter
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".env", ".env.*" },
  command = "set filetype=conf",
})

-- set options for terminal buffers
autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.relativenumber = true
    vim.opt_local.number = true

    -- start in insert mode on open
    vim.cmd "startinsert"
  end,
})
