require('mini.trailspace').setup()

-- Surround
require('mini.surround').setup()

-- icons!
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()

local hipatterns = require 'mini.hipatterns'
hipatterns.setup {
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
}

local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW',
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

require('mini.pick').setup {
  window = {
    -- Float window config (table or callable returning it)
    config = win_config,
    -- String to use as caret in prompt
    prompt_caret = '▏',
    -- String to use as prefix in prompt
    prompt_prefix = '  ',
  },
}
local map = vim.keymap.set
map('n', '<leader>ff', '<Cmd>Pick files<CR>')
map('n', '<leader>fb', '<Cmd>Pick buffers<CR>')
map('n', '<leader>fp', function()
  MiniPick.builtin.files({}, {
    source = { cwd = vim.fn.expand '~/.config/nvim' },
  })
end, { desc = 'Pick nvim config files' })
map('n', '<leader>fcg', function()
  MiniPick.builtin.files({}, {
    source = { cwd = vim.fn.expand '~/.config/ghostty' },
  })
end, { desc = 'Pick ghostty config files' })
map('n', '<leader>fg', '<Cmd>Pick grep_live<CR>')

require('mini.completion').setup()
