require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })

-- Sudo read / write
map("n", "<leader>sr", ":SudaRead<CR>", { desc = "Suda Read (Open as sudo)" })
map("n", "<leader>sw", ":SudaWrite<CR>", { desc = "Suda Write (Save as sudo)" })

-- Diagnostics and Signature Help
map("n", "<space>e", vim.diagnostic.open_float, { desc = "Diagnostic open float" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP signature help" })

-- Space to comment in Normal and Visual mode
map("n", " ", "gcc", { remap = true, desc = "Comment toggle" })
map("v", " ", "gc", { remap = true, desc = "Comment toggle" })

-- Save and Quit
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" })
map({ "n", "i", "v" }, "<C-q>", "<cmd> q <cr>", { desc = "Quit" })

-- Move cursor in insert mode with Alt + h/j/k/l
map("i", "<A-h>", "<Left>", { desc = "Move left in insert mode" })
map("i", "<A-j>", "<Down>", { desc = "Move down in insert mode" })
map("i", "<A-k>", "<Up>", { desc = "Move up in insert mode" })
map("i", "<A-l>", "<Right>", { desc = "Move right in insert mode" })

-- Normal mode: Move current line up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })

-- Visual mode: Move selected lines up/down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

-- Increment number with +
map("n", "+", "<C-a>", { desc = "Increment number" })

-- Select all with Ctrl + A
map("n", "<C-A>", "ggVG", { desc = "Select all" })
map("i", "<C-A>", "<ESC>ggVG", { desc = "Select all in insert mode" })
map("v", "<C-A>", "<ESC>ggVG", { desc = "Select all in visual mode" })

-- LSP Import
map("n", "<leader>i", function()
  require("lspimport").import()
end, { noremap = true, desc = "LSP Import" })

-- Keybinding for formatting (conform with lsp fallback)
map("n", "<leader>lf", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "Format file" })

-- ToggleTerm Keybindings
vim.api.nvim_create_autocmd("TermEnter", {
  pattern = "term://*toggleterm#*",
  command = 'tnoremap <silent><C-t> <Cmd>exe v:count1 .. "ToggleTerm"<CR>',
})

map("n", "<C-t>", function()
  local count = vim.v.count1
  vim.cmd(count .. "ToggleTerm")
end, { desc = "Toggle Terminal" })

map("i", "<C-t>", function()
  local count = vim.v.count1
  vim.cmd("stopinsert | " .. count .. "ToggleTerm")
end, { desc = "Toggle Terminal (Insert Mode)" })

-- Trouble
map("n", "<leader>qx", "<cmd>Trouble<CR>", { desc = "Open Trouble" })
map("n", "<leader>qw", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open Workspace Trouble" })
map("n", "<leader>qd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Open Document Trouble" })
map("n", "<leader>qq", "<cmd>Trouble qflist toggle <CR>", { desc = "Open Quickfix" })
map("n", "<leader>ql", "<cmd>Trouble loclist toggle<CR>", { desc = "Open Location List" })
map("n", "<leader>qt", "<cmd>TodoTrouble<CR>", { desc = "Open Todo Trouble" })

-- Neotest
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run file test" })
map("n", "<leader>to", ":Neotest output<CR>", { desc = "Show test output" })
map("n", "<leader>ts", ":Neotest summary<CR>", { desc = "Show test summary" })

-- Diffview & Git
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diff view open" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File git history" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "Repo git history" })
map("n", "<leader>gx", "<cmd>DiffviewClose<cr>", { desc = "Diff view close" })
map("n", "<leader>gl", ":Flog<CR>", { desc = "Git Log" })
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "Git File History" })
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Git Last Commit" })
map("n", "<leader>gt", ":DiffviewToggleFile<CR>", { desc = "Git Toggle File" })

-- Antigravity
map("n", "<leader>ag", "<cmd>Antigravity<cr>", { desc = "Toggle Antigravity" })

