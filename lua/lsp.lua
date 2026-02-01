vim.lsp.enable {
  'rust-analyzer',
  'gopls',
  'gh-actions',
  'gleam',
}

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰬸 ',
      [vim.diagnostic.severity.WARN] = '󰬸 ',
      [vim.diagnostic.severity.INFO] = '󰬸 ',
      [vim.diagnostic.severity.HINT] = '󰬸 ',
    },
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
  -- Disable diagnostic virtual text in favor of explicitly showing messages
  virtual_text = false,
  signs = true,
  virtual_lines = {
    current_line = true,
    severity = vim.diagnostic.severity.ERROR,
  },
}
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Configure LSP keymaps',
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end
    local bufnr = args.buf
    -- Helper for keymaps
    local function keymap(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
    end
    -- Lightbulb integration + code actions
    if client:supports_method 'textDocument/codeAction' then
      local ok, lightbulb = pcall(require, 'lightbulb')
      if ok then
        lightbulb.attach_lightbulb(bufnr, client)
      end
      keymap('<leader>ca', vim.lsp.buf.code_action, 'Code action')
    end
    -- Goto definition
    if client:supports_method 'textDocument/definition' then
      keymap('gd', vim.lsp.buf.definition, 'Go to definition')
    end
    -- Text formatting
    if client:supports_method 'textDocument/formatting' then
      keymap('<leader>lf', vim.lsp.buf.format, 'Format buffer')
    end
    -- Inlay hints
    if client:supports_method 'textDocument/inlayHint' then
      keymap('<leader>ti', function()
        vim.lsp.inlay_hint.enable(
          not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr },
          { bufnr = bufnr }
        )
      end, 'Toggle inlay hints')
    end
  end,
})
