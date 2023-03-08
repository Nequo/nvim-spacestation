return {
    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
      keys = {
          {'<leader>ff', function() require('telescope.builtin').find_files() end},
          {'<leader>fr', function() require('telescope.builtin').oldfiles() end},
          {'<leader>fp', function() require('telescope.builtin').find_files({cwd = '~/.config/nvim/'}) end},
          {'<leader>fg', function() require('telescope.builtin').live_grep() end},
          {'<leader>fb', function() require('telescope.builtin').buffers() end},
          {'<leader>fh', function() require('telescope.builtin').help_tags() end},
          {'<leader>fa', function() require('telescope.builtin').lsp_code_actions() end},
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
