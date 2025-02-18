vim.g.mapleader = " "

local telescope = require("telescope.builtin")

-- Keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move things arround
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-1<CR>gv=gv")

vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)

-- telescope
vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
vim.keymap.set("n", "<C-p>", telescope.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("n", "<leader>pd", telescope.git_branches, {})
vim.keymap.set("n", "<leader>pa", telescope.git_commits, {})
vim.keymap.set("n", "<leader>pq", telescope.git_stash, {})

-- fugitive
vim.keymap.set("n", "<leader>gf", vim.cmd.Git)
vim.keymap.set("n", "<leader>gd", function ()
    vim.cmd("Gdiff")
end)
vim.keymap.set("n", "<leader>ga", function ()
    local message = vim.fn.input("Message > ")
    vim.cmd("Git commit -am \"" .. message .. "\"")
end)

-- terminal
vim.keymap.set("n", "<leader>tl", "<Cmd>terminal<CR>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>to", "<Cmd>bd!<CR>")

-- clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>gp", "\"+p")
vim.keymap.set("v", "<leader>gp", "\"+p")
vim.keymap.set("n", "<leader>gP", "\"+P")

-- replace
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- split windows
vim.keymap.set("n", "<leader>sv", vim.cmd.sv)
vim.keymap.set("n", "<leader>sh", vim.cmd.vs)
vim.keymap.set("n", "<leader>sx", vim.cmd.q)

-- resize
vim.keymap.set("n", "<leader>sp", "<C-w>+<CR>")
vim.keymap.set("n", "<leader>so", "<C-w>-<CR>")
vim.keymap.set("n", "<leader>sl", "<C-w>><CR>")
vim.keymap.set("n", "<leader>sj", "<C-w><<CR>")
vim.keymap.set("n", "<leader>sg", "<C-w>=<CR>")

-- close
vim.keymap.set("n", "<leader>sn", "<C-w>_<CR>")
vim.keymap.set("n", "<leader>sc", "<C-w>o<CR>")

-- Move
-- vim.keymap.set("n", "<C-S-H>", "<C-w>H<CR>")
-- vim.keymap.set("n", "<C-S-J>", "<C-w>J<CR>")
-- vim.keymap.set("n", "<C-S-K>", "<C-w>K<CR>")
-- vim.keymap.set("n", "<C-S-L>", "<C-w>L<CR>")

-- tabs
vim.keymap.set("n", "<leader>tp", vim.cmd.BufferPrevious)
vim.keymap.set("n", "<leader>tn", vim.cmd.BufferNext)
vim.keymap.set("n", "<leader>tx", vim.cmd.BufferClose)
vim.keymap.set("n", "<leader>tr", vim.cmd.BufferRestore)

vim.keymap.set("n", "<leader>t1", "<Cmd>BufferGoto 1<CR>")
vim.keymap.set("n", "<leader>t2", "<Cmd>BufferGoto 2<CR>")
vim.keymap.set("n", "<leader>t3", "<Cmd>BufferGoto 3<CR>")
vim.keymap.set("n", "<leader>t4", "<Cmd>BufferGoto 4<CR>")
vim.keymap.set("n", "<leader>t5", "<Cmd>BufferGoto 5<CR>")
vim.keymap.set("n", "<leader>t6", "<Cmd>BufferGoto 6<CR>")
vim.keymap.set("n", "<leader>t7", "<Cmd>BufferGoto 7<CR>")
vim.keymap.set("n", "<leader>t8", "<Cmd>BufferGoto 8<CR>")
vim.keymap.set("n", "<leader>t9", "<Cmd>BufferGoto 9<CR>")
vim.keymap.set("n", "<leader>t0", "<Cmd>BufferLast<CR>")

-- rest
vim.keymap.set("n", "<leader>gr", "<Plug>RestNvim")

-- web-tools
vim.keymap.set("n", "<leader>rs", "<cmd>BrowserSync<CR>")
vim.keymap.set("n", "<leader>rt", "<cmd>BrowserStop<CR>")
vim.keymap.set("n", "<leader>rp", "<cmd>BrowserPreview<CR>")

