local cmp = require('cmp')
local util = require("lspconfig/util")

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'look' },
        { name = 'buffer' },
        {
          name = 'ctags',
          option = {
            executable = "ctags",
            trigger_characters = {"."},
            trigger_characters_ft = {},
          }
        }
    }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
    vim.lsp.config('harper_ls', {
        capabilities = capabilities
    })
    vim.lsp.config('pyright', {
        capabilities = capabilities
    })
    vim.lsp.config('rust_analyzer', {
        capabilities = capabilities
    })
    vim.lsp.config('lua_ls', {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            }
          }
        },
        capabilities = capabilities
    })
    -- vim.lsp.config('stylua', {
    --     capabilities = capabilities
    -- })
    vim.lsp.config('gopls', {
        capabilities = capabilities
    })
    vim.lsp.config('gopls', {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {"gopls"},
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
            },
        },
    })
    -- require('lspconfig')['eslint'].setup {
    --     capabilities = capabilities
    -- }
    vim.lsp.config('eslint', {
        capabilities = capabilities,
        filetypes = {'js'}
    })
    vim.lsp.config('ts_ls', {
        capabilities = capabilities
    })
    vim.lsp.config('jsonls', {
        capabilities = capabilities
    })
    -- require('lspconfig')['angularls'].setup {
    --     capabilities = capabilities
    -- }
    -- vim.lsp.config('html', {
    --     capabilities = capabilities
    -- })
    vim.lsp.config('emmet_ls', {
        capabilities = capabilities
    })
    vim.lsp.config('html', {
      capabilities = capabilities,
      filetypes = {'html', 'jsp'}
    })

    vim.lsp.config('java_language_server', {
        capabilities = capabilities
    })

    vim.lsp.enable('ts_ls')
    vim.lsp.enable('harper_ls')
    vim.lsp.enable('pyright')
    vim.lsp.enable('rust_analyzer')
    -- vim.lsp.enable('stylua')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('gopls')
    vim.lsp.enable('jsonls')
    vim.lsp.enable('html')
    vim.lsp.enable('emmet_ls')
    vim.lsp.enable('html')
    vim.lsp.enable('eslint')
    vim.lsp.enable('java_language_server')
