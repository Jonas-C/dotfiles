local map = vim.keymap.set
map("", "<C-j>", "5j", { desc = "Go down five lines" })
map("", "<C-k>", "5k", { desc = "Go up five lines" })
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map({ "n", "i" }, "<A-s>", "<cmd>w<CR>", { desc = "Save", silent = true })
map({ "n", "i" }, "<D-s>", "<cmd>w<CR>", { desc = "Save", silent = true })
map("n", "<leader>gd", "<cmd>G toggle_deleted<cr>", { desc = "Toggle deleted lines" })
map("n", "<leader>gw", "<cmd>G toggle_word_diff<cr>", { desc = "Toggle word diff" })
map("n", "<leader>gp", "<cmd>G preview_hunk_inline<cr>", { desc = "Preview hunk changes" })
map("n", "<leader>gn", "<cmd>G next_hunk<cr>", { desc = "Go to next hunk" })
map("n", "<leader>ga", "<cmd>G stage_hunk<cr>", { desc = "Go to next hunk" })
map("n", "<leader>grh", "<cmd>G reset_hunk<cr>", { desc = "Go to next hunk" })
map("n", "<leader>grb", "<cmd>G reset_buffer<cr>", { desc = "Go to next hunk" })
map("n", "<leader>gl", "<cmd>G blame_line<cr>", { desc = "Show blame line" })
map("n", "<leader>gpi", "<cmd>PackageInfoShowForce<cr>", { desc = "Show newer package versions", silent = true })

map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy", silent = true })
map("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason", silent = true })

-- harpoon
map("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end, { desc = "Add a file to Harpoon", silent = true })

map("n", "<leader>h", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Show Harpoon marks", silent = true })

map("n", "<leader>n", function()
	require("harpoon.ui").nav_next()
end, { desc = "Go to previous Harpoon mark", silent = true })

map("n", "<leader>p", function()
	require("harpoon.ui").nav_next()
end, { desc = "Go to previous Harpoon mark", silent = true })

-- Down is really the next line
map("n", "j", "gj")
map("n", "k", "gk")

-- Resize window using <ctrl> arrow keys
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Center screen after jumping to next search result
-- Not sure if I love this just yet.
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Move to the end of yanked text after yank and paste
map("n", "p", "p`]")
map("v", "y", "y`]")
map("v", "p", "p`]")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "p", '"_dP')

vim.cmd("cabb Wq wq")
vim.cmd("cabb Qa qa")
vim.cmd("cabb WQ wq")
vim.cmd("cabb QA qa")
vim.cmd("cabb QA1 qa!")
vim.cmd("cabb Qa1 qa!")
vim.cmd("cabb qa1 qa!")
