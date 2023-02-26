local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
    print("ERROR: Obsidian plugin")
	return 
end

obsidian.setup{
	dir = function ()
		if vim.loop.os_uname().sysname == "Windows" then
			return "~/Documents/Jesus-Vault/"
		else
			return "~/Projects/Obsidian-Vault/"
		end
	end

}
