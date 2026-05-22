local luasnip = require "luasnip"
local cmp = require "cmp"

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local continue_markdown_checkbox = function()
  if vim.bo.filetype ~= "markdown" then
    return false
  end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  local indent, bullet = line:match "^([ \t]*)([-*+])%s+%[[ xX>~]%]"

  if not indent then
    return false
  end

  local prefix = indent .. bullet .. " [ ] "
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "", prefix })
  vim.api.nvim_win_set_cursor(0, { row + 1, #prefix })

  return true
end

local options = {
  mapping = {
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if luasnip.expandable() then
          luasnip.expand()
        else
          cmp.confirm {
            select = true,
          }
        end
      elseif continue_markdown_checkbox() then
        return
      else
        fallback()
      end
    end),

    -- disable completion with tab to not interfere with copilot
    ["<Tab>"] = vim.NIL,
    ["<S-Tab>"] = vim.NIL,

    ["<Down>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if #cmp.get_entries() == 1 then
          cmp.confirm { select = true }
        else
          cmp.select_next_item()
        end
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      elseif has_words_before() then
        cmp.complete()
        if #cmp.get_entries() == 1 then
          cmp.confirm { select = true }
        end
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<Up>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
}

return options
