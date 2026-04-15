
require("workspaces").setup({
  path = vim.fn.stdpath("data") .. "/workspaces",
  hooks = {
    open = { "Telescope find_files" },
  },
})
