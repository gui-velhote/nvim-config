
local lines = require("lsp_lines")

lines.setup()

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true
})
