# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

VS Code color theme extension porting the `color-theme-gnome2` from Emacs color-theme.el package. This is a dark theme with a distinctive dark slate gray background (#2F4F4F) and wheat foreground (#F5DEB3), featuring aquamarine (#7FFFD4) accents.

## Commands

### Development and Testing
- **Test theme locally**: Press F5 in VS Code (uses `.vscode/launch.json` "Extension" configuration) to launch Extension Development Host
- **Preview changes**: After editing `themes/gnome2like.json`, reload the Extension Development Host window (Cmd+R / Ctrl+R)

### Publishing
- `npm run pack` - Create .vsix package file (used in CI)
- `npm run publish` - Publish to VS Code Marketplace (requires login)
- `npm run login` - Login to vsce publisher account

### CI/CD
- GitHub Actions runs `npm ci && npm run pack` on push/PR to main branch
- Build workflow validates the extension can be packaged successfully

## Architecture

### File Structure
```
/themes/gnome2like.json  - Main theme definition file (VS Code color theme schema)
/resources/              - Original Emacs color-theme.el source files for reference
/icon.png                - Extension icon (dark slate gray #2F4F4F theme)
/package.json            - Extension manifest and metadata
/.vscode/launch.json     - Debug configuration for testing extension
```

### Theme Definition Structure

The theme file (`themes/gnome2like.json`) is organized into three main sections:

1. **colors** - Workbench UI colors (editor, sidebar, terminal, status bar, etc.)
2. **tokenColors** - Syntax highlighting rules using TextMate scopes
3. **semanticTokenColors** - Semantic token overrides for languages with LSP support

#### Color Palette Philosophy
- Base colors derive from the original Emacs gnome2 theme
- UI colors use dark slate gray (#2F4F4F) backgrounds with wheat (#F5DEB3) text
- Accent color is dark cyan (#008B8B) for selections, highlights, and interactive elements
- Syntax colors are bright and saturated for high contrast on dark background
- Terminal colors include all 16 standard ANSI colors (8 standard + 8 bright variants)

## Theme Development Guidelines

### Color Modifications
- Maintain the original gnome2 aesthetic when making changes
- Use hex color format (#RRGGBB) throughout
- Group related UI colors logically (e.g., all editor* colors together)
- Ensure sufficient contrast ratio for accessibility (WCAG AA minimum)

### Syntax Highlighting
- Group tokenColors by functionality, not by language (language-agnostic approach)
- Key color assignments:
  - Comments: #ADD8E6 (light blue)
  - Strings: #FFA07A (salmon)
  - String interpolation: #98FB98 (pale green)
  - Keywords/operators: #FA8072 (salmon red)
  - Variables/properties: #7FFFD4 (aquamarine)
  - Functions/methods: #98FB98 (pale green)
  - Types/classes: #9ACD32 (yellow green)
- Avoid italic font styles; prefer bold or color distinction
- Use bold red (#FF0000) for potentially unsafe code (e.g., unsafe blocks in Rust)

### Terminal Colors
- All 16 ANSI colors must be defined (terminal.ansiBlack through terminal.ansiBrightWhite)
- Keep terminal colors consistent with the editor palette
- Ensure bright variants have sufficient contrast with terminal background

## Reference

- **Original source**: color-theme-gnome2 from Emacs color-theme.el package
- **License**: GPL-3.0 (derivative work)
- **VS Code Theme Guide**: https://code.visualstudio.com/api/extension-guides/color-theme
- **Color Theme Schema**: Uses vscode://schemas/color-theme
