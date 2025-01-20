local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- local mason_registry = require('mason-registry')
-- local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

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
        'ts_ls',
        'eslint',
        'rust_analyzer',
        'emmet_ls',
        'volar',
        -- 'gopls',
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

lspconfig.volar.setup({
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
})

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = {"css", "html", "javascript", "sass", "scss"},
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  }
})

lspconfig.ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue',
  },
})

-- lspconfig.gopls.setup {
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
