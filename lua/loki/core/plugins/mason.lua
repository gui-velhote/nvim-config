
-- vim.opt.signcolumn = 'yes'

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
      -- 'ts_ls',
      'vtsls',
      'eslint',
      'rust_analyzer',
      'emmet_ls',
      'lua_ls',
      'jdtls',
      'bashls',
      'vue_ls',
      'gopls'
  },
})
