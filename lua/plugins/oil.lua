CustomOilBar = function()
  local path = vim.fn.expand '%'
  path = path:gsub('oil://', '')

  return '  ' .. vim.fn.fnamemodify(path, ':.')
end

require('oil').setup {
  delete_to_trash = true,
  view_options = {
    show_hidden = true, -- but not .git ↓
    is_always_hidden = function(name, _)
      return name == '.git'
    end,
  },
  lsp_file_methods = {
    enabled = true,
    timeout_ms = 1000,
    autosave_changes = true,
  },
  win_options = {
    winbar = '%{v:lua.CustomOilBar()}',
  },
  columns = {
    'icon',
    'permissions',
    'size',
    'mtime',
  },
  float = {
    max_width = 0.6,
    max_height = 0.9,
    border = 'rounded',
  },
}

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
-- Open parent directory in floating window
vim.keymap.set('n', '<space>-', require('oil').toggle_float)
