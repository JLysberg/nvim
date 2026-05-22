local luasnip = require "luasnip"

-- Allow Svelte buffers to reuse HTML snippets
luasnip.filetype_extend("svelte", { "html" })

luasnip.add_snippets("markdown", {
  luasnip.snippet({ trig = "-", snippetType = "autosnippet", wordTrig = false }, {
    luasnip.text_node "- [ ] ",
  }, {
    condition = function(line_to_cursor)
      return line_to_cursor:match "^%s*-$" ~= nil
    end,
  }),
})
