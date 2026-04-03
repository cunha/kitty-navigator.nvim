# kitty-navigator.nvim

Navigate between Kitty and Neovim panes transparently

This implementation mimics the mode of operation of [knubie/vim-kitty-navigator](https://github.com/knubie/vim-kitty-navigator) in a Lua script based on [MunsMan/kitty-navigator.nvim](https://github.com/MunsMan/kitty-navigator.nvim).

Install with Lazy:

```lua

```

And then update your `.config/kitty/kitty.conf` file to include (adjust the keys according to your preference):

```text
map kitty_mod+h neighboring_window left
map kitty_mod+l neighboring_window right
map kitty_mod+j neighboring_window down
map kitty_mod+k neighboring_window up
map --when-focus-on var:ISNVIM kitty_mod+j
map --when-focus-on var:ISNVIM kitty_mod+k
map --when-focus-on var:ISNVIM kitty_mod+h
map --when-focus-on var:ISNVIM kitty_mod+l
```

