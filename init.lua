vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local opt = vim.opt

local function set_background_from_macos()
  local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'
  local result = handle:read '*a'
  handle:close()

  if result:match 'Dark' then
    vim.o.background = 'dark'
    vim.cmd [[colorscheme flexoki-mono]]
  else
    vim.o.background = 'light'
    vim.cmd [[colorscheme flexoki-mono-light]]
  end
end

if vim.loop.os_uname().sysname == 'Darwin' then
  set_background_from_macos()
else
  vim.o.background = 'dark'
  vim.cmd [[colorscheme flexoki-mono]]
end

opt.shortmess = ''
opt.shortmess = opt.shortmess + 'ct'
opt.pumheight = 10
opt.laststatus = 3
opt.winbar = '%= %m %f'

opt.wildmenu = true
opt.wildmode = { 'longest', 'full' }
-- Ignore compiled files
opt.wildignore = '__pycache__'
opt.wildignore = opt.wildignore + { '*.o', '*~', '*.pyc', '*pycache*' }

opt.completeopt = { 'menuone', 'noselect' }

opt.termguicolors = true
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.cursorline = true -- Highlight the current line
opt.signcolumn = 'yes'
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster
opt.hlsearch = true -- Highlight searches
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.linebreak = true

opt.mouse = 'a'

opt.listchars = { tab = '  ', trail = '·', extends = '»', precedes = '«', nbsp = '░' }
opt.list = true

opt.winborder = 'single'
opt.pumborder = 'single'

local opts = { silent = true }
local map = vim.keymap.set
map("n", "<leader>q", function() -- toggle quickfix
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end)

vim.g.mono_color_comments = true

require 'lsp'
require 'statusline'

-- https://github.com/neovim/neovim/pull/27855
require('vim._extui').enable({
  enable = true, -- Whether to enable or disable the UI.
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Where to place regular messages, either in the
    ---cmdline or in a separate ephemeral message window.
    target = 'cmd',
    timeout = 2000, -- Time a message is visible in the message window.
  },
})

-- Plugins
local gh = function(x)
  return 'https://github.com/' .. x
end
vim.pack.add {
  { src = gh 'nvim-treesitter/nvim-treesitter' },
  { src = gh 'stevearc/oil.nvim' },
  { src = gh 'nvim-mini/mini.nvim' },
}
local nts = require 'nvim-treesitter'
local langs = { 'lua', 'rust', 'go', 'zig', 'yaml' }

nts.setup {
  install_dir = vim.fn.stdpath 'data' .. '/site',
}
nts.install(langs)
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function()
    nts.update()
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = langs,
  callback = function()
    vim.treesitter.start()
  end,
})
require 'plugins.oil'
require 'plugins.mini'

-- from https://github.com/hifanx/dotfiles/blob/master/nvim/.config/nvim/init.lua
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Proper "formatoptions"',
  group = vim.api.nvim_create_augroup('formatoptions', { clear = true }),
  callback = function()
    vim.cmd 'setlocal formatoptions-=c formatoptions-=o'
  end,
})
vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Auto resize splits on terminal resize',
  group = vim.api.nvim_create_augroup('nequo/vimresized', { clear = true }),
  command = 'wincmd =',
})
