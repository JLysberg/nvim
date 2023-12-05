local M = {}

M.ui = {
  statusline = {
    theme = "minimal",
    -- modules arg here is the default table of modules
    overriden_modules = function(modules)
      modules[1] = (function()
        return "MODE!"
      end)()

      -- define the somefunction anywhwere in your custom dir, just call it well!
      -- modules[2] = somefunction()  

      -- adding a module between 2 modules
      -- Use the table.insert functin to insert at specific index
      -- This will insert a new module at index 2 and previous index 2 will become 3 now

      table.insert(
        modules,
        2,
        (function()
          return " between mode and filename ! "
        end)()
      )
    end,
  },
}

return M
