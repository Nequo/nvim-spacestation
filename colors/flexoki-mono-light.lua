-- Flexoki Monochrome Light colorscheme
-- Based on Flexoki (https://stephango.com/flexoki) with monochromatic syntax highlighting
-- Original mono concept from Mies.vim: https://github.com/jaredgorski/Mies.vim
-- License: MIT

-- Options
-- vim.g.mono_color_comments = true  -- Use cyan for comments

local palette = require('flexoki-palette')
local c = palette.light()

local function get_highlight_groups()
  local in_diff_mode = vim.opt.diff:get()

  return {
    -- NEOVIM EDITOR
    Normal = { fg = c.tx, bg = c.bg },
    NormalNC = { fg = 'NONE', bg = 'NONE' },
    ColorColumn = { bg = c.ui },
    Cursor = { fg = c.bg, bg = c.tx },
    CursorColumn = { bg = c.bg_2 },
    CursorLine = { bg = c.ui, blend = 65 },
    CursorLineNr = { fg = c.tx, bg = 'NONE', bold = true },
    CursorIM = { fg = c.bg, bg = c.tx },
    TermCursor = { fg = c.bg, bg = c.tx },
    TermCursorNC = { fg = c.bg, bg = c.tx_3 },
    Directory = { fg = c.bl },
    EndOfBuffer = { fg = 'NONE', bg = 'NONE' },
    FoldColumn = { fg = c.ui_2, bg = c.bg_2 },
    Folded = { fg = c.ui_2, bg = c.bg_2 },
    IncSearch = { fg = c.bg, bg = c.ye_2, blend = 50 },
    CurSearch = { fg = c.bg, bg = c.ye_2, blend = 50 },
    Substitute = { fg = c.bg, bg = c.gr, blend = 50 },
    LineNr = { fg = c.tx_3, bg = c.ui },
    MatchParen = { fg = 'NONE', bg = c.ui },
    MatchWord = { fg = 'NONE', bg = c.ui },
    MatchWordCur = { fg = 'NONE', bg = 'NONE' },
    MatchParenCur = { fg = 'NONE', bg = 'NONE' },
    Pmenu = { fg = c.tx_2, bg = c.bg_2, blend = 50 },
    PmenuSel = { fg = c.bg, bg = c.cy_2 },
    PmenuSbar = { fg = 'NONE', bg = c.ui },
    PmenuThumb = { fg = 'NONE', bg = c.ui_3 },
    Search = { fg = c.bg, bg = c.ye },
    SignColumn = { fg = 'NONE', bg = c.ui },
    StatusLine = { fg = c.tx, bg = c.ui_3 },
    StatusLineNC = { fg = c.tx_2, bg = c.ui },
    StatusLineTerm = { fg = c.tx_2, bg = c.ui_3 },
    StatusLineTermNC = { fg = c.tx_2, bg = c.ui_3 },
    TabLine = { fg = c.tx_2, bg = c.ui },
    TabLineSel = { fg = c.tx, bg = c.ui_3 },
    TabLineFill = { fg = c.tx_3, bg = c.ui },
    VertSplit = { fg = c.bg_2, bg = c.bg_2 },
    WinBar = { fg = c.tx, bg = c.ui_3 },
    WinBarNC = { fg = c.tx_2, bg = c.ui },
    WinSeparator = { fg = c.bg_2, bg = c.bg_2 },
    WinSeparatorNC = { fg = c.ui_3, bg = c.ui_3 },
    Visual = { fg = 'NONE', bg = c.ui_2 },
    VisualNOS = { fg = 'NONE', bg = c.ui_3 },
    NormalFloat = { fg = c.tx_2, bg = c.bg },
    FloatBorder = { fg = c.tx_3, bg = c.bg },

    -- GENERAL SYNTAX (monochromatic)
    Boolean = { fg = c.tx },
    Character = { fg = c.tx },
    Comment = { fg = vim.g.mono_color_comments and c.cy or c.tx_3, italic = false },
    Conditional = { fg = c.tx },
    Constant = { fg = c.tx },
    Define = { fg = c.tx },
    Float = { fg = c.tx },
    Function = { fg = c.tx },
    Identifier = { fg = c.tx },
    Keyword = { fg = c.tx },
    Label = { fg = c.tx },
    NonText = { fg = c.tx_3 },
    Number = { fg = c.tx },
    Operator = { fg = c.tx },
    PreProc = { fg = c.tx },
    Special = { fg = c.tx },
    SpecialKey = { fg = c.bl, bold = true },
    SpecialComment = { fg = c.tx, bg = 'NONE' },
    SpecialChar = { fg = c.ma, bg = 'NONE' },
    SpellBad = { fg = c.re, underline = true },
    SpellCap = { fg = c.tx, underline = true },
    SpellLocal = { fg = c.tx, underline = true },
    SpellRare = { fg = c.pu, underline = true },
    Statement = { fg = 'NONE', bg = 'NONE' },
    StorageClass = { fg = c.tx },
    String = { fg = c.tx },
    Structure = { fg = c.tx },
    Typedef = { fg = c.tx },
    Tag = { fg = c.tx },
    Title = { fg = c.bl, bold = true },
    Todo = { fg = c.ma, bold = true },
    Type = { fg = 'NONE', bg = 'NONE' },
    Underlined = { underline = true },
    WarningMsg = { fg = c.re, bg = c.bg },
    ErrorMsg = { fg = c.re, bg = 'NONE', bold = true },
    MoreMsg = { fg = c.or_, bg = 'NONE' },
    Question = { fg = c.or_, bg = 'NONE' },
    Error = { fg = c.re, bg = c.bg, bold = true },
    Added = { fg = c.gr },
    Changed = { fg = c.or_ },
    Removed = { fg = c.re },
    Conceal = { fg = 'NONE', bg = 'NONE' },
    MsgArea = { fg = 'NONE', bg = c.bg_2 },
    ModeMsg = { fg = 'NONE', bg = c.bg_2 },
    MsgSeparator = { fg = 'NONE', bg = c.bg_2 },
    WildMenu = { fg = 'NONE', bg = c.cy_2 },
    QuickFixLine = { fg = 'NONE', bg = c.ui },
    Whitespace = { fg = c.tx_3, bg = 'NONE' },

    -- Syntax linking (monochromatic - most link to Statement)
    Repeat = { link = 'Keyword' },
    Exception = { link = 'Keyword' },
    Include = { fg = c.re, bg = 'NONE' },
    Macro = { fg = c.ma, bg = 'NONE' },
    PreCondit = { fg = c.ma, bg = 'NONE' },
    Debug = { fg = c.ma, bg = 'NONE' },
    Delimiter = { link = 'Special' },

    -- DIAGNOSTICS
    DiagnosticError = { fg = c.re },
    DiagnosticWarn = { fg = c.ye },
    DiagnosticInfo = { fg = c.cy },
    DiagnosticHint = { fg = c.bl },
    DiagnosticOk = { fg = c.gr },
    DiagnosticUnderlineError = { sp = c.re, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.ye, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.cy, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.bl, undercurl = true },
    DiagnosticUnderlineOk = { sp = c.gr, undercurl = true },

    -- LSP
    LspInlayHint = { fg = c.tx_3, bg = c.ui },

    -- MINI.NVIM
    MiniCompletionActiveParameter = { underline = true },
    MiniCursorword = { bg = c.ui },
    MiniCursorwordCurrent = { bg = 'NONE' },
    MiniIndentscopeSymbol = { fg = c.ui_3, bg = 'NONE' },
    MiniIndentscopeSymbolOff = { fg = c.ui_3, bg = 'NONE' },
    MiniJump = { fg = c.bg, bg = c.cy },
    MiniJump2dSpot = { fg = c.bg, bg = c.cy },
    MiniJump2dSpotUnique = { fg = c.bg, bg = c.cy },
    MiniJump2dSpotAhead = { fg = c.bg, bg = c.cy_2 },
    MiniJump2dSpotDim = { link = 'Comment' },
    MiniTrailspace = { fg = c.re, bg = c.re },
    MiniTablineCurrent = { fg = c.cy, bg = c.ui_3 },
    MiniTablineVisible = { fg = c.tx_2, bg = c.ui_2 },
    MiniTablineHidden = { fg = c.tx_2, bg = c.ui },
    MiniTablineModifiedCurrent = { fg = c.or_, bg = c.ui_3 },
    MiniTablineModifiedVisible = { fg = c.or_, bg = c.ui_2 },
    MiniTablineModifiedHidden = { fg = c.or_2, bg = c.ui },
    MiniTablineFill = { fg = 'NONE', bg = c.bg_2 },
    MiniTablineTabpagesection = { fg = c.tx, bg = c.cy_2 },
    MiniSurround = { link = 'Search' },
    MiniStatuslineModeNormal = { fg = c.bg, bg = c.ye },
    MiniStatuslineModeInsert = { fg = c.bg, bg = c.cy },
    MiniStatuslineModeVisual = { fg = c.bg, bg = c.gr },
    MiniStatuslineModeReplace = { fg = c.bg, bg = c.re },
    MiniStatuslineModeCommand = { fg = c.bg, bg = c.bl },
    MiniStatuslineModeOther = { fg = c.bg, bg = c.ma },
    MiniStatuslineDevinfo = { fg = c.tx, bg = c.ui_2 },
    MiniStatuslineFilename = { fg = c.tx_2, bg = c.ui },
    MiniStatuslineFileinfo = { fg = c.tx, bg = c.ui_2 },
    MiniStarterCurrent = { fg = 'NONE', bg = c.bg_2 },
    MiniStarterFooter = { fg = c.tx, bg = 'NONE' },
    MiniStarterHeader = { fg = c.tx, bg = 'NONE' },
    MiniStarterInactive = { fg = c.ui, bg = 'NONE' },
    MiniStarterItem = { fg = c.tx, bg = 'NONE' },
    MiniStarterItemBullet = { fg = c.tx, bg = 'NONE' },
    MiniStarterItemPrefix = { fg = c.cy, bg = 'NONE' },
    MiniStarterSection = { fg = c.tx_3, bg = 'NONE' },
    MiniStarterQuery = { fg = c.tx, bg = 'NONE' },
    MiniPickBorder = { fg = c.ui_3, bg = c.bg },
    MiniPickBorderBusy = { fg = c.ui, bg = c.bg },
    MiniPickBorderText = { fg = c.tx, bg = c.bg },
    MiniPickIconDirectory = { fg = c.bl, bg = c.bg },
    MiniPickIconFile = { fg = c.cy, bg = c.bg },
    MiniPickHeader = { fg = c.tx, bg = c.bg },
    MiniPickMatchCurrent = { fg = 'NONE', bg = c.ui_2 },
    MiniPickMatchMarked = { fg = c.bl, bg = c.bg },
    MiniPickMatchRanges = { fg = c.ye, bg = c.bg },
    MiniPickNormal = { fg = c.tx, bg = 'NONE' },
    MiniPickPreviewLine = { link = 'Visual' },
    MiniPickPreviewRegion = { link = 'Visual' },
    MiniPickPrompt = { fg = c.tx, bg = c.bg },
    MiniOperatorsExchangeFrom = { fg = c.tx, bg = c.re },
    MiniMapNormal = { fg = c.tx_3, bg = c.bg_2 },
    MiniMapSymbolCount = { fg = c.tx, bg = c.bg },
    MiniMapSymbolLine = { fg = c.tx_2, bg = c.bg_2 },
    MiniMapSymbolView = { fg = c.tx_2, bg = c.bg_2 },

    -- DIFF HIGHLIGHTING
    DiffAdd = in_diff_mode and {
      fg = c.bg,
      bg = c.gr,
    } or {
      fg = c.bg,
      bg = c.gr,
    },
    DiffChange = in_diff_mode and {
      fg = c.bg_2,
      bg = c.pu,
    } or {
      fg = c.bg_2,
      bg = c.pu,
    },
    DiffDelete = in_diff_mode and {
      fg = c.re,
      bg = c.bg_2,
    } or {
      fg = c.bg_2,
      bg = c.re,
    },
    DiffText = { fg = c.bg, bg = c.bl_2 },
  }
end

local function setup()
  vim.cmd 'highlight clear'
  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end
  vim.cmd 'set t_Co=256'
  vim.o.background = 'light'
  vim.g.colors_name = 'flexoki-mono-light'

  local highlight_groups = get_highlight_groups()

  for group, attrs in pairs(highlight_groups) do
    vim.api.nvim_set_hl(0, group, attrs)
  end
end

setup()
