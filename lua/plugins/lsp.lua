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
            -- Open lsp docs in floating window
            -- https://git.sr.ht/~whynothugo/dotfiles/tree/main/item/home/.config/nvim/init.lua
            vim.lsp.util.open_floating_preview = function(contents, syntax, opts)
              local orig_win = vim.api.nvim_get_current_win()
              local focus_orig = false

              -- Focus window if already open.
              -- FIXME: if content has changed, shouldn't focus
              -- TODO: fix this using opts.focus_id
              if hover_win then
                vim.api.nvim_set_current_win(hover_win)
              else
                vim.api.nvim_command("30sp")
                hover_win = vim.api.nvim_get_current_win()
                focus_orig = true

                -- Clean up window id when closed.
                vim.api.nvim_create_autocmd("WinClosed", {
                  pattern = tostring(hover_win),
                  callback = function(_)
                    hover_win = nil
                  end,
                  once = true,
                })
              end

              local hover_bufnr = vim.api.nvim_create_buf(false, true)
              vim.api.nvim_set_current_buf(hover_bufnr)
              vim.api.nvim_buf_set_lines(hover_bufnr, 0, -1, false, contents)
              vim.api.nvim_buf_set_name(hover_bufnr, opts.focus_id)
              vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = hover_bufnr })
              vim.api.nvim_set_option_value("modifiable", false, { buf = hover_bufnr })
              vim.api.nvim_set_option_value("filetype", syntax, { buf = hover_bufnr })
              vim.api.nvim_set_option_value("conceallevel", 3, { win = hover_win })
              vim.api.nvim_set_option_value("concealcursor", "nvic", { win = hover_win })
              vim.api.nvim_set_option_value("spell", false, { win = hover_win })

              -- Hide window with Esc or K.
              vim.keymap.set("n", "<Esc>", ":q<CR>", { silent = true, buffer = true })

              -- Jump back with K
              vim.cmd("nnoremap <buffer> K :call win_gotoid(" .. tostring(orig_win) .. ")<CR>")

              if focus_orig then
                vim.api.nvim_set_current_win(orig_win)
              end
            end
        end
    }
}
