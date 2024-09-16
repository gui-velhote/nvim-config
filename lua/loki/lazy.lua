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
		{ "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon", lazy = false, priority = 1000 },
        -- {
        --     "vhyrro/luarocks.nvim",
        --     priority=1000,
        --     config=true,
        --     rocks = {'nvim-nio', 'mimetypes'}
        -- },
        -- {"nvim-neotest/nvim-nio"},

        -- LSP-Zero
        {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
		{ "neovim/nvim-lspconfig" },
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-nvim-lua'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'}, 
        {'L3MON4D3/LuaSnip'},
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        --Autocompletion with coq
		-- { 
  --           "ms-jpq/coq_nvim",
  --           branch = "coq" 
  --       },
		-- {
  --           "ms-jpq/coq.artifacts",
  --           branch = "artifacts" 
  --       },
		-- {
  --           "ms-jpq/coq.thirdparty",
  --           branch = "3p" 
  --       },
  --
        -- syntax highlighting
		{
            "nvim-treesitter/nvim-treesitter",
            lazy = false
        },
        
        -- autopairs
		{
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = {}
        },

        -- plenary
        "nvim-lua/plenary.nvim",
        
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

        -- rest html
        -- {
        --     "rest-nvim/rest.nvim",
        --     dependencies = { {"nvim-lua/plenary.nvim"} },
        --     lazy = false,
        --     ft = 'http',
        --     config = function ()
        --         require("rest-nvim").setup({})
        --     end
        -- },

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
})

