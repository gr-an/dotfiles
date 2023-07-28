vim.g.mapleader = " "
-- Open this dir 
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Global remaps 
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
