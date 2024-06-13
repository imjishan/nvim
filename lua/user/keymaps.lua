local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap -- for conciseness

-- important
keymap.set("i", "jk", "<ESC>", {desc = "Exit insert mode with jk"})
keymap.set("n", "vv", "V", {desc = "Type vv to enter visual line mode"})
keymap.set("v", "kk", "<ESC>", {desc = "Exit visual mode with kk"})

-- select all, save and quit
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n","<Leader>w",":update<Return>", opts)
keymap.set("n","<Leader>q",":quit<Return>", opts)
keymap.set("n","<Leader>Q",":qa<Return>", opts)

-- window management
keymap.set("n", "<Leader>sv", "<C-w>v", {desc = "Split window vertically"})
keymap.set("n", "<Leader>sh", "<C-w>s", {desc = "Split window horizontally"})
keymap.set("n", "<Leader>se", "<C-w>=", {desc = "make split equal size"})
keymap.set("n", "<Leader>sx", "<cmd>close<CR>", {desc = "Close current split"})

keymap.set("n", "<Leader>to", "<cmd>tabnew<CR>", {desc = "Open new tab (untitled tab)"})
keymap.set("n", "<Leader>tx", "<cmd>tabclose<CR>", {desc = "Close current tab"})
keymap.set("n", "<Leader>tn", "<cmd>tabn<CR>", {desc = "Go to next tab"})
keymap.set("n", "<Leader>tp", "<cmd>tabp<CR>", {desc = "Go to previous tab"})
keymap.set("n", "<Leader>tt", "<cmd>tabnew %<CR>", {desc = "Open current buffer to new tab"})

-- Highlighting and moving up and down
keymap.set("n", "n", "*zz", {desc = "Select all duplicate word, & move downward"})
keymap.set("n", "m", "#zz", {desc = "Move to next selected word, & move upward"})
keymap.set("n", "<Leader>nm", ":nohl<CR>", {desc = "Clear search highlights"})

-- stay in indent and visual mode
keymap.set("v",",","<gv", opts) -- press , to decrease indentation (in visual mode)
keymap.set("v",".",">gv", opts) -- press , to increase indentation (in visual mode)

-- Fix copy and pasting
keymap.set("x","p", [["_dP]])

keymap.set({ "n", "v" }, "0", "$") -- Press 0 to the end of the line v & n mode
keymap.set({ "n", "v" }, "1", "0") -- Press 1 to the start of the line v & n mode

