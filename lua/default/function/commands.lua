-- This file contains custom commands for the function that I wrote

--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]
-- Snippet

vim.api.nvim_create_user_command("SnippetTorchClass", function(args) snippet_torch_class(args[1]) end, {})

--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]
-- Other function

vim.api.nvim_create_user_command("CheckParser", function() check_parser() end, {})

vim.api.nvim_create_user_command("ReloadConfig", function()
  for name,_ in pairs(package.loaded) do
    if name:match('^default') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end, {})
