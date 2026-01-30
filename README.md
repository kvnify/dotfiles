# dotfiles

Personal development environment configuration for macOS/Linux with a focus on Node.js, Ruby, Swift/iOS, and React Native development.

## Quick Start

```bash
git clone https://github.com/kvnify/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

Then restart your shell or run `source ~/.zshrc`.

## What's Included

| Config | Description |
|--------|-------------|
| `zshrc` | Zsh configuration with Oh-My-Zsh and Powerlevel10k |
| `vimrc` | Modern Vim setup with vim-plug, LSP, and fuzzy finding |
| `gitconfig` | Git aliases and settings |
| `gitignore_global` | Global gitignore patterns |
| `p10k.zsh` | Powerlevel10k theme configuration |
| `claude/` | Claude Code AI assistant configuration |

## Shell (Zsh + Powerlevel10k)

- **Theme**: [Powerlevel10k](https://github.com/romkatv/powerlevel10k) with instant prompt
- **Framework**: Oh-My-Zsh with curated plugins
- **Package Manager**: Nix-first approach with Homebrew fallback

### Language Version Indicators

The prompt shows version info when you're in a project directory:
- Node.js / Ruby / Swift / Rust / Python / Go

### Key Plugins

```
git, node, nvm, npm, yarn, ruby, rails, rbenv,
react-native, pod, xcode, swiftpm, docker, gcloud
```

## Development Tooling

### Node.js & JavaScript
- NVM with lazy loading for fast shell startup
- Bun runtime and completions
- pnpm support
- npm/yarn global package paths

### Ruby
- rbenv initialization
- chruby support (Shopify dev)
- Bundler/gem paths

### iOS & Swift
- Xcode developer directory
- Swift Package Manager path
- Mint, fastlane, CocoaPods
- Simulator aliases: `ios-sim`, `ios-devices`, `ios-booted`

### React Native
- Android SDK paths
- CLI aliases: `rn`, `rn-ios`, `rn-android`, `rn-start`, `rn-clean`
- Expo support

### Nix
- Single-user and multi-user installation support
- Home Manager integration
- Flakes enabled by default
- direnv for per-project environments
- Aliases: `nix-search`, `nix-gc`, `nix-update`, `nix-list`

## Vim

Modern Vim configuration with:

- **Plugin Manager**: [vim-plug](https://github.com/junegunn/vim-plug) (auto-installs)
- **Fuzzy Finder**: [FZF](https://github.com/junegunn/fzf) (`<C-p>` or `<leader>f`)
- **LSP**: [CoC.nvim](https://github.com/neoclide/coc.nvim) for intelligent completion
- **Linting**: [ALE](https://github.com/dense-analysis/ale) with auto-fix on save

### Language Support

| Language | Syntax | LSP | Linter |
|----------|--------|-----|--------|
| JavaScript/TypeScript | vim-javascript, typescript-vim, vim-jsx-pretty | coc-tsserver | ESLint |
| Ruby | vim-ruby, vim-rails | coc-solargraph | RuboCop |
| Swift | swift.vim | coc-sourcekit | SwiftLint |
| Rust | rust.vim | coc-rust-analyzer | - |
| Go | vim-go | - | - |

### Key Mappings

| Mapping | Action |
|---------|--------|
| `<C-p>` | Find files (FZF) |
| `<leader>r` | Ripgrep search |
| `<leader>b` | Switch buffer |
| `<F9>` | Toggle NERDTree |
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Show documentation |
| `<leader>rn` | Rename symbol |
| `<leader>gs` | Git status |

## Git

### Aliases

```bash
# Basics
git co        # checkout
git br        # branch
git st        # status
git sw        # switch

# Logs
git lg        # pretty graph log
git lol       # oneline with decorations

# Workflow
git wip       # quick WIP commit
git amend     # amend without editing message
git uncommit  # soft reset last commit
git pushf     # push --force-with-lease

# Stash
git ss        # stash save
git sp        # stash pop

# Branch management
git cleanup   # delete merged branches
git recent    # branches sorted by date
git publish   # push and set upstream

# Graphite
git stack     # gt stack
git submit    # gt submit
```

## Claude Code

Pre-configured for [Claude Code](https://claude.ai/code) with:

- **Approved tools**: npm, yarn, bun, git, gh, gt, bundle, rails, swift, nix, docker, and common utilities
- **Project context**: `CLAUDE.md` with coding preferences and style guidelines

## Requirements

- macOS or Linux
- Zsh (default on macOS)
- Git
- curl or wget (for bootstrap)

### Recommended

- [Nerd Font](https://www.nerdfonts.com/) (JetBrains Mono recommended) for icons
- [Nix](https://nixos.org/download.html) for reproducible package management
- [Graphite](https://graphite.dev/) for stacked PRs

## Post-Installation

1. **Install Vim plugins**: Open Vim and run `:PlugInstall`
2. **Install Nerd Font**: Download from [nerdfonts.com](https://www.nerdfonts.com/)
3. **Configure terminal**: Set font to your installed Nerd Font
4. **Customize p10k**: Run `p10k configure` for interactive setup

## Customization

- **Powerlevel10k**: Edit `~/.p10k.zsh` or run `p10k configure`
- **Vim colorscheme**: Change `colorscheme palenight` in vimrc (options: palenight, onedark, catppuccin)
- **Git user**: Update `[user]` section in gitconfig

## License

MIT
