local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
	    "--branch=stable", -- latest stable release
	    lazypath,
	  })
	end
	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({
        -- colorscheme
        -- { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon", lazy = false, priority = 1000 },
        { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
        {'rose-pine/neovim', name="rose-pine", lazy=false, priority=1000},
        {'shaunsingh/moonlight.nvim', name="moonlight", lazy=false, priority=1000},
        {
          "ellisonleao/gruvbox.nvim",
          priority = 1000,
          config = true,
        },
        {
          "xiyaowong/transparent.nvim",
          lazy = false,
          config = function()
            require("transparent").setup({
              groups = {
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                'EndOfBuffer',
              },
              extra_groups = {},
              exclude_groups = {},
              on_clear = function() end,
            })
            vim.cmd("TransparentEnable")
          end
        },
        -- LSP-Zero
        -- {'VonHeikemen/lsp-zero.nvim'},
        -- {'nvim-java/nvim-java', lazy=false},
        -- {"neovim/nvim-lspconfig", tag="v1.8.0", pin=true},
        {
          "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
          lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
        },
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-nvim-lua'},
        {'hrsh7th/nvim-cmp'},
        { "rafamadriz/friendly-snippets" },
        { "stevearc/vim-vscode-snippets" },
        { "mfussenegger/nvim-jdtls" },
        {
          current = {buffer_index = true},
          'L3MON4D3/LuaSnip',
          dependencies = { "rafamadriz/friendly-snippets" },
        },
        {"mason-org/mason.nvim", pin=true},
        {"mason-org/mason-lspconfig.nvim", pin=true},
        --ctags
        {
          'delphinus/cmp-ctags',
          lazy=false
        },
        {
          'wsdjeg/ctags.nvim',
          dependencies={'wsdjeg/job.nvim'},
          lazy=false
        },
        -- syntax highlighting
		    {
            "nvim-treesitter/nvim-treesitter",
            lazy = false
        },
        {'posva/vim-vue'},
        {'cakebaker/scss-syntax.vim'},
        -- surrond
        {
          "kylechui/nvim-surround",
          version = "*", -- Use for stability; omit to use `main` branch for the latest features
          event = "VeryLazy",
          config = function()
              require("nvim-surround").setup({
                  -- Configuration here, or leave empty to use defaults
              })
          end
        },
        -- autopairs
		    {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = {}
        },
        -- autotag
        {
          "windwp/nvim-ts-autotag",
          lazy = false
        },
        -- commasemi
        {
          "saifulapm/commasemi.nvim",
          lazy = false,
          opts = {
            leader = " ",
            keymaps = true,
            commands = true
          }
        },
        -- plenary
        {"nvim-lua/plenary.nvim"},
        {'ThePrimeagen/harpoon'},
        -- Compiler
        {
          "Zeioth/compiler.nvim",
          cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
          dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
          opts = {},
        },
        {
          'stevearc/overseer.nvim',
          opts = {},
        },
        {
          "stevearc/overseer.nvim",
          commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
          cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
          opts = {
            task_list = {
              direction = "bottom",
              min_height = 25,
              max_height = 25,
              default_detail = 1
            },
          },
        },
        -- web-tools
        {
            "ray-x/web-tools.nvim",
            config = function ()
                require("web-tools").setup({
                    keymaps = {
                        rename = nil,
                        repeat_rename = '.',
                    },
                    hurl = {
                        show_headers = false,
                        floating = false,
                        json5 = false,
                        formatters = {
                            json = { 'jq' },
                            html = { 'prettier', '--parser', 'html' }
                        }
                    }
                })
            end
        },

        -- status line
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" }
        },
        -- telescope
        {
            'nvim-telescope/telescope.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        -- nvim-tree
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            lazy = false,
            config = function()
              require('nvim-tree').setup({})
            end
        },
        -- comments
        {
            'numToStr/Comment.nvim',
            opts = {
                -- add any options here
                },
            lazy = false,
        },
        "tpope/vim-fugitive",
        {
            'nvimdev/dashboard-nvim',
            event = 'VimEnter',
            config = function()
                require('dashboard').setup {
              -- config
                }
            end,
            dependencies = { {'nvim-tree/nvim-web-devicons'}}
        },
        {
          'akinsho/git-conflict.nvim', version = "*", config=true
        },
        "aserowy/tmux.nvim",
        {'romgrk/barbar.nvim',
            dependencies = {
                'lewis6991/gitsigns.nvim',
                'nvim-tree/nvim-web-devicons',
            },
            init = function() vim.g.barbar_auto_setup = false end,
            opts = {
                  -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
                  -- animation = true,
                  -- insert_at_start = true,
                  -- …etc.
            },
            version = '^1.0.0', -- optional: only update when a new 1.x version is released
        },
        {
          "OXY2DEV/markview.nvim",
          lazy = false,
        },
        {
          'javiorfo/nvim-wildcat',
          lazy = true,
          cmd = { "WildcatBuild", "WildcatRun", "WildcatUp", "WildcatServer" },
          ft = { "java" },
          event = { "BufReadPost pom.xml", "BufReadPost build.gradle" },
          dependencies = { 'javiorfo/nvim-popcorn', 'javiorfo/nvim-spinetta' },
          opts = {
            console_size = 15,
            default_server = "tomcat",
            build_tool = "maven",
            java_home = "/usr/lib/jvm/java-8-openjdk",
            tomcat = {
              path = "/home/gvelhote/tomcat/apache-tomcat-8.5.99",
              app_base = "webapps"
            }
          }
          -- build = function()
          --   require 'wildcat.build'.build()
          -- end
        },
      })

