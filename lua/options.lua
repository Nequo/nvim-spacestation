vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opt = vim.opt

-- local hr = tonumber(os.date('%H', os.time()))
-- if hr > 6 and hr < 21 then -- day between 6am and 9pm
--   vim.opt.background = 'light'
-- else -- night
vim.opt.background = "dark"
-- end

opt.shortmess = ""
opt.shortmess = opt.shortmess + "c"
opt.pumheight = 10
opt.laststatus = 3
opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%} %= %m %f"

opt.wildmenu = true
opt.wildmode = { "longest", "full" }
-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

opt.completeopt = { "menuone", "noselect" }

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
opt.signcolumn = "yes"
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

opt.mouse = "a"

opt.listchars = { tab = "  ", trail = "·", extends = "»", precedes = "«", nbsp = "░" }
opt.list = true
