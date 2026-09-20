-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "tundra" },

  hl_override = {
    Comment = { fg = "#B69967", italic = true },
    ["@comment"] = { fg = "#B69967", italic = true },
    Visual = { bg = "#575C61" },
    LineNr = { fg = "#8D959C" },
    WinSeparator = { fg = "blue" },
    NvimTreeWinSeparator = { fg = "#505458" },
  },
}

M.ui = {
  statusline = {
    theme = "vscode",
  },
  tabufline = {
    bufwidth = 35,
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    " ░▒▓██████▓▒░  ░▒▓███████▓▒░   ░▒▓██████▓▒░  ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ",
    "░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ",
    "░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ",
    "░▒▓████████▓▒░ ░▒▓███████▓▒░  ░▒▓█▓▒░        ░▒▓████████▓▒░ ░▒▓█▓▒░ ",
    "░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ",
    "░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ",
    "░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██████▓▒░  ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ",
    "                                                                    ",
    "                                                                    ",
  },
}

M.term = {
  float = {
    relative = "editor",
    row = 0.1,
    col = 0.08,
    width = 0.8,
    height = 0.7,
    border = "rounded",
  },
}

M.cheatsheet = {
  theme = "grid",
}

M.mason = {
  pkgs = {
    "lua-language-server",
    "stylua",
    "jedi-language-server",
    "pyright",
    "ruff",
    "black",
    "debugpy",
    "marksman",
    "markdownlint-cli2",
    "mdformat",
    "clangd",
    "rust-analyzer",
    "bash-language-server",
    "json-lsp",
    "yaml-language-server",
    "shfmt",
    "prettier",
    "hadolint",
  },
}

M.colorify = {
  enabled = true,
  mode = "virtual",
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

return M

