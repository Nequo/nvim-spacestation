-- Mies.vim colorscheme
-- Converted to Lua with Claude Sonnet 4.5 from: https://github.com/jaredgorski/Mies.vim
-- Original Author: Jared Gorski <jaredgorski6@gmail.com>
-- License: MIT

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

local dark = {
  bg = color.chicagoBlack2,
  bg_cursor_line = color.chicagoBlack4,
  bg_cursor_col = color.chicagoBlack3,
  bg_sign_col = color.chicagoBlack3,
  bg_pmenu = color.chicagoBlack4,
  bg_pmenu_sel = color.chicagoGray2,
  bg_status_line = color.chicagoWhite1,
  bg_status_line_nc = color.chicagoGray5,
  bg_visual = color.chicagoGray2,
  bg_color_col = color.chicagoGray2,
  bg_line_nr = color.chicagoBlack4,
  bg_cursor_line_nr = color.chicagoGray1,
  bg_fold_col = color.chicagoBlack2,

  fg = color.chicagoWhite1,
  fg_cursor = color.chicagoBlack2,
  fg_line_nr = color.chicagoGray4,
  fg_cursor_line_nr = color.chicagoWhite1,
  fg_comment = color.chicagoGray3,
  fg_status_line = color.chicagoBlack2,
  fg_status_line_nc = color.chicagoGray1,
  fg_vert_split = color.chicagoBlack2,
  fg_match_paren = color.chicagoWhite1,
  fg_fold_col = color.chicagoGray6,
  fg_non_text = color.chicagoGray3,

  bg_search = color.chicagoGold1,
  fg_search = color.chicagoBlack2,
  fg_match = color.chicagoGold2,

  diff_add_bg = color.chicagoGreen2,
  diff_add_fg = color.chicagoBlack2,
  diff_change_bg = color.chicagoGold1,
  diff_change_fg = color.chicagoBlack2,
  diff_delete_bg = color.chicagoRed,
  diff_delete_fg = color.chicagoWhite1,
  diff_text_bg = color.chicagoPurple,
  diff_text_fg = color.chicagoBlack2,

  diff_mode_add_bg = color.chicagoGreen2,
  diff_mode_add_fg = color.chicagoBlack2,
  diff_mode_change_bg = color.chicagoGold1,
  diff_mode_change_fg = color.chicagoBlack2,
  diff_mode_delete_bg = color.chicagoBrown,
  diff_mode_delete_fg = color.chicagoRed,

  error_msg_bg = color.chicagoRed,
  error_msg_fg = color.chicagoWhite1,
  warning_msg_bg = color.chicagoGold1,
  warning_msg_fg = color.chicagoBlack2,

  match_paren_bg = color.chicagoGray3,
}

local light = {
  bg = color.chicagoWhite2,
  bg_cursor_line = color.chicagoWhite1,
  bg_cursor_col = color.chicagoWhite1,
  bg_sign_col = color.chicagoGray6,
  bg_pmenu = color.chicagoGray6,
  bg_pmenu_sel = color.chicagoGray4,
  bg_status_line = color.chicagoGray1,
  bg_status_line_nc = color.chicagoGray1,
  bg_visual = color.chicagoGray5,
  bg_color_col = color.chicagoGray4,
  bg_line_nr = color.chicagoGray6,
  bg_cursor_line_nr = color.chicagoGray5,
  bg_fold_col = color.chicagoBlack4,

  fg = color.chicagoBlack1,
  fg_cursor = color.chicagoWhite2,
  fg_line_nr = color.chicagoBlack3,
  fg_cursor_line_nr = color.chicagoBlack1,
  fg_comment = color.chicagoGray3,
  fg_status_line = color.chicagoWhite2,
  fg_status_line_nc = color.chicagoGray6,
  fg_vert_split = color.chicagoBlack1,
  fg_match_paren = color.chicagoBlack1,
  fg_fold_col = color.chicagoGray6,
  fg_non_text = color.chicagoGray1,

  bg_search = color.chicagoGray1,
  fg_search = color.chicagoGold2,
  fg_match = color.chicagoGold1,

  diff_add_bg = color.chicagoGreen1,
  diff_add_fg = color.chicagoBlack1,
  diff_change_bg = color.chicagoGold2,
  diff_change_fg = color.chicagoBlack1,
  diff_delete_bg = color.chicagoRed,
  diff_delete_fg = color.chicagoBlack1,
  diff_text_bg = color.chicagoPurple,
  diff_text_fg = color.chicagoGray1,

  diff_mode_add_bg = color.chicagoGreen1,
  diff_mode_add_fg = color.chicagoWhite2,
  diff_mode_change_bg = color.chicagoBrown,
  diff_mode_change_fg = color.chicagoWhite2,
  diff_mode_delete_bg = color.chicagoBrown,
  diff_mode_delete_fg = color.chicagoRed,

  error_msg_bg = color.chicagoRed,
  error_msg_fg = color.chicagoBlack1,
  warning_msg_bg = color.chicagoBlack3,
  warning_msg_fg = color.chicagoGold2,

  match_paren_bg = color.chicagoGray4,
}

local function get_highlight_groups(theme)
  local in_diff_mode = vim.opt.diff:get()

  return {
    -- NEOVIM EDITOR
    ColorColumn = { bg = theme.bg_color_col },
    Cursor = { fg = theme.fg_cursor, bg = theme.fg },
    CursorColumn = { bg = theme.bg_cursor_col },
    CursorLine = { bg = theme.bg_cursor_line },
    CursorLineNr = { fg = theme.fg_cursor_line_nr, bg = theme.bg_cursor_line_nr },
    Directory = { fg = theme.fg },
    FoldColumn = { fg = theme.fg_fold_col, bg = theme.bg_fold_col },
    Folded = { fg = color.chicagoGray4 },
    IncSearch = { fg = theme.fg_search, bg = theme.bg_search },
    LineNr = { fg = theme.fg_line_nr, bg = theme.bg_line_nr },
    MatchParen = { fg = theme.fg_match_paren, bg = theme.match_paren_bg },
    Normal = { fg = theme.fg, bg = theme.bg },
    Pmenu = { fg = theme.fg, bg = theme.bg_pmenu },
    PmenuSel = { fg = color.chicagoWhite2, bg = theme.bg_pmenu_sel },
    Search = { fg = theme.fg_search, bg = theme.bg_search },
    SignColumn = { bg = theme.bg_sign_col },
    StatusLine = { fg = theme.fg_status_line, bg = theme.bg_status_line },
    StatusLineNC = { fg = theme.fg_status_line_nc, bg = theme.bg_status_line_nc },
    VertSplit = { fg = theme.fg_vert_split, bg = color.chicagoGray3 },
    Visual = { bg = theme.bg_visual },

    -- GENERAL SYNTAX
    Boolean = { fg = theme.fg },
    Character = { fg = theme.fg },
    Comment = { fg = theme.fg_comment, italic = true },
    Conditional = { fg = theme.fg },
    Constant = { fg = theme.fg },
    Define = { fg = theme.fg },
    ErrorMsg = { fg = theme.error_msg_fg, bg = theme.error_msg_bg },
    Float = { fg = theme.fg },
    Function = { fg = theme.fg },
    Identifier = { fg = theme.fg },
    Keyword = { fg = theme.fg },
    Label = { fg = theme.fg },
    NonText = { fg = theme.fg_non_text },
    Number = { fg = theme.fg },
    Operator = { fg = theme.fg },
    PreProc = { fg = theme.fg },
    Special = { fg = theme.fg },
    SpecialKey = { fg = theme.fg },
    SpellBad = { fg = color.chicagoRed, italic = true, undercurl = true },
    SpellCap = { fg = theme.fg, italic = true, undercurl = true },
    SpellLocal = { fg = theme.fg, undercurl = true },
    Statement = { fg = theme.fg },
    StorageClass = { fg = theme.fg },
    String = { fg = theme.fg },
    Tag = { fg = theme.fg },
    Title = { bold = true },
    Todo = { fg = theme.fg_comment, reverse = true, bold = true },
    Type = {},
    Underlined = { underline = true },
    WarningMsg = { fg = theme.warning_msg_fg, bg = theme.warning_msg_bg },
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
    LspInlayHint = { fg = theme.fg_comment, bg = theme.bg_sign_col },

    -- Plugin Mini
    MiniPickMatchRanges = { fg = theme.fg_match },

    -- DIFF HIGHLIGHTING
    DiffAdd = in_diff_mode and {
      fg = theme.diff_mode_add_fg,
      bg = theme.diff_mode_add_bg,
    } or {
      fg = theme.diff_add_fg,
      bg = theme.diff_add_bg,
    },
    DiffChange = in_diff_mode and {
      fg = theme.diff_mode_change_fg,
      bg = theme.diff_mode_change_bg,
    } or {
      fg = theme.diff_change_fg,
      bg = theme.diff_change_bg,
    },
    DiffDelete = in_diff_mode and {
      fg = theme.diff_mode_delete_fg,
      bg = theme.diff_mode_delete_bg,
    } or {
      fg = theme.diff_delete_fg,
      bg = theme.diff_delete_bg,
    },
    DiffText = { fg = theme.diff_text_fg, bg = theme.diff_text_bg },

    BufTabLineActive = vim.o.background == 'dark' and {
      fg = color.chicagoWhite1,
      bg = color.chicagoGray2,
    } or {
      fg = color.chicagoBlack1,
      bg = color.chicagoGray3,
    },
    BufTabLineCurrent = vim.o.background == 'dark' and {
      fg = color.chicagoBlack2,
      bg = color.chicagoGray5,
    } or {
      fg = color.chicagoBlack1,
      bg = color.chicagoGray4,
    },
    BufTabLineFill = vim.o.background == 'dark' and {
      fg = color.chicagoBlack2,
      bg = color.chicagoBlack2,
    } or {
      fg = color.chicagoBlack1,
      bg = color.chicagoWhite2,
    },
    BufTabLineHidden = vim.o.background == 'dark' and {
      fg = color.chicagoGray3,
      bg = color.chicagoBlack4,
    } or {
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
  vim.g.colors_name = 'mono'

  local background = vim.api.nvim_get_option 'background'
  local theme = background == 'dark' and dark or light
  local highlight_groups = get_highlight_groups(theme)

  for group, attrs in pairs(highlight_groups) do
    vim.api.nvim_set_hl(0, group, attrs)
  end
end

setup()
