local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

lsp_zero.preset("recommended")

-- lsp_zero.ensure_installed({
--     'tsserver',
--     'eslint',
--     'sumneko_lua',
--     'rust_analyzer',
-- })

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'rust_analyzer',
        'gopls',
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

lspconfig.gopls.setup {
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
}

-- lspconfig.gopls.setup{}

-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp_zero.defaults.cmp_mappings({
--     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--     ['<C-Space>'] = cmp.mapping.complete(),
-- })

lsp_zero.set_preferences({
    sign_icons = { }
})

-- lsp_zero.on_attach(function(client, bufnr)
--     lsp_zero.default_keymaps({buffer = bufnr})
-- end)
