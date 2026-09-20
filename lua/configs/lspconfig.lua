require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = {},
  cssls = {},
  clangd = {},
  rust_analyzer = {},
  bashls = {},
  jsonls = {},
  yamlls = {},
  marksman = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = false,
          typeCheckingMode = "basic",
          useLibraryCodeForTypes = true,
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
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end


