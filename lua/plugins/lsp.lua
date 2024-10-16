return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'stevearc/conform.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            local lspconfig = require('lspconfig')
            -- Mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local opts = { noremap=true, silent=true }
            -- Disable diagnostic virtual text in favor of explicitly showing messages with above keybindings
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '',
                        [vim.diagnostic.severity.WARN]  = '',
                        [vim.diagnostic.severity.INFO]  = '',
                        [vim.diagnostic.severity.HINT]  = '',
                    },
                },
                virtual_text = false,
            })
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                  local bufnr = args.buf
                  local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

                  local builtin = require "telescope.builtin"

                  vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
                  vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
                  vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
                  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
                  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
                  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

                  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
                  vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_prev, {desc="prev diagnostic"})
                  vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_next, {desc="next diagnostic"})
                  vim.keymap.set('n', '<space>dl', vim.diagnostic.setloclist, {desc="list diagnostic"})

                  vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
                  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
                  vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = 0 })

                end,
              })


            -- Rust
            lspconfig.rust_analyzer.setup{
                on_attach = on_attach,
                flags = lsp_flags,
                -- Server-specific settings...
                settings = {
                  ["rust-analyzer"] = {}
                }
            }
            -- Gleam
            lspconfig.gleam.setup({})

            -- Swift
            lspconfig.sourcekit.setup {
                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                },
            }

            require("conform").setup({
              formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                gleam = { lsp_format = "first" },
              },
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
              pattern = "*",
              callback = function(args)
                require("conform").format({ bufnr = args.buf })
              end,
            })
        end
    }
}
