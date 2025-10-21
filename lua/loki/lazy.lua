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
        -- LSP-Zero
        {'VonHeikemen/lsp-zero.nvim'},
        {'nvim-java/nvim-java', lazy=false},
        {"neovim/nvim-lspconfig", tag="v1.8.0", pin=true},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-nvim-lua'},
        {'hrsh7th/cmp-nvim-lsp'},
        { "rafamadriz/friendly-snippets" },
        { "stevearc/vim-vscode-snippets" },
        { "mfussenegger/nvim-jdtls" },
        {
          current = {buffer_index = true},
          'L3MON4D3/LuaSnip',
          dependencies = { "rafamadriz/friendly-snippets" },
        },
        {"mason-org/mason.nvim", tag="v1.11.0", pin=true},
        {"mason-org/mason-lspconfig.nvim", tag="v1.32.0", pin=true},
        --ctags
        {
          'delphinus/cmp-ctags',
          lazy=false
        },
        -- {
        --   'wsdjeg/ctags.nvim',
        --   dependencies={'wsdjeg/job.nvim'},
        --   lazy=false
        -- },
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
        {
          -- Chartoggle
        {
          'saifulapm/chartoggle.nvim',
          opts = {
            leader = ' ', -- you can use any key as Leader
            keys = {',', ';' } -- Which keys will be toggle end of the line
          },
          keys = {' ,', ' ;'} -- Lazy loaded
}
        },
        -- plenary
        "nvim-lua/plenary.nvim",
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
            lazy = false
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
          "iamcco/markdown-preview.nvim",
          cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
          ft = { "markdown" },
          build = function() vim.fn["mkdp#util#install"]() end,
        },
        {
          'javiorfo/nvim-wildcat',
          lazy = true,
          cmd = { "WildcatBuild", "WildcatRun", "WildcatUp", "WildcatServer" },
          dependencies = { 'javiorfo/nvim-popcorn', 'javiorfo/nvim-spinetta' },
          build = function()
            require 'wildcat.build'.build()
          end
        },
})

