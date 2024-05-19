local keymap = vim.keymap.set
keymap("", "<C-j>", "5j", { desc = "Go down five lines" })
keymap("", "<C-k>", "5k", { desc = "Go up five lines" })
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
keymap({ "n", "i" }, "<A-s>", "<cmd>w<CR>", { desc = "Save", silent = true })
keymap({ "n", "i" }, "<D-s>", "<cmd>w<CR>", { desc = "Save", silent = true })
keymap("n", "<leader>gd", "<cmd>G toggle_deleted<cr>", { desc = "Toggle deleted lines" })
keymap("n", "<leader>gw", "<cmd>G toggle_word_diff<cr>", { desc = "Toggle word diff" })
keymap("n", "<leader>gp", "<cmd>G preview_hunk_inline<cr>", { desc = "Preview hunk changes" })
keymap("n", "<leader>gn", "<cmd>G next_hunk<cr>", { desc = "Go to next hunk" })
keymap("n", "<leader>ga", "<cmd>G stage_hunk<cr>", { desc = "Go to next hunk" })
keymap("n", "<leader>grh", "<cmd>G reset_hunk<cr>", { desc = "Go to next hunk" })
keymap("n", "<leader>grb", "<cmd>G reset_buffer<cr>", { desc = "Go to next hunk" })
keymap("n", "<leader>gl", "<cmd>G blame_line<cr>", { desc = "Show blame line" })
keymap("n", "<leader>gpi", "<cmd>PackageInfoShowForce<cr>", { desc = "Show newer package versions", silent = true })

keymap("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy", silent = true })
keymap("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason", silent = true })

-- harpoon
keymap("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end, { desc = "Add a file to Harpoon", silent = true })

keymap("n", "<leader>h", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Show Harpoon marks", silent = true })

keymap("n", "<leader>n", function()
	require("harpoon.ui").nav_next()
end, { desc = "Go to previous Harpoon mark", silent = true })

keymap("n", "<leader>p", function()
	require("harpoon.ui").nav_next()
end, { desc = "Go to previous Harpoon mark", silent = true })

-- Down is really the next line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Center screen after jumping to next search result
-- Not sure if I love this just yet.
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Move to the end of yanked text after yank and paste
vim.keymap.set("n", "p", "p`]")
vim.keymap.set("v", "y", "y`]")
vim.keymap.set("v", "p", "p`]")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
keymap("v", "p", '"_dP')

vim.cmd("cabb Wq wq")
vim.cmd("cabb Qa qa")
vim.cmd("cabb WQ wq")
vim.cmd("cabb QA qa")
vim.cmd("cabb QA1 qa!")
vim.cmd("cabb Qa1 qa!")
vim.cmd("cabb qa1 qa!")
