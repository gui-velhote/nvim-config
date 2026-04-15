-- require('dashboard').setup({
--   theme = "doom",
--   config = {
--   },
-- })

-- require('alpha').setup(require('alpha.themes.theta').config)

local alpha = require('alpha')
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = vim.fn.readfile(vim.fs.normalize("~/.config/neofetch/ascii.txt"))
dashboard.section.footer.val = "Total plugins: " .. require("lazy").stats().count
dashboard.section.buttons.val = {
  dashboard.button("e", " New file", ":enew<CR>"),
  -- dashboard.button("h", "  Recently opened files", ":Telescope my_mru<CR>"),
  dashboard.button("f", " Find file", ":Telescope find_files<CR>"),
  dashboard.button("p", " Find project", ":Telescope workspaces<CR>"),
  dashboard.button("g", " Git repository", ":Telescope repo list<CR>"),
  dashboard.button("b", " Jump to bookmarks", ":Telescope marks<CR>"),
  dashboard.button("l", " Update plugins", ":Lazy sync<CR>"),
	dashboard.button("q", " Exit", ":qa<CR>"),
}
alpha.setup(dashboard.config)

