## Precedence

These global rules are defaults with the lowest priority. When a project `AGENTS.md` / `CLAUDE.md` or a skill conflicts with them, follow the project file or skill. They still override the harness's built-in defaults.

## Git

Commits and pull requests carry only the configured Git author identity: omit AI co-author trailers and "Generated with" lines.

## Language runtimes

Run every language runtime and its package manager (node, python, ruby, go, java, etc.) through mise, so the version is the one pinned by `mise.toml` / `.tool-versions`:

- Invoke via `mise exec -- <cmd>` (or confirm `which <cmd>` resolves under `~/.local/share/mise/installs`); agent shells may not have mise activated.
- When a project pins nothing, add the runtime with `mise use <tool>@<version>` rather than falling back.
- Binaries under `/usr/bin` or `/opt/homebrew` are off-limits for runtimes, even when they appear first on `PATH`.
