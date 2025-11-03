return {
  {
    "Nequo/fjell-nvim",
  },
  { "Nequo/nomad-nvim" },
  { "jaredgorski/Mies.vim" },
  { "jacksonludwig/vim-earl-grey" },
  { "fcancelinha/nordern.nvim" },
  { "Nequo/palefire-nvim" },
  {
    "Nequo/emberdark-nvim",
    config = function()
      vim.cmd.colorscheme("emberdark")
    end
  },
}
