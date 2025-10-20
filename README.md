# 🌲 firewatch.nvim

A Neovim colorscheme inspired by the [Ghostty Firewatch theme](https://github.com/mbadolato/iTerm2-Color-Schemes).

Warm, muted colors perfect for long coding sessions.

## Features

- Full Treesitter support
- LSP diagnostic colors
- Clean, minimal UI highlighting
- Dark background with warm accent colors
  = ejzad

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'kubemancer/firewatch.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('firewatch')
  end
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'kubemancer/firewatch.nvim',
  config = function()
    vim.cmd.colorscheme('firewatch')
  end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kubemancer/firewatch.nvim'
```

Then in your config:

```lua
vim.cmd.colorscheme('firewatch')
```

## Usage

After installation, activate with:

```lua
vim.cmd.colorscheme('firewatch')
```

Or use the setup function directly:

```lua
require('firewatch').setup()
```

### Transparency

Enable transparent background:

```lua
require('firewatch').setup({
  transparent = true
})
```

Or with lazy.nvim:

```lua
{
  'kubemancer/firewatch.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true
  },
  config = function(_, opts)
    require('firewatch').setup(opts)
  end
}
```

## Color Palette

| Color      | Hex       | Usage                   |
| ---------- | --------- | ----------------------- |
| Background | `#1e2027` | Editor background       |
| Foreground | `#9ba2b2` | Default text            |
| Red        | `#d95360` | Keywords, errors        |
| Green      | `#5ab977` | Strings                 |
| Yellow     | `#dfb563` | Types, warnings         |
| Blue       | `#4d89c4` | Functions               |
| Magenta    | `#d55119` | Constants, numbers      |
| Cyan       | `#44a8b6` | Operators, preprocessor |

## Credits

Based on the Firewatch terminal theme from [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes).

## License

MIT
