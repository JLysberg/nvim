local M = {}

-- Let terminal buffers use Vimade's normal namespace-based highlighter instead
-- of the built-in full-window Normal overlay, which strips ANSI colors.
M.highlight = function(_win, _redraw) end

M.unhighlight = function(win)
  if win.terminal_match then
    vim.fn.matchdelete(win.terminal_match, win.winid)
    win.terminal_match = nil
  end
end

return M
