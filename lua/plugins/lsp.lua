return {
    'kyazdani42/nvim-web-devicons',
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- Mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local opts = { noremap=true, silent=true }
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_prev, {desc="prev diagnostic"})
            vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_next, {desc="next diagnostic"})
            vim.keymap.set('n', '<space>dl', vim.diagnostic.setloclist, {desc="list diagnostic"})

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
              -- Enable completion triggered by <c-x><c-o>
              vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

              -- Mappings.
              -- See `:help vim.lsp.*` for documentation on any of the below functions
              local bufopts = { noremap=true, silent=true, buffer=bufnr }
              vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
              vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
              vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
              vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
              end, bufopts)
              vim.keymap.set('n', '<space>l', vim.lsp.buf.type_definition, bufopts)
              vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
              vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
              vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
              vim.keymap.set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
            end

            local lsp_flags = {
              -- This is the default in Nvim 0.7+
              debounce_text_changes = 150,
            }
            require('lspconfig')['rust_analyzer'].setup{
                on_attach = on_attach,
                flags = lsp_flags,
                -- Server-specific settings...
                settings = {
                  ["rust-analyzer"] = {}
                }
            }
        end
    }
}
