local keymap = vim.keymap.set
keymap("", "<C-j>", "5j", { desc = "Go down five lines" })
keymap("", "<C-k>", "5k", { desc = "Go up five lines" })
keymap("n", "<esc><esc>", ":noh<CR>", { desc = "Remove highlights", silent = true })
keymap({ "n", "i" }, "<A-s>", "<cmd>w<CR>", { desc = "Save", silent = true })

vim.cmd("cabb Wq wq")
vim.cmd("cabb Qa qa")
vim.cmd("cabb WQ wq")
vim.cmd("cabb QA qa")
vim.cmd("cabb QA1 qa!")
vim.cmd("cabb Qa1 qa!")
vim.cmd("cabb qa1 qa!")
