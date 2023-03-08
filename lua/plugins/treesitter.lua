return {
    'nvim-treesitter/nvim-treesitter',
    -- build = ':TSUpdate',
    -- event = 'VeryLazy',
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "yaml",
      },
    },
    -- config = function()
    --   require 'config.treesitter'
    -- end
}
