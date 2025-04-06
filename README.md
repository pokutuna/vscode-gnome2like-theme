# vscode-gnome2like-theme

![Gnome2Like Theme](https://raw.githubusercontent.com/pokutuna/vscode-gnome2like-theme/main/images/screenshot.png)


A VS Code color theme based on the `color-theme-gnome2` from Emacs color-theme.el package.  
I added more colors to fit VSCode's requirements while keeping the original theme look and feel.

## Install

Install this theme from the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=pokutuna.vscode-gnome2like-theme).

## Feedback & Development Status

- This theme is still in active development and color definitions may be adjusted over time for better readability and language support.
- Feedback and suggestions are welcome! Please submit your thoughts via GitHub Issues.


## Customization

You can customize the theme colors by modifying your `settings.json`. See the [VS Code documentation](https://code.visualstudio.com/api/extension-guides/color-theme#customizing-a-color-theme) for more details.

<details>
<summary>Examples of theme customization</summary>

```json
// Modify UI element colors using `workbench.colorCustomizations`:
"workbench.colorCustomizations": {
  "[GNOME2-like]": {
      "titleBar.activeBackground": "#ffff00"
  }
},

// Customize syntax highlighting colors for specific token types using `editor.tokenColorCustomizations`:
"editor.tokenColorCustomizations": {
  "[GNOME2-like]": {
      "textMateRules": [
          {
              "scope": [
                  "comment"
              ],
              "settings": {
                  "foreground": "#ffff00"
              }
          }
      ]
  }
},

// For languages with semantic highlighting support, customize colors using `editor.semanticTokenColorCustomizations`:
"editor.semanticTokenColorCustomizations": {
  "[GNOME2-like]": {
    "enabled": true,
    "rules": {
      "string": {
        "foreground": "#ffff00"
      }
    }
  }
}
```
</details>

## License

GPL-3.0. This is a derivative work based on the gnome2 theme from color-theme.el.

### Original color-theme.el authors:

- Copyright (C) 1999-2000 Jonadab the Unsightly One
- Copyright (C) 2000-2003 Alex Schroeder
- Copyright (C) 2003-2006 Xavier Maillard
- Copyright (C) 2019 Drew Adams

Original package: [color-theme.el](https://www.emacswiki.org/emacs/download/color-theme.el)

### This theme authors:
- Copyrights (C) 2025 pokutuna
