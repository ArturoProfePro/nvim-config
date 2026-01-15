require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<space>e", vim.diagnostic.open_float)

map("n", "<C-k>", vim.lsp.buf.signature_help)

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

map("n", "", "gcc", { remap = true })
map("v", "", "gc", { remap = true })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({ "n", "i", "v" }, "<C-q>", "<cmd> q <cr>")
-- Move cursor in insert mode with Alt + h/j/k/l
map("i", "<A-h>", "<Left>", { desc = "Move left in insert mode" })
map("i", "<A-j>", "<Down>", { desc = "Move down in insert mode" })
map("i", "<A-k>", "<Up>", { desc = "Move up in insert mode" })
map("i", "<A-l>", "<Right>", { desc = "Move right in insert mode" })

map("n", "+", "<C-a>", { desc = "Increment number" })
-- Select all with Ctrl + A
map("n", "<C-A>", "ggVG", { desc = "Select all" })
map("i", "<C-A>", "<ESC>ggVG", { desc = "Select all in insert mode" })
map("v", "<C-A>", "<ESC>ggVG", { desc = "Select all in visual mode" })

map("n", "<leader>i", require("lspimport").import, { noremap = true })

-- map({ "n", "t" }, "<A-i>", function()
--   require("nvchad.term").toggle {
--     pos = "float",
--     id = "floatTerm",
--     float_opts = {
--       row = 0.1,
--       col = 0.08,
--       width = 0.8,
--       height = 0.7,
--       border = "none",
--     },
--   }
-- end, { desc = "Toggle floating terminal" })

map("n", "<leader>qx", "<cmd>Trouble<CR>", { desc = "Open Trouble" })
map("n", "<leader>qw", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open Workspace Trouble" })
map("n", "<leader>qd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Open Document Trouble" })
map("n", "<leader>qq", "<cmd>Trouble qflist toggle <CR>", { desc = "Open Quickfix" })
map("n", "<leader>ql", "<cmd>Trouble loclist toggle<CR>", { desc = "Open Location List" })
map("n", "<leader>qt", "<cmd>TodoTrouble<CR>", { desc = "Open Todo Trouble" })

map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run file test" })
map("n", "<leader>to", ":Neotest output<CR>", { desc = "Show test output" })
map("n", "<leader>ts", ":Neotest summary<CR>", { desc = "Show test summary" })

map("n", "<leader>gl", ":Flog<CR>", { desc = "Git Log" })
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "Git File History" })
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Git Last Commit" })
map("n", "<leader>gt", ":DiffviewToggleFile<CR>", { desc = "Git File History" })
