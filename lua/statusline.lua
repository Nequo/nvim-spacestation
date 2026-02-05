-- cobbled together from:
-- - https://github.com/MariaSolOs/dotfiles/blob/d38272d2a56e7edff3916d53b464da07ae993587/.config/nvim/lua/statusline.lua
-- - https://github.com/sschleemilch/dotfiles/blob/61cee9ff71e294ab92668bb4b4fdbbb943a89b92/dot_config/nvim/plugin/13_statusline.lua#L96
-- - https://github.com/ckipp01/dots/blob/f18dc54cf295813cfa1aadb9f6bce4e9a50d3dad/nvim/.config/nvim/lua/mesopotamia/statusline_winbar.lua

local M = {}

local separator = ' ▪ '

-- Caches the complete mode string to spare `string.format` calls entirely
--- @type table<string, string>
local mode_cache = {}

-- Caches the diagnostic counts for a given buffer
--- @type table<integer, table>
local diagnostics_cache = {}

-- Tracks attached LSP clients for buffer IDs
-- Using LspAttach and LspDetach events to update
--- @type table<integer, string>
local lsp_clients = {}

--- @param mode string
--- @param active boolean
--- @return string
local function mode_component(mode, active)
    local cache_key = mode .. (active and '+' or '')
    if mode_cache[cache_key] then
        return mode_cache[cache_key]
    end

    -- Note that: \19 = ^S and \22 = ^V.
    local map = {
        ['n'] = { display = 'NORMAL', hl = 'MiniStatuslineModeNormal' },
        ['v'] = { display = 'VISUAL', hl = 'MiniStatuslineModeVisual' },
        ['V'] = { display = 'V-LINE', hl = 'MiniStatuslineModeVisual' },
        ['\22'] = { display = 'V-BLOCK', hl = 'MiniStatuslineModeVisual' },
        ['s'] = { display = 'SELECT', hl = 'MiniStatuslineModeVisual' },
        ['S'] = { display = 'S-LINE', hl = 'MiniStatuslineModeVisual' },
        ['\19'] = { display = 'S-BLOCK', hl = 'MiniStatuslineModeVisual' },
        ['i'] = { display = 'INSERT', hl = 'MiniStatuslineModeInsert' },
        ['R'] = { display = 'REPLACE', hl = 'MiniStatuslineModeReplace' },
        ['c'] = { display = 'COMMAND', hl = 'MiniStatuslineModeCommand' },
        ['r'] = { display = 'PROMPT', hl = 'MiniStatuslineModeCommand' },
        ['!'] = { display = 'SHELL', hl = 'MiniStatuslineModeCommand' },
        ['t'] = { display = 'TERM', hl = 'MiniStatuslineModeCommand' },
    }
    local current = map[mode] or { display = 'OTHER', hl = 'MiniStatuslineModeOther' }
    local hl = active and current.hl or 'StatusLineModeInactive'

    local result = string.format('%%#%s# %s %%*', hl, current.display)
    mode_cache[cache_key] = result
    return result
end

local track_lsp = vim.schedule_wrap(function(data)
    if not vim.api.nvim_buf_is_valid(data.buf) then
        lsp_clients[data.buf] = nil
        return
    end
    local attached_clients = vim.lsp.get_clients({ bufnr = data.buf })

    local it = vim.iter(attached_clients)
    it:map(function(client)
        if client.name == 'copilot' then
            return nil
        end
        return client.name
    end)
    local names = it:totable()
    if #names > 0 then
        lsp_clients[data.buf] = table.concat(names, ',')
    else
        lsp_clients[data.buf] = nil
    end
end)

vim.api.nvim_create_autocmd(
    { 'LspAttach', 'LspDetach', 'BufEnter' },
    { group = vim.api.nvim_create_augroup('nequo/track_lsp', { clear = true }), pattern = '*', callback = track_lsp, desc = 'Track LSP Clients' }
)

--- @param bufnr integer
--- @return string
local function lsp_clients_component(bufnr)
    local icons = require'icons'
    local clients = lsp_clients[bufnr]
    return (clients and (clients .. ' ' .. icons.misc.rocket .. ' ' .. separator) or '')
end

--- @param bufnr integer
--- @param active boolean
--- @return string
local function diagnostic_component(bufnr, active)
    local counts = vim.diagnostic.count(bufnr)
    diagnostics_cache[bufnr] = counts

    local diagnostic_hls = {
        [vim.diagnostic.severity.ERROR] = '%#DiagnosticError#',
        [vim.diagnostic.severity.WARN] = '%#DiagnosticWarn#',
        [vim.diagnostic.severity.INFO] = '%#DiagnosticInfo#',
        [vim.diagnostic.severity.HINT] = '%#DiagnosticHint#',
    }

    local icons = require'icons'.misc
    local signs = {
        [vim.diagnostic.severity.ERROR] = icons.error,
        [vim.diagnostic.severity.WARN] = icons.warning,
        [vim.diagnostic.severity.INFO] = icons.info,
        [vim.diagnostic.severity.HINT] = icons.info,
    }

    local result_str = vim.iter(pairs(counts))
        :map(function(severity, count)
            return ('%s%s%s%s'):format(
                active and diagnostic_hls[severity] or '',
                signs[severity],
                ' ',
                count,
                active and '%*' or ''
            )
        end)
        :join(' ')

    return separator .. result_str .. '%#StatusLine#'
end

--- @param filetype string
--- @param active boolean
--- @return string
local function filetype_component(filetype, active)
    if filetype == '' then
        return ''
    end
    local icon, hl = MiniIcons.get('filetype', filetype) --luacheck: ignore
    filetype = icon .. ' ' .. filetype
    if active then
        filetype = '%#' .. hl .. '#' .. filetype
    end
    return filetype
end

local function get_filename()
  local bufname = vim.fn.bufname()
  if bufname == "" then
    return "[No Name]"
  end
  return vim.fn.fnamemodify(bufname, ":t")
end

local function get_modified()
  if vim.bo.modified then
    return " [+]"
  end
  return ""
end

local function get_encoding()
  return vim.bo.fileencoding ~= "" and vim.bo.fileencoding or "utf-8"
end

local function get_position()
   local line = vim.fn.line '.'
   local line_count = vim.api.nvim_buf_line_count(0)
   local col = vim.fn.virtcol '.'

   return table.concat {
       '%#StatusLine#l: ',
       string.format('%d', line),
       string.format('/%d c: %d', line_count, col),
   }
end

local function scrollbar()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local default_chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local chars = default_chars
  local index = 1

  if current_line == 1 then
    index = 1
  elseif current_line == total_lines then
    index = #chars
  else
    local line_no_fraction = vim.fn.floor(current_line) / vim.fn.floor(total_lines)
    index = vim.fn.float2nr(line_no_fraction * #chars)
    if index == 0 then
      index = 1
    end
  end
  return chars[index]
end

function M.statusline()
  local bufnr = vim.api.nvim_get_current_buf()
  local is_active = vim.fn.winwidth(0) > 0
  local mode = vim.fn.mode()

  local mode_str = mode_component(mode, is_active)
  local filename = get_filename()
  local modified = get_modified()
  local diagnostics = diagnostic_component(bufnr, is_active)
  local lsp_status = lsp_clients_component(bufnr)
  local filetype = filetype_component(vim.bo.filetype, is_active)
  local encoding = get_encoding()
  local position = get_position()

  local left = mode_str .. ' %#StatusLine# ' .. filename .. modified .. diagnostics
  local right = lsp_status .. filetype .. '%#StatusLine#' .. separator .. encoding .. separator .. position .. ' ' .. scrollbar()

  return left .. "%=" .. right
end

vim.o.statusline = "%!v:lua.require'statusline'.statusline()"

return M
