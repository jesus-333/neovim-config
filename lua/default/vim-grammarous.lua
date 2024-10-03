-- Workaround for a breaking change in LanguageTool (found on Github)
-- In my config it cause bug and I had to completely reinstall neovim
-- You can achieve the same results downloading the zip from the website and manually change the file in the plugin folder
vim.g["grammarous#jar_url"] = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'
