local M = {}

M.arrows = {
  right = '',
  left = '',
  up = '',
  down = '',
}

--- LSP symbol kinds.
M.symbol_kinds = {
  Array = '󰅪',
  Class = '',
  Color = '󰏘',
  Constant = '󰏿',
  Constructor = '',
  Enum = '',
  EnumMember = '',
  Event = '',
  Field = '󰜢',
  File = '󰈙',
  Folder = '󰉋',
  Function = '󰆧',
  Interface = '',
  Keyword = '󰌋',
  Method = '󰆧',
  Module = '',
  Operator = '󰆕',
  Property = '󰜢',
  Reference = '󰈇',
  Snippet = '',
  Struct = '',
  Text = '',
  TypeParameter = '',
  Unit = '',
  Value = '',
  Variable = '󰀫',
}

M.misc = {
  bug = ' ',
  git = '',
  palette = '󰏘',
  robot = '󰚩',
  search = '',
  terminal = '',
  toolbox = '󰦬',
  lightbulb = '󰌵',
  telescope = ' ',
  cog = ' ',
  info = ' ',
  warning = ' ',
  error = '󰅙 ',
}

return M
