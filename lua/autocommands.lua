-- reset cursor shape when leaving neovim
-- https://github.com/neovim/neovim/issues/4396
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  command = 'set guicursor= | call chansend(v:stderr, "\x1b[ q")',
})
