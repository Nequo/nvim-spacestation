-- Mies.vim colorscheme (Light variant)
-- Converted to Lua with Claude Sonnet 4.5 from: https://github.com/jaredgorski/Mies.vim
-- Original Author: Jared Gorski <jaredgorski6@gmail.com>
-- License: MIT

-- Options
-- vim.g.mono_color_comments = true  -- Use more colorful comments

local color = {
  chicagoBlack1 = '#080808',
  chicagoBlack2 = '#121212',
  chicagoBlack3 = '#1c1c1c',
  chicagoBlack4 = '#262626',
  chicagoGray1 = '#3E3D32',
  chicagoGray2 = '#49483E',
  chicagoGray3 = '#767676',
  chicagoGray4 = '#949494',
  chicagoGray5 = '#B0B0B0',
  chicagoGray6 = '#C6C6C6',
  chicagoWhite1 = '#D0D0D0',
  chicagoWhite2 = '#FFFFFF',
  chicagoBlue = '#5F8787',
  chicagoMint = '#5FAF87',
  chicagoPurple = '#AF5FAF',
  chicagoPink = '#D75F87',
  chicagoPink2 = '#AF005F',
  chicagoGreen1 = '#008700',
  chicagoGreen2 = '#00af5f',
  chicagoLime = '#87AF00',
  chicagoGold1 = '#8E700B',
  chicagoGold2 = '#D7AF00',
  chicagoBrown = '#5F5F00',
  chicagoRed = '#D70000',
  chicagoOrange = '#D75F00',
}

local function get_highlight_groups()
  local in_diff_mode = vim.opt.diff:get()

  return {
    -- NEOVIM EDITOR
    ColorColumn = { bg = color.chicagoGray4 },
    Cursor = { fg = color.chicagoWhite2, bg = color.chicagoBlack1 },
    CursorColumn = { bg = color.chicagoWhite1 },
    CursorLine = { bg = color.chicagoWhite1 },
    CursorLineNr = { fg = color.chicagoBlack1, bg = color.chicagoGray5 },
    Directory = { fg = color.chicagoBlack1 },
    FoldColumn = { fg = color.chicagoGray6, bg = color.chicagoBlack4 },
    Folded = { fg = color.chicagoGray4 },
    IncSearch = { fg = color.chicagoGold2, bg = color.chicagoGray1 },
    LineNr = { fg = color.chicagoBlack3, bg = color.chicagoGray6 },
    MatchParen = { fg = color.chicagoBlack1, bg = color.chicagoGray4 },
    Normal = { fg = color.chicagoBlack1, bg = color.chicagoWhite2 },
    Pmenu = { fg = color.chicagoBlack1, bg = color.chicagoGray6 },
    PmenuSel = { fg = color.chicagoWhite2, bg = color.chicagoGray4 },
    Search = { fg = color.chicagoGold2, bg = color.chicagoGray1 },
    SignColumn = { bg = color.chicagoGray6 },
    StatusLine = { fg = color.chicagoWhite2, bg = color.chicagoGray1 },
    StatusLineNC = { fg = color.chicagoGray6, bg = color.chicagoGray1 },
    VertSplit = { fg = color.chicagoBlack1, bg = color.chicagoGray3 },
    Visual = { bg = color.chicagoGray5 },

    -- GENERAL SYNTAX
    Boolean = { fg = color.chicagoBlack1 },
    Character = { fg = color.chicagoBlack1 },
    Comment = { fg = vim.g.mono_color_comments and color.chicagoBlue or color.chicagoGray3, italic = true },
    Conditional = { fg = color.chicagoBlack1 },
    Constant = { fg = color.chicagoBlack1 },
    Define = { fg = color.chicagoBlack1 },
    ErrorMsg = { fg = color.chicagoBlack1, bg = color.chicagoRed },
    Float = { fg = color.chicagoBlack1 },
    Function = { fg = color.chicagoBlack1 },
    Identifier = { fg = color.chicagoBlack1 },
    Keyword = { fg = color.chicagoBlack1 },
    Label = { fg = color.chicagoBlack1 },
    NonText = { fg = color.chicagoGray1 },
    Number = { fg = color.chicagoBlack1 },
    Operator = { fg = color.chicagoBlack1 },
    PreProc = { fg = color.chicagoBlack1 },
    Special = { fg = color.chicagoBlack1 },
    SpecialKey = { fg = color.chicagoBlack1 },
    SpellBad = { fg = color.chicagoRed, italic = true, undercurl = true },
    SpellCap = { fg = color.chicagoBlack1, italic = true, undercurl = true },
    SpellLocal = { fg = color.chicagoBlack1, undercurl = true },
    Statement = { fg = color.chicagoBlack1 },
    StorageClass = { fg = color.chicagoBlack1 },
    String = { fg = color.chicagoBlack1 },
    Tag = { fg = color.chicagoBlack1 },
    Title = { bold = true },
    Todo = { fg = color.chicagoGray3, reverse = true, bold = true },
    Type = {},
    Underlined = { underline = true },
    WarningMsg = { fg = color.chicagoGold2, bg = color.chicagoBlack3 },
    Error = { fg = color.chicagoRed },
    Added = { fg = color.chicagoGreen2 },
    Changed = { fg = color.chicagoGold2 },
    Removed = { fg = color.chicagoRed },

    DiagnosticError = { fg = color.chicagoRed },
    DiagnosticWarn = { fg = color.chicagoGold2 },
    DiagnosticInfo = { fg = color.chicagoPink2 },
    DiagnosticHint = { fg = color.chicagoMint },
    DiagnosticOk = { fg = color.chicagoGreen2 },
    DiagnosticUnderlineError = { sp = color.chicagoRed, undercurl = true },
    DiagnosticUnderlineWarn = { sp = color.chicagoGold2, undercurl = true },
    DiagnosticUnderlineInfo = { sp = color.chicagoPink2, undercurl = true },
    DiagnosticUnderlineHint = { sp = color.chicagoMint, undercurl = true },
    DiagnosticUnderlineOk = { sp = color.chicagoGreen2, undercurl = true },

    -- LSP
    LspInlayHint = { fg = color.chicagoGray3, bg = color.chicagoGray6 },

    -- Plugin Mini
    MiniPickMatchRanges = { fg = color.chicagoGold1 },

    -- DIFF HIGHLIGHTING
    DiffAdd = in_diff_mode and {
      fg = color.chicagoWhite2,
      bg = color.chicagoGreen1,
    } or {
      fg = color.chicagoBlack1,
      bg = color.chicagoGreen1,
    },
    DiffChange = in_diff_mode and {
      fg = color.chicagoWhite2,
      bg = color.chicagoBrown,
    } or {
      fg = color.chicagoBlack1,
      bg = color.chicagoGold2,
    },
    DiffDelete = in_diff_mode and {
      fg = color.chicagoRed,
      bg = color.chicagoBrown,
    } or {
      fg = color.chicagoBlack1,
      bg = color.chicagoRed,
    },
    DiffText = { fg = color.chicagoGray1, bg = color.chicagoPurple },

    BufTabLineActive = {
      fg = color.chicagoBlack1,
      bg = color.chicagoGray3,
    },
    BufTabLineCurrent = {
      fg = color.chicagoBlack1,
      bg = color.chicagoGray4,
    },
    BufTabLineFill = {
      fg = color.chicagoBlack1,
      bg = color.chicagoWhite2,
    },
    BufTabLineHidden = {
      fg = color.chicagoGray3,
      bg = color.chicagoBlack3,
    },
  }
end

local function setup()
  vim.cmd 'highlight clear'
  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end
  vim.cmd 'set t_Co=256'
  vim.g.colors_name = 'mono-light'

  local highlight_groups = get_highlight_groups()

  for group, attrs in pairs(highlight_groups) do
    vim.api.nvim_set_hl(0, group, attrs)
  end
end

setup()
