local M = {}
local state = { buf = nil }

local function save_buf(buf)
  if
    buf
    and vim.api.nvim_buf_is_valid(buf)
    and vim.api.nvim_buf_is_loaded(buf)
    and vim.api.nvim_buf_get_name(buf) ~= ""
    and vim.bo[buf].modifiable
    and vim.bo[buf].modified
  then
    vim.api.nvim_buf_call(buf, function()
      vim.cmd "silent noautocmd write"
    end)
  end
end

function M.toggle()
  local visible_win = state.buf and vim.fn.win_findbuf(state.buf)[1]

  if visible_win and vim.api.nvim_win_is_valid(visible_win) then
    save_buf(state.buf)
    vim.api.nvim_win_close(visible_win, true)
    return
  end

  if not package.loaded["obsidian.daily"] then
    require("lazy").load { plugins = { "obsidian.nvim" } }
  end

  local note = require("obsidian.daily").today()
  local path = vim.fs.normalize(tostring(note.path))

  -- Reuse the hidden buffer only while it still points at today's note.
  if
    not (
      state.buf
      and vim.api.nvim_buf_is_valid(state.buf)
      and vim.fs.normalize(vim.api.nvim_buf_get_name(state.buf)) == path
    )
  then
    state.buf = nil
  end

  vim.cmd "rightbelow vsplit"
  vim.api.nvim_win_set_width(0, math.max(1, math.floor(vim.o.columns * require("nvconfig").term.sizes.vsp)))

  if state.buf then
    vim.api.nvim_win_set_buf(0, state.buf)
  else
    -- Open once through Obsidian so the buffer gets its normal note setup.
    note:open { sync = true, open_strategy = "current" }
    state.buf = vim.api.nvim_get_current_buf()
  end

  vim.bo[state.buf].bufhidden = "hide"
  vim.bo[state.buf].buflisted = false

  vim.api.nvim_create_autocmd("BufWinLeave", {
    buffer = state.buf,
    group = vim.api.nvim_create_augroup("DailyNotePaneSave", { clear = true }),
    callback = function(args)
      save_buf(args.buf)
    end,
  })
end

return M
