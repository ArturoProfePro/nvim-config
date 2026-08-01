require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = {},
  cssls = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = false,
          typeCheckingMode = "basic",
          useLibraryCodeForTypes = true,
          -- Проблемы всех файлов в проекте можно увидеть с помощью :Telescope diagnostics
          -- А если включить Ruff и отключить диагностику у pyright совсем (off), то в :Telescope diagnostics можно увидеть диагностику ruff
          diagnosticMode = "workspace",
        },
      },
    },
  },
  docker_compose_language_service = {
    filetypes = { "yaml", "yml" },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name) -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end

-- read :h vim.lsp.config for changing options of lsp servers
