return {
  {
    "Nequo/hades-nvim",
    dev = true,
  },
  {
    "Nequo/windrunner-nvim",
    dev = true,
    config = function()
      vim.cmd.colorscheme("windrunner")
    end,
  },
}
