-- highlight and move whole block up or down with J K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected block up one line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected block down one line" })

-- append line below to the end of this line with a space but leave the cursor
vim.keymap.set("n", "J", "mzJ`z", { desc = "Append the line below to the current line" })
-- jump half a page up or down leaving the curser centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move view down half a page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move view up half a page" })
-- next/prev search match but in center of screen
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev match" })

-- paste but putting the replacement into the void register
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste without replacing the register" })

-- yank to the system clipboard rather than internal vim
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank to clipboard" })

-- delete into void register
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete without replacing the register" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete without replacing the register" })

-- format entire buffer?
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { desc = "Format entire buffer" })

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev location list" })

-- quick replace
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Quick replace word under cursor (Uses current word)" })
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Quick replace word under cursor (Empty replace)" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

vim.keymap.set("n", "<A-o>", vim.cmd.ClangdSwitchSourceHeader, { desc = "Switch source/header" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make window splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split window" })

-- vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>ee", "<cmd>Oil<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Toggle git window" })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle the undo tree" })

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
