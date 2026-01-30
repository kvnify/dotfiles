# Claude Code Project Context

This file provides context for Claude Code when working on projects.

## Development Environment

- **Package Manager**: Prefer Nix for reproducible environments, fallback to Homebrew for macOS-specific tools
- **Shell**: Zsh with Oh-My-Zsh and Powerlevel10k theme
- **Editor**: Vim with vim-plug, CoC.nvim for LSP support

## Languages & Frameworks

### Node.js / JavaScript / TypeScript
- Use **Bun** for new projects when possible (faster runtime)
- Use **pnpm** or **yarn** over npm for package management
- Follow ESLint + Prettier configurations
- Prefer TypeScript for type safety

### Ruby
- Use **rbenv** for version management
- Follow RuboCop style guidelines
- Use Bundler for dependency management

### iOS / Swift
- Use Swift Package Manager when possible
- Follow SwiftLint guidelines
- Use fastlane for automation

### React / React Native
- Use functional components with hooks
- Prefer TypeScript
- Use React Navigation for navigation

## Git Workflow

- Use **Graphite** (gt) for stacked PRs
- Keep commits atomic and well-described
- Use conventional commits when appropriate

## Code Style Preferences

- 2-space indentation for JavaScript, TypeScript, Ruby, JSON, YAML
- 4-space indentation for Swift, Go
- Tabs for Go
- Always use trailing commas in multi-line arrays/objects
- Prefer async/await over raw promises
- Use early returns to reduce nesting

## Testing

- Write tests for new features
- Prefer integration tests over unit tests when appropriate
- Use Jest for JavaScript/TypeScript
- Use RSpec for Ruby
- Use XCTest for Swift

## Documentation

- Document public APIs
- Keep README files up to date
- Use JSDoc/TSDoc for TypeScript
- Use YARD for Ruby
