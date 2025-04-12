return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require("configs.conform")
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "Hoffs/omnisharp-extended-lsp.nvim",
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier"
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "c_sharp",
          "typescript",
          "html",
          "css",
          "vim",
          "bash",
        },
        indent = { enabled = true },
        hightlight = { enabled = true },
        sync_install = false,
      })
    end,
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css"
      },
    },
  },

  {
    'ggandor/lightspeed.nvim',
    event = 'VimEnter',
  },

  -- nvim-surround
  {
    "kylechui/nvim-surround",
    -- version = "å*", -- Use for stability; omit to use 'main' branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Fugitive
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
    config = function()
    end,
  },

  -- ampoule action
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    opts = {
      autocmd = { enabled = true },
    },
  },

  -- plugins d'autocomplétion csharp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- pour brancher avec LSP
      "hrsh7th/cmp-buffer",   -- pour compléter dans le buffer courant
      "hrsh7th/cmp-path",     -- pour compléter les chemins
    },
  },
}
