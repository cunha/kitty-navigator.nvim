-- adapted from https://github.com/MunsMan/kitty-navigator.nvim

local M = {}

local mappings = { h = "left", j = "bottom", k = "top", l = "right" }

function M.navigate(direction)
	local left_win = vim.fn.winnr("1" .. direction)
	if vim.fn.winnr() ~= left_win then
		vim.api.nvim_command("wincmd " .. direction)
	else
		local command = "kitten @ action neighboring_window " .. mappings[direction]
		vim.fn.system(command)
	end
end

function M.navigateLeft()
	M.navigate("h")
end

function M.navigateRight()
	M.navigate("l")
end
function M.navigateUp()
	M.navigate("k")
end
function M.navigateDown()
	M.navigate("j")
end

---@param options Options
function M.setup(options)
	vim.keymap.set("n", options.keybindings.left or "<D-h>", M.navigateLeft, { silent = true })
	vim.keymap.set("n", options.keybindings.right or "<D-l>", M.navigateRight, { silent = true })
	vim.keymap.set("n", options.keybindings.up or "<D-k>", M.navigateUp, { silent = true })
	vim.keymap.set("n", options.keybindings.down or "<D-j>", M.navigateDown, { silent = true })
end

vim.fn.system("kitten @ set-user-vars ISNVIM=true")

vim.api.nvim_create_autocmd("VimLeavePre", {
	desc = "Clear ISNVIM user var on leave",
	group = vim.api.nvim_create_augroup("unset-isnvim-user-var", { clear = true }),
	pattern = "*",
	callback = function()
		vim.fn.system("kitten @ set-user-vars ISNVIM=false")
	end,
})

return M
