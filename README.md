# neovim-config
Configuration for Neovim editor

Based on this [LunarVim](https://github.com/LunarVim) [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) repository

# Keybindings
List of all costum keybindings.
The <kbd>Leader</kbd> key for me is the <kbd>Space</kbd> key 

## Normal mode
### Text editing commands
* <kbd>Alt</kbd> + <kbd>k</kbd>: Move current line up
* <kbd>Alt</kbd> + <kbd>j</kbd>: Move current line down
* <kbd>g</kbd> + <kbd>c</kbd> + <kbd>c</kbd>:Comment current line using linewise comment ([numToStr/Comment.nvim][comments_plugin] plugin)
* <kbd>g</kbd> + <kbd>b</kbd> + <kbd>c</kbd>:Comment current line using blockwise comment ([numToStr/Comment.nvim][comments_plugin] plugin)
### Movement commands
* <kbd>g</kbd> + <kbd>g</kbd>: Go to the bottom of the file
* <kbd>G</kbd> (or  <kbd>⇧ Shift</kbd> + <kbd>g</kbd>): Go to the end of the file
* <kbd>⇧ Shift</kbd> + <kbd>h</kbd>: Move to previous tab
* <kbd>⇧ Shift</kbd> + <kbd>l</kbd>: Move to next tab
### Change mode
* <kbd>i</kbd> (or <kbd>a</kbd>): Enter in insert mode
* <kbd>v</kbd>: Enter visual character mode
* <kbd>V</kbd> (or <kbd>⇧ Shift</kbd> + <kbd>v</kbd>): Enter visual line mode
* <kbd>ctrl</kbd> + <kbd>q</kbd>: Enter visual block mode

## Insert
<kbd>j</kbd> + <kbd>k</kbd>: shortcut to normal mode

## Visual
* <kbd>></kbd>: indent
* <kbd><</kbd>: unindent
* <kbd>Alt</kbd> + <kbd>k</kbd>: Move selected line(s) up
* <kbd>Alt</kbd> + <kbd>j</kbd>: Move selected line(s) down
* <kbd>g</kbd> + <kbd>c</kbd> :Comment current selection using linewise comment ([numToStr/Comment.nvim][comments_plugin] plugin)
* <kbd>g</kbd> + <kbd>b</kbd> :Comment current selection using blockwise comment ([numToStr/Comment.nvim][comments_plugin] plugin)


## Telescope
* <kbd>Leader</kbd> + <kbd>f</kbd>: Search between files with default telescope
* <kbd>Leader</kbd> + <kbd>F</kbd> (or <kbd>Leader</kbd> + <kbd>⇧ Shift</kbd> + <kbd>f</kbd>): Search between files ([telescope-file-browser][telescope-file-browser] plugin)
* <kbd>ctrl</kbd> + <kbd>t</kbd>: Live grep search (i.e. search in text inside files)
* <kbd>d</kbd> (or  <kbd>Alt</kbd> + <kbd>d</kbd>): remove selected file ([telescope-file-browser][telescope-file-browser] plugin)
* <kbd>c</kbd> (or  <kbd>Alt</kbd> + <kbd>c</kbd>): create file in current location ([telescope-file-browser][telescope-file-browser] plugin)


# Stuff to install
Note sure aboout this... put here as a reminder

* [pyright](https://github.com/microsoft/pyright)
* [python language server](https://github.com/python-lsp/python-lsp-server)
* [grammarly-languageserver](https://github.com/znck/grammarly)
* [lazygit](https://github.com/jesseduffield/lazygit)

```
conda install pyright
pip install python-language-server
npm i -g grammarly-languageserver

conda install -c conda-forge lazygit
choco install lazygit
```

[telescope-file-browser]:https://github.com/nvim-telescope/telescope-file-browser.nvim
[comments_plugin]:https://github.com/numToStr/Comment.nvim
