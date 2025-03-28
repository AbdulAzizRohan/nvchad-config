local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    -- dependencies = "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    }
  },
  {
    'saecki/crates.nvim',
    dependencies = "hrsh7th/nvim-cmp",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates", "nvim_lsp"})
      return M
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_,_)
      require("core.utils").load_mappings("dap")
    end
  },
  -- {
  --   "mfussenegger/nvim-dap-python",
  --   ft = "python",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --   },
  -- },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require("custom.configs.null-ls")
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "rust-analyzer",
        "lua-language-server",
        "typescript-language-server",
        "jdtls",
        "eslint-lsp",
        "prettierd",
        "js-debug-adapter",
        "html-lsp",
        "pyright",
        "mypy",
        "ruff",
        "black",
      }
    }
  },
  {
    "barrett-ruth/live-server.nvim",
    dependencies = "lukahartwig/pnpm.nvim",
    build = 'pnpm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    -- config = true
    config = function (_, opts)
      require('live-server').setup(opts)
    end,
  },
  {
    "microsoft/vscode-css-languageservice"
  },
  {
	  'xeluxee/competitest.nvim',
	  dependencies = 'MunifTanjim/nui.nvim',
    event = "VeryLazy",
	  config = function()
      require('competitest').setup()
    end,
  },
  {
    "3rd/time-tracker.nvim",
    dependencies = {
      "3rd/sqlite.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("time-tracker").setup({
        data_file = vim.fn.stdpath("data") .. "/time-tracker.db",  -- Path to the database file
        tracking_events = { "BufEnter", "BufWinEnter", "CursorMoved", "CursorMovedI", "WinScrolled" },
        tracking_timeout_seconds = 5 * 60, -- 5 minutes
      })
    end,
  },
  -- {
  --   "lervag/vimtex",
  --   lazy = false,     -- we don't want to lazy load VimTeX
  --   -- tag = "v2.15", -- uncomment to pin to a specific release
  --   init = function()
  --     -- vim.g.maplocalleader = ","
  --     -- VimTeX configuration goes here
  --     vim.g.vimtex_compiler_method = 'latexmk'
  --     vim.g.vimtex_view_method = "zathura"
  --     vim.g.vimtex_compiler_latexmk = {
  --       build_dir = "build",
  --       options = {
  --         -- "-pdf",
  --         -- '-pdflatex="pdflatex -shell-escape %O %S"',
  --         '-lualatex="lualatex -shell-escape %O %S"',
  --       }
  --     }
  --   end
  -- },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build",
        options = {
          "-lualatex",           -- Use LuaLaTeX engine
          "-shell-escape",       -- Allow shell escape
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        }
      }
      -- Explicitly set the callback mode
      vim.g.vimtex_compiler_latexmk_engines = {
        _                = '-lualatex',
        lualatex        = '-lualatex',
        pdflatex        = '-pdf'
      }
    end
  },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    init = function ()
      local wk = require("which-key")
      wk.add({
          mode = { "v" },
          { "<leader>s",  group = "Silicon" },
          { "<leader>sc", function() require("nvim-silicon").clip() end, desc = "Copy code screenshot to clipboard" },
          { "<leader>sf", function() require("nvim-silicon").file() end,  desc = "Save code screenshot as file" },
          { "<leader>ss", function() require("nvim-silicon").shoot() end,  desc = "Create code screenshot" },
      })
    end,
    config = function ()
      require("silicon").setup({
        font = "CaskaydiaMono Nerd Font=34; Noto Color Emoji=34",
        theme = "Coldark-Dark",
        background = "#94e2d5",
        window_title = function ()
          return vim.fn.fnamemodify(
            vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t"
          )
        end
      })
    end
  },
  -- {
  --   "smallcloudai/refact-neovim",
  --   lazy = false,
  --   config = function()
  --    require("refact-neovim").setup({
  --       address_url = "Refact",
  --       api_key = "eBoG4p1JJxIKMS0trdqDlALQ",
  --       accept_keymap = "<C-V>",
  --     })
  --   end
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function ()
  --     require "custom.configs.lint"
  --   end
  -- },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.formatter"
    end
  },
  -- {
  --   'projekt0n/github-nvim-theme',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('github-theme').setup({
  --       -- ...
  --     })
  --     vim.cmd('colorscheme github_dark_high_contrast')
  --   end,
  -- }
}

return plugins
