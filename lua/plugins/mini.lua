return {
     {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        config = function()
          -- Trailspace (highlight and remove)
          require("mini.trailspace").setup()

          -- Align text
          -- require("mini.align").setup()

          -- Autopairs
          require("mini.pairs").setup()

          -- Commenting
          require("mini.comment").setup()

          -- Surround
          require("mini.surround").setup()
        end,
    },
}
