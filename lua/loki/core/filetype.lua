
-- JSP
-- vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
--   pattern = "*.jsp",
--   command = "setfiletype html"
-- })

vim.filetype.add({
  extension = {
    jsp = "html",
  }
})
