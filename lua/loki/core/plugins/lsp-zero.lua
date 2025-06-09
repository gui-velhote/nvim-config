
-- vim.opt.signcolumn = 'yes'

local lspconfig = require('lspconfig')
local lspconfig_defaults = lspconfig.util.default_config

lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
      'ts_ls',
      'eslint',
      'rust_analyzer',
      'emmet_ls',
      'lua_ls',
      'jdtls',
      'bashls',
      -- 'gopls',
  },
})

lspconfig.bashls.setup({
  filetypes = {'sh', 'bash'},
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
