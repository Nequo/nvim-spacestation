return {
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      -- Trailspace (highlight and remove)
      require("mini.trailspace").setup()

      -- Surround
      require("mini.surround").setup()

      -- icons!
      require("mini.icons").setup()
      MiniIcons.mock_nvim_web_devicons()
    end,
  },
}
