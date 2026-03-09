# Repository Guidelines

## Project Structure & Module Organization
This repository is a user config layer for NvChad. [`init.lua`](/home/norlys/.dotfiles/nvim/.config/nvim/init.lua) bootstraps `lazy.nvim`, loads NvChad, and imports local modules from `lua/`.

- [`lua/chadrc.lua`](/home/norlys/.dotfiles/nvim/.config/nvim/lua/chadrc.lua): NvChad UI and terminal overrides.
- [`lua/options.lua`](/home/norlys/.dotfiles/nvim/.config/nvim/lua/options.lua), [`lua/mappings.lua`](/home/norlys/.dotfiles/nvim/.config/nvim/lua/mappings.lua), [`lua/autocmds.lua`](/home/norlys/.dotfiles/nvim/.config/nvim/lua/autocmds.lua): core editor behavior.
- [`lua/plugins/init.lua`](/home/norlys/.dotfiles/nvim/.config/nvim/lua/plugins/init.lua): plugin specs.
- [`lua/configs/`](/home/norlys/.dotfiles/nvim/.config/nvim/lua/configs): per-plugin setup modules.
- [`lazy-lock.json`](/home/norlys/.dotfiles/nvim/.config/nvim/lazy-lock.json): pinned plugin versions. Update it only when intentionally changing dependencies.

## Build, Test, and Development Commands
- `nvim`: start the config interactively for normal development.
- `nvim --headless "+Lazy! sync" +qa`: install or update plugins from the lockfile and plugin spec changes.
- `nvim --headless "+checkhealth" +qa`: run Neovim health checks after changing LSP, formatter, or runtime settings.
- `stylua .`: format Lua files using the repo’s StyleLua settings.

If a tool is missing locally, install it through Mason when possible; this config already ensures tools like `stylua`, `prettierd`, `ruff`, and `omnisharp`.
When changing plugin specs, do not run `:Lazy`, `Lazy sync`, or otherwise install/update plugins unless the user explicitly asks. Leave `lazy-lock.json` untouched unless the user wants dependency changes resolved in the repo.

## Coding Style & Naming Conventions
Lua is formatted with StyleLua using 2-space indentation, 120-column lines, Unix line endings, and double-quote preference. Keep module filenames lowercase, with descriptive names such as `treesitter_context.lua` or `lspconfig.lua`. Prefer small config modules under `lua/configs/` instead of adding unrelated logic to `init.lua`.

## Testing Guidelines
There is no automated test suite in this repository. Validate changes with a headless health check, then open `nvim` and smoke-test the affected workflow: plugin loading, keymaps, LSP attachment, formatting on save, and terminal behavior. When changing plugin specs, confirm `:Lazy` resolves cleanly and update `lazy-lock.json` if versions changed.
If the user wants to manage plugin installation manually, stop after editing the config and note that validation requiring plugin installation was not run.

## Commit & Pull Request Guidelines
Recent history uses short Conventional Commit prefixes such as `feat:`, `fix:`, and `chore:`. Follow that pattern and keep subjects imperative, for example `feat: add svelte formatter fallback`. Pull requests should describe the user-facing change, list any new plugins or external tools, and include screenshots or short recordings for visible UI changes such as themes, floating terminals, or statusline behavior.
