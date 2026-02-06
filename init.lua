-- ==============================
-- BASE46 CACHE & LEADER
-- ==============================
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- ==============================
-- BOOTSTRAP lazy.nvim
-- ==============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- ==============================
-- LOAD PLUGINS
-- ==============================
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

-- ==============================
-- LOAD NVCHAD DEFAULTS
-- ==============================
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- ==============================
-- TOKYO NIGHT DARK THEME
-- ==============================
vim.opt.termguicolors = true  -- required for true color

vim.g.tokyonight_style = "storm"         -- darkest theme
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_bold = true
vim.g.tokyonight_transparent_sidebar = false
vim.g.tokyonight_transparent = false

vim.cmd[[colorscheme tokyonight]]

-- ==============================
-- NEOVIDE GUI TWEAKS (optional)
-- ==============================
if vim.g.neovide then
    vim.opt.guifont = "Consolas:h15"
    vim.g.neovide_cursor_vfx_mode = "none"
    vim.g.neovide_cursor_trail_size = 0.8
end

-- ==============================
-- REST OF NVCHAD CONFIG
-- ==============================
require("options")
require("autocmds")

vim.schedule(function()
  require("mappings")
end)

-- ==============================
-- FORCE TAB & INDENTATION SETTINGS
-- ==============================
-- Global defaults
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

-- Force all buffers (including new ones) to use these tabs
local set_tabs = function()
    vim.api.nvim_create_autocmd({"BufEnter","BufNewFile"}, {
        pattern = "*",
        callback = function()
            vim.bo.tabstop = 4
            vim.bo.shiftwidth = 4
            vim.bo.softtabstop = 4
            vim.bo.expandtab = true
        end,
    })
end

vim.schedule(set_tabs)
