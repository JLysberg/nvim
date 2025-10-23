# Repository Guidelines

## Project Structure & Module Organization
The Neovim runtime starts in `init.lua`, which bootstraps NvChad and delegates everything to the `lua/` tree. Feature toggles and UI defaults live in `lua/chadrc.lua`, while editor behavior is split between `lua/options.lua`, `lua/mappings.lua`, and `lua/autocmds.lua`. Plugin sources are declared in `lua/plugins/init.lua`, and detailed setups live in `lua/configs/` (for example, `lua/configs/lspconfig.lua` or `lua/configs/cmp.lua`). Keep language- or tool-specific adjustments in those per-plugin modules rather than in core files to avoid regressions.

## Build, Test, and Development Commands
Run `nvim` from the repo root to load this configuration. Use `nvim --headless "+Lazy sync" +qa` after adding plugins to refresh the lockfile, and `nvim --headless "+Lazy check" +qa` to validate plugin health. Format Lua with `stylua .` (configuration is in `.stylua.toml`). When validating remote installs, point `$NVIM_APPNAME` to this directory: `NVIM_APPNAME=.config/nvim nvim`.

## Coding Style & Naming Conventions
Lua code follows `.stylua.toml`: two-space indentation, Unix line endings, and double quotes preferred when Stylua can choose. Modules under `lua/configs/` should use descriptive snake_case filenames that mirror the plugin name (e.g., `nvimtree.lua`), and exported tables should be lowerCamelCase. Prefer local helper functions over globals, and keep NvChad overrides in the dedicated files provided by the starter.

## Testing Guidelines
There are no automated tests; exercise the config interactively. Run `:checkhealth` inside Neovim after dependency changes, and open language workspaces to confirm each LSP or formatter initializes without errors. When adding new tooling, document the manual verification steps in the relevant module as comments so others can reproduce them.

## Commit & Pull Request Guidelines
Commits follow Conventional Commit prefixes (`feat:`, `chore:`, etc.) as seen in `git log`. Use present tense and keep subject lines under 72 characters. Pull requests should describe the motivation, summarize config or plugin changes, and reference related issues or upstream plugins. Include screenshots or steps for UI-facing tweaks so reviewers can validate them quickly.

## Agent Workflow Notes
Work in feature branches, run the headless Lazy sync before pushing, and ensure `lazy-lock.json` reflects any plugin updates. If a plugin requires secrets or external binaries, note them in the PR description and avoid checking credentials into the repo.
