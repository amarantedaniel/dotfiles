# dotfiles

Personal macOS dotfiles. No framework — `install.sh` just symlinks each file
into place with plain `ln -sf`, so every file here is a real, readable config,
not a template.

## Setup on a new machine

```sh
git clone git@github.com:amarantedaniel/dotfiles.git
cd dotfiles
./install.sh
```

`install.sh` will, in order:

1. Install oh-my-zsh plus the zsh-syntax-highlighting, zsh-autosuggestions,
   and powerlevel10k plugins/theme
2. Install Homebrew if missing, then `brew bundle` from the `Brewfile`
3. Symlink every tracked config into place (see table below)
4. Open the iTerm color scheme so it can be imported — iTerm doesn't let this
   happen non-interactively, so confirm the import dialog manually
5. `chsh` into zsh if it isn't already the login shell (will prompt for your
   password)

## What's tracked

| Directory | Symlinked to | Configures |
|---|---|---|
| `git/` | `~/.gitconfig`, `~/.gitignore_global` | Git aliases, pager, LFS filter, global ignores |
| `vim/` | `~/.vimrc` | Vim defaults |
| `zsh/` | `~/.zshrc`, `~/.zshenv` | Shell config — see below for the split |
| `vscode/` | `~/Library/Application Support/Code/User/settings.json` | VS Code settings |
| `iterm/` | *(opened, not symlinked)* | iTerm2 Everforest color scheme |
| `ghostty/` | `~/.config/ghostty/config` | Ghostty terminal config, same Everforest theme |
| `gh/` | `~/.config/gh/config.yml` | GitHub CLI settings (no auth — that stays untracked) |
| `mise/` | `~/.config/mise/config.toml` | Global language version defaults (ruby/node/python) |
| `agents/` | `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md` | Global coding-agent preferences |

## Shell startup order

zsh sources `.zshenv` for *every* invocation — interactive shells, scripts,
and non-interactive subshells (editor integrations, LSPs, etc.) — but only
sources `.zshrc` for interactive ones. To keep tools working consistently
everywhere:

- **`.zshenv`**: anything PATH- or environment-related that should be visible
  even outside an interactive terminal (base `PATH`, Android SDK vars, cargo env)
- **`.zshrc`**: interactive-only concerns — oh-my-zsh, the prompt, aliases,
  shell functions, and `mise activate` (mise hooks the prompt to switch
  versions per-directory, so it belongs here, not in `.zshenv`). The
  `~/.local/bin` PATH entry also lives here rather than `.zshenv`, on purpose:
  mise needs to be the last PATH modification in whichever file activates it,
  otherwise its shims lose precedence (see `mise doctor`'s own warning about this).

## Language versions

Managed by [mise](https://mise.jdx.dev/) — one tool instead of separate
rbenv/pyenv/nvm/asdf. It reads both `.tool-versions` (asdf format) and legacy
per-tool files (`.ruby-version`, `.nvmrc`, `.python-version`) in any project,
falling back to the global versions in `mise/config.toml` otherwise.
