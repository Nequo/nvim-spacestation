return {
    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
      keys = {
          {'<leader>ff', desc="find files", function() require('telescope.builtin').find_files() end},
          {'<leader>fr', desc="recent files", function() require('telescope.builtin').oldfiles() end},
          {'<leader>fp', desc="edit neovim config", function() require('telescope.builtin').find_files({cwd = '~/.config/nvim/'}) end},
          {'<leader>fg', desc="live grep", function() require('telescope.builtin').live_grep() end},
          {'<leader>fb', desc="find buffers", function() require('telescope.builtin').buffers() end},
          {'<leader>fh', desc="help tags", function() require('telescope.builtin').help_tags() end},
      },
      opts = {
          defaults = {
            prompt_prefix = "  " .. " " .. "  ",
            selection_caret = " ❯ ",
            entry_prefix = "   ",
        },
      },
      cmd = 'Telescope',
    }
}
