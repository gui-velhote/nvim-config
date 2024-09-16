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
    }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('lspconfig')['pyright'].setup {
        capabilities = capabilities
    }
    require('lspconfig')['rust_analyzer'].setup {
        capabilities = capabilities
    }
    require('lspconfig')['lua_ls'].setup {
        capabilities = capabilities
    }
    -- require('lspconfig')['gopls'].setup {
    --     capabilities = capabilities
    -- }
    -- require('lspconfig')['gopls'].setup {
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    --     cmd = {"gopls"},
    --     filetypes = { "go", "gomod", "gowork", "gotmpl" },
    --     root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    --     settings = {
    --         gopls = {
    --             completeUnimported = true,
    --             usePlaceholders = true,
    --             analyses = {
    --                 unusedparams = true,
    --             },
    --         },
    --     },
    -- }
    require('lspconfig')['eslint'].setup {
        capabilities = capabilities
    }
    require('lspconfig')['tsserver'].setup {
        capabilities = capabilities
    }
    require('lspconfig')['jsonls'].setup {
        capabilities = capabilities
    }
    -- require('lspconfig')['angularls'].setup {
    --     capabilities = capabilities
    -- }
    require('lspconfig')['html'].setup {
        capabilities = capabilities
    }
    require('lspconfig')['emmet_ls'].setup {
        capabilities = capabilities
    }
