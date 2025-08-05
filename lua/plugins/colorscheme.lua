return {
  {
    "Nequo/hades-nvim",
    dev = true,
  },
  {
    "Nequo/windrunner-nvim",
    dev = true,
  },
  {
    "Nequo/nomad-nvim",
    dev = true,
    config = function()
      vim.cmd.colorscheme("nomad")
    end,
  },
  {
    "jaredgorski/SpaceCamp",
  },
}
