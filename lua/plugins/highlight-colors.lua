return {
  {
    "brenoprata10/nvim-highlight-colors",
    keys = {
      {
        "<leader>tc",
        desc = "toggle highlights",
        function()
          require("nvim-highlight-colors").toggle()
        end,
      },
    },
  },
}
