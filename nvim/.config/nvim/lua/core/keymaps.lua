local keymap = vim.keymap.set
keymap("", "<C-j>", "5j", { desc = "Go down five lines" })
keymap("", "<C-k>", "5k", { desc = "Go up five lines" })
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
keymap({ "n", "i" }, "<A-s>", "<cmd>w<CR>", { desc = "Save", silent = true })
keymap("n", "<leader>gd", "<cmd>G toggle_deleted<cr>", { desc = "Toggle deleted lines" })
keymap("n", "<leader>gw", "<cmd>G toggle_word_diff<cr>", { desc = "Toggle word diff" })
keymap("n", "<leader>gp", "<cmd>G preview_hunk_inline<cr>", { desc = "Preview hunk changes" })
keymap("n", "<leader>gn", "<cmd>G next_hunk<cr>", { desc = "Go to next hunk" })
keymap("n", "<leader>ga", "<cmd>G stage_hunk<cr>", { desc = "Go to next hunk" })
keymap("n", "<leader>gr", "<cmd>G reset_hunk<cr>", { desc = "Go to next hunk" })
keymap("n", "<leader>gpi", "<cmd>PackageInfoShowForce<cr>", { desc = "Show newer package versions", silent = true })

-- harpoon
keymap("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end, { desc = "Add a file to Harpoon", silent = true })

keymap("n", "<leader>h", "<cmd>Telescope harpoon marks<cr>", { desc = "Show Harpoon marks", silent = true })
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

-- Center screen after jumping to next search result
-- Not sure if I love this just yet.
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Move to the end of yanked text after yank and paste
vim.keymap.set("n", "p", "p`]")
vim.keymap.set("v", "y", "y`]")
vim.keymap.set("v", "p", "p`]")

vim.cmd("cabb Wq wq")
vim.cmd("cabb Qa qa")
vim.cmd("cabb WQ wq")
vim.cmd("cabb QA qa")
vim.cmd("cabb QA1 qa!")
vim.cmd("cabb Qa1 qa!")
vim.cmd("cabb qa1 qa!")
