local wildcat = require('wildcat')

wildcat.setup({
  console_size = 15,
  default_server = "tomcat",
  build_tool = "maven",
  java_home = "/usr/lib/jvm/java-8-openjdk",
  tomcat = {
    path = "/home/gvelhote/tomcat/apache-tomcat-8.5.99",
    app_base = "webapps"
  }
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"*.java", "pom.xml", "*.js", "*.jsp"},
  callback = function ()
    local included_dir = vim.fn.expand("~") .. "/usp/tomcat/"
    local file_path = vim.api.nvim_buf_get_name(0)

    if not file_path:find(included_dir, 1, true) then
      return
    end

    local server_buf = vim.g.wildcat_server_buf
    vim.cmd("WildcatDown")

    local term_buf = vim.api.nvim_create_buf(false, true)
    vim.g.wildcat_server_buf = term_buf

    vim.schedule(function ()
      vim.cmd("WildcatRun")
    end)
  end
})

vim.api.nvim_create_user_command("WildcatToggle", function()
  local buf = vim.g.wildcat_server_buf
  if buf and vim.api.nvim_buf_is_valid(buf) then
    -- Find window showing this buffer
    local win = vim.fn.bufwinid(buf)
    if win ~= -1 then
      -- Hide it
      vim.api.nvim_win_close(win, false)
    else
      -- Show it in a split
      vim.cmd("split")
      vim.api.nvim_win_set_buf(0, buf)
    end
  end
end, {})
