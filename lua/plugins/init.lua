return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
    ft = "python",
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    config = function()
      require("trouble").setup {}
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "sindrets/diffview.nvim", lazy = false },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    ft = "python",

    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        opts = {},
        keys = require("plugins.nvim-dap.nvim-dap-ui.nvim-dap-ui-keys").keys,
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function(_, opts)
          require("plugins.nvim-dap.nvim-dap-ui.nvim-dap-ui-config").setup(opts)
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },

    keys = require("plugins.nvim-dap.nvim-dap-keys").keys,

    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      local vscode = require "dap.ext.vscode"
      local json = require "plenary.json"
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    keys = require("plugins.nvim-dap.nvim-dap-python.nvim-dap-python-keys").keys,

    config = function()
      local python_path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(python_path)
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ft = "markdown",
    ---@module 'render-markdown'
    opts = {},
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      local user_opts = require "configs.nvimtree"
      return vim.tbl_deep_extend("force", opts, user_opts)
    end,
  },
  { "stevanmilic/nvim-lspimport" },
}
