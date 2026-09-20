return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },


  {
  "williamboman/mason.nvim",
  lazy = false,
  config = function()
    require("mason").setup()
  end
  },

  {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {  -- Add more languages as needed
        "lua_ls",        -- Lua
        "pyright",       -- Python
        "clangd",        -- C/C++
        "rust_analyzer", -- Rust
        "bashls",        -- Bash
        "jsonls",        -- JSON
        "yamlls",        -- YAML
      },
      automatic_installation = true,
    })
  end
  },

  {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier, -- JS, HTML, CSS
        null_ls.builtins.formatting.black,    -- Python
        null_ls.builtins.formatting.stylua,   -- Lua
        null_ls.builtins.formatting.shfmt,    -- Bash
      }
    })
  end
  },

    -- Quick word search under cursor
  {
    "RRethy/vim-illuminate",
    lazy = false,
    event = "BufReadPost",
    config = function()
      require("illuminate").configure({})
    end,
  },

    -- Clipboard image plugin
  {
    "postfen/clipboard-image.nvim",
    lazy = false,
    config = function()
      require("clipboard-image").setup({
        default = {
          img_dir = "images",
          img_dir_txt = "images",
          affix = "![](%s)",
        },
      })
    end,
  },

    -- Undotree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },

    -- Wakatime
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

    -- Auto save
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    event = "InsertEnter",
    config = function()
      require("auto-save").setup({})
    end,
  },

    -- True Zen mode
  {
    "Pocco81/true-zen.nvim",
    cmd = "TZFocus",
  },

    -- Suda plugin for editing files as sudo
  {
    "lambdalisue/suda.vim",
    lazy = false,
    -- Optional: Add configuration if needed
    config = function()
      vim.g.suda_smart_edit = 1 -- Example configuration for suda
    end,
  },

    -- Synthwave84 theme
  {
    "lunarvim/synthwave84.nvim",
    config = function()
      require("synthwave84").setup({})
    end,
  },

    -- Rust support
  {
    "rust-lang/rust.vim",
    lazy = false,
    ft = "rust",
  },

  -- Null-ls for diagnostics and formatting
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   lazy = false,
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("null-ls").setup()
  --   end,
  -- },

    -- Tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
  },

    -- Dropbar for breadcrumbs
  {
    "Bekaboo/dropbar.nvim",
    lazy = false,
    config = function()
      require("dropbar").setup({})
    end,
  },

  {
    "wurli/visimatch.nvim",
    lazy = false,
    opts = {}
  },

  {
    "z0mbix/vim-shfmt",
    lazy=false,
  },

  {
    "rachartier/tiny-glimmer.nvim",
    lazy = false,
    event = "VeryLazy",
    opts = {
        -- your configuration
    },
  },

---@type LazySpec
{
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    -- check the installation instructions at
    -- https://github.com/folke/snacks.nvim
    "folke/snacks.nvim"
  },
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  ---@type YaziConfig | {}
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
},

  {
  "akinsho/toggleterm.nvim",
  lazy = false,
  version = "*",
  config = function()
    require("toggleterm").setup({
      float_opts = {
        border = "rounded",
        winblend = 0,  -- Keep transparency minimal
        highlights = {
          background = "NormalFloat",
        },
      },
      shade_terminals = false, -- Prevents unwanted shading
    })

    -- Force floating terminal background to match normal editor background
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
  end
  },

  {
    "sindrets/diffview.nvim",
    lazy = false,
    config = function()
      require("diffview").setup({})
    end,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    config = function()
      require("trouble").setup {}
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "ggandor/leap.nvim",
    url = "https://codeberg.org/andyg/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      local user_opts = require "configs.nvimtree"
      return vim.tbl_deep_extend("force", opts, user_opts)
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
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept_suggestion = "<Right>",
          clear_suggestion = "<C-]>",
        },
      }
    end,
  },

  { "stevanmilic/nvim-lspimport" },

  {
    "3rd/image.nvim",
    lazy = false,
    build = false,
    opts = {
      processor = "magick_cli",
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = 90,
      max_height_window_percentage = 90,
      window_overlap_clear_enabled = true,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    },
  },

  -- render-markdown (отключен в пользу установленного markview.nvim во избежание конфликтов)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = "markdown",
    opts = {},
  },
}

