# Powerlevel10k configuration
# Generated for a lean, informative prompt
# To customize, run `p10k configure` or edit this file

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Prompt segments - left side
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon                 # OS identifier
    dir                     # Current directory
    vcs                     # Git status
    prompt_char             # Prompt symbol
  )

  # Prompt segments - right side
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # Exit code of last command
    command_execution_time  # Duration of last command
    background_jobs         # Background jobs indicator
    direnv                  # direnv status
    asdf                    # asdf version manager
    nvm                     # Node.js version from nvm
    node_version            # Node.js version
    ruby_version            # Ruby version
    rbenv                   # Ruby version from rbenv
    rvm                     # Ruby version from rvm
    fvm                     # Flutter version
    virtualenv              # Python virtualenv
    pyenv                   # Python version from pyenv
    goenv                   # Go version
    nodenv                  # Node.js version from nodenv
    rust_version            # Rust version
    swift_version           # Swift version
    xcode_version           # Xcode version
    context                 # user@hostname
    time                    # Current time
  )

  # Basic style
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  # Prompt character
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=76
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=196
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true

  # Directory
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=31
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=103
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=39
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80

  # Git/VCS settings
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=76
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=178
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=244
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'

  # Git status icons
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1
  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=76
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  # Command execution time
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=101
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

  # Background jobs
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=70
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='⇣'

  # Status (exit code)
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=196

  # Node.js version
  typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=70
  typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
  typeset -g POWERLEVEL9K_NVM_FOREGROUND=70

  # Ruby version
  typeset -g POWERLEVEL9K_RUBY_VERSION_FOREGROUND=168
  typeset -g POWERLEVEL9K_RUBY_VERSION_PROJECT_ONLY=true
  typeset -g POWERLEVEL9K_RBENV_FOREGROUND=168
  typeset -g POWERLEVEL9K_RVM_FOREGROUND=168

  # Swift version
  typeset -g POWERLEVEL9K_SWIFT_VERSION_FOREGROUND=208
  typeset -g POWERLEVEL9K_SWIFT_VERSION_PROJECT_ONLY=true

  # Xcode version
  typeset -g POWERLEVEL9K_XCODE_VERSION_FOREGROUND=32

  # Python virtualenv
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=37
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_PYENV_FOREGROUND=37

  # Rust version
  typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND=208
  typeset -g POWERLEVEL9K_RUST_VERSION_PROJECT_ONLY=true

  # Go version
  typeset -g POWERLEVEL9K_GOENV_FOREGROUND=37

  # Context (user@host)
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=178
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=180
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
  typeset -g POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND=180
  typeset -g POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND=178

  # Time
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=66
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

  # OS icon
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=212

  # Transient prompt (minimal prompt after command execution)
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

  # Instant prompt mode (faster startup)
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  # Hot reload config changes
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=false

  # Separator style
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

  (( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
  'builtin' 'unset' 'p10k_config_opts'
}
