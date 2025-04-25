local autocmd = vim.api.nvim_create_autocmd

-- highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  pattern = "*",
})

-- change cwd on vim enter
local function open_nvim_tree(data)
  -- return if buffer is not a directory
  local directory = vim.fn.isdirectory(data.file) == 1
  if not directory then
    return
  end

  -- change directory
  vim.cmd.cd(data.file)
end
autocmd("VimEnter", { callback = open_nvim_tree })

-- hide unmodified buffers
autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
  callback = function()
    vim.t.bufs = vim.tbl_filter(function(bufnr)
      return vim.api.nvim_get_option_value("modified", { buf = bufnr })
    end, vim.t.bufs)
  end,
})

-- fix file type of .env files
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".env", ".env.*" },
  command = "set filetype=conf",
})
