# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Enable Powerlevel10k instant prompt for faster shell startup
# Must be near the top of ~/.zshrc, before any console output
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
# Using Powerlevel10k for a modern, feature-rich prompt
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Plugins organized by category:
# - Core: git, git-extras, github
# - Node.js: node, nvm, yarn, npm
# - Ruby: ruby, rails, rbenv, rvm, gem, bundler, rake
# - Mobile: react-native, pod, xcode, swiftpm
# - Containers: docker, docker-compose
# - Cloud: gcloud
# - Languages: rust
plugins=(
  # Git & Version Control
  git
  git-extras
  github

  # Node.js & JavaScript
  node
  nvm
  yarn
  npm

  # Ruby & Rails
  ruby
  rails
  rbenv
  rvm
  gem
  bundler
  rake

  # Mobile Development (iOS & React Native)
  react-native
  pod
  xcode
  swiftpm

  # Containers
  docker
  docker-compose

  # Cloud & Infrastructure
  gcloud

  # Other Languages
  rust
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#===============================================================================
# Environment & Platform Setup
#===============================================================================
# Shopify dev environment
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

#===============================================================================
# Nix Package Manager (Primary)
#===============================================================================
# Nix is preferred over Homebrew for reproducible package management
# Single-user installation
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh
fi
# Multi-user installation (NixOS, nix-darwin)
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# Home Manager (for managing user configuration with Nix)
if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi

# Nix flakes and experimental features
export NIX_CONFIG="experimental-features = nix-command flakes"

# Useful Nix aliases
alias nix-search='nix search nixpkgs'
alias nix-shell-pure='nix-shell --pure'
alias nix-update='nix-channel --update && nix-env -u'
alias nix-gc='nix-collect-garbage -d'
alias nix-list='nix-env -q'

# direnv for per-project Nix environments (nix-direnv)
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

#===============================================================================
# Homebrew (Fallback for macOS-specific tools)
#===============================================================================
# Only used when Nix doesn't have a package or for macOS-specific tools
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

#===============================================================================
# Node.js & JavaScript Development
#===============================================================================
# NVM (Node Version Manager) - lazy loading for faster shell startup
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun - fast JavaScript runtime and package manager
export BUN_INSTALL="$HOME/.bun"
[ -d "$BUN_INSTALL" ] && export PATH="$BUN_INSTALL/bin:$PATH"
# Bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# pnpm - fast, disk space efficient package manager
export PNPM_HOME="$HOME/.local/share/pnpm"
[ -d "$PNPM_HOME" ] && export PATH="$PNPM_HOME:$PATH"

# npm global packages
[ -d "$HOME/.npm-global/bin" ] && export PATH="$HOME/.npm-global/bin:$PATH"

# Yarn global packages
[ -d "$HOME/.yarn/bin" ] && export PATH="$HOME/.yarn/bin:$PATH"
[ -d "$HOME/.config/yarn/global/node_modules/.bin" ] && export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#===============================================================================
# Ruby Development
#===============================================================================
# rbenv initialization
if command -v rbenv &> /dev/null; then
  eval "$(rbenv init - zsh)"
fi

# chruby support (Shopify dev)
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

# Ruby gems user installation path
if command -v ruby &> /dev/null && command -v gem &> /dev/null; then
  GEM_USER_DIR="$(ruby -e 'puts Gem.user_dir' 2>/dev/null)/bin"
  [ -d "$GEM_USER_DIR" ] && export PATH="$GEM_USER_DIR:$PATH"
fi

#===============================================================================
# iOS & Swift Development
#===============================================================================
# Xcode command line tools
if [ -d "/Applications/Xcode.app" ]; then
  export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
fi

# Swift Package Manager
[ -d "$HOME/.swiftpm/bin" ] && export PATH="$HOME/.swiftpm/bin:$PATH"

# Mint (Swift package manager for command line tools)
[ -d "$HOME/.mint/bin" ] && export PATH="$HOME/.mint/bin:$PATH"

# fastlane
[ -d "$HOME/.fastlane/bin" ] && export PATH="$HOME/.fastlane/bin:$PATH"

# CocoaPods cache optimization
export CP_HOME_DIR="$HOME/.cocoapods"

# iOS Simulator helper aliases
alias ios-sim='open -a Simulator'
alias ios-devices='xcrun simctl list devices'
alias ios-booted='xcrun simctl list devices | grep Booted'

#===============================================================================
# React Native Development
#===============================================================================
# Android SDK (for React Native)
export ANDROID_HOME="$HOME/Library/Android/sdk"
if [ -d "$ANDROID_HOME" ]; then
  export PATH="$ANDROID_HOME/emulator:$PATH"
  export PATH="$ANDROID_HOME/platform-tools:$PATH"
  export PATH="$ANDROID_HOME/tools:$PATH"
  export PATH="$ANDROID_HOME/tools/bin:$PATH"
fi

# React Native CLI aliases
alias rn='npx react-native'
alias rn-ios='npx react-native run-ios'
alias rn-android='npx react-native run-android'
alias rn-start='npx react-native start'
alias rn-clean='cd ios && pod deintegrate && pod install && cd .. && npx react-native start --reset-cache'

# Expo CLI (if using Expo)
alias expo-start='npx expo start'

# Watchman (for React Native file watching)
export WATCHMAN_QUERY_TIMEOUT=30

#===============================================================================
# Graphite CLI Completions
#===============================================================================
# Enable Graphite (gt) shell completions if installed
if command -v gt &> /dev/null; then
  eval "$(gt completion)"
fi

#===============================================================================
# Powerlevel10k Configuration
#===============================================================================
# Load Powerlevel10k config file
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

