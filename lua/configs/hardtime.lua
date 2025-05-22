local options = {
  restricted_keys = {
    ["<Up>"] = { "n", "x" },
    ["<Down>"] = { "n", "x" },
    ["<Left>"] = { "n", "x" },
    ["<Right>"] = { "n", "x" },
  },
  disabled_keys = {
    ["<Left>"] = false,
    ["<Down>"] = false,
    ["<Up>"] = false,
    ["<Right>"] = false,
  },
}

return options
