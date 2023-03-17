# neovim-config
Pure lua Configuration for Neovim editor

Based on [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) from [LunarVim](https://github.com/LunarVim).

![Start screen](./other/screenshot/nvim_1.png) |  ![Edit File](./other/screenshot/nvim_2.png)
:-------------------------:|:-------------------------:
![telescope](./other/screenshot/nvim_3.png) |  

# Keybindings
A file containig the major part of keybindings can be find [here](other/keybindings.md)

# Stuff to install
Put here as a reminder

## Fix for bugs
* If treesitter raise the error `query error: invalid node type at position` use the command `:echo nvim_get_runtime_file('parser', v:true)` in neovim console. If more that one path appear remove/rename all the folder not related with treesitter.

## LSP stuff

* [pyright](https://github.com/microsoft/pyright)
  ```
  conda install pyright
  ```
  or
  ```
  npm install -g pyright
  ```
* [grammarly-languageserver](https://github.com/znck/grammarly) (Only install... never used)
  ```
  npm i -g grammarly-languageserver
  ```
* [lazygit](https://github.com/jesseduffield/lazygit)
  ```
  conda install -c conda-forge lazygit
  ```
  or (only for windows)
  ```
  choco install lazygit
  ```
* [tsserver](https://github.com/typescript-language-server/typescript-language-server)
  ```
  npm install -g typescript typescript-language-server
  ```
* [html-lsp](https://github.com/hrsh7th/vscode-langservers-extracted)
  ```
  npm i -g vscode-langservers-extracted
  ```
* [css-lsp](https://github.com/hrsh7th/vscode-langservers-extracted)
  ```
  npm i -g vscode-langservers-extracted
  ```


[telescope-file-browser]:https://github.com/nvim-telescope/telescope-file-browser.nvim
[comments_plugin]:https://github.com/numToStr/Comment.nvim
