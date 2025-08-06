vim.lsp.enable({
  "rust-analyzer",
})
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰬸 ",
      [vim.diagnostic.severity.WARN] = "󰬸 ",
      [vim.diagnostic.severity.INFO] = "󰬸 ",
      [vim.diagnostic.severity.HINT] = "󰬸 ",
    },
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  -- Disable diagnostic virtual text in favor of explicitly showing messages
  virtual_text = false,
  virtual_lines = {
    current_line = true,
    severity = vim.diagnostic.severity.ERROR,
  },
})
