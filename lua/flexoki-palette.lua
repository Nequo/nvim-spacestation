-- Flexoki Color Palette
-- Based on https://stephango.com/flexoki
-- https://github.com/kepano/flexoki-neovim/blob/main/lua/flexoki/palette.lua
-- Extended palette with all color values

local base_colors = {
  ['flexoki-black'] = '#100F0F',
  ['flexoki-paper'] = '#FFFCF0',

  ['flexoki-950'] = '#1C1B1A',
  ['flexoki-900'] = '#282726',
  ['flexoki-850'] = '#343331',
  ['flexoki-800'] = '#403E3C',
  ['flexoki-700'] = '#575653',
  ['flexoki-600'] = '#6F6E69',
  ['flexoki-500'] = '#878580',
  ['flexoki-300'] = '#B7B5AC',
  ['flexoki-200'] = '#CECDC3',
  ['flexoki-150'] = '#DAD8CE',
  ['flexoki-100'] = '#E6E4D9',
  ['flexoki-50'] = '#F2F0E5',

  ['flexoki-red-600'] = '#AF3029',
  ['flexoki-red-400'] = '#D14D41',

  ['flexoki-orange-600'] = '#BC5215',
  ['flexoki-orange-400'] = '#DA702C',

  ['flexoki-yellow-600'] = '#AD8301',
  ['flexoki-yellow-400'] = '#D0A215',

  ['flexoki-green-600'] = '#66800B',
  ['flexoki-green-400'] = '#879A39',

  ['flexoki-cyan-600'] = '#24837B',
  ['flexoki-cyan-400'] = '#3AA99F',

  ['flexoki-blue-600'] = '#205EA6',
  ['flexoki-blue-400'] = '#4385BE',

  ['flexoki-purple-600'] = '#5E409D',
  ['flexoki-purple-400'] = '#8B7EC8',

  ['flexoki-magenta-600'] = '#A02F6F',
  ['flexoki-magenta-400'] = '#CE5D97',
}

local variants = {
  dark = {
    bg = base_colors['flexoki-black'],
    bg_2 = base_colors['flexoki-950'],
    ui = base_colors['flexoki-900'],
    ui_2 = base_colors['flexoki-850'],
    ui_3 = base_colors['flexoki-800'],
    tx_3 = base_colors['flexoki-700'],
    tx_2 = base_colors['flexoki-500'],
    tx = base_colors['flexoki-200'],
    re = base_colors['flexoki-red-400'],
    re_2 = base_colors['flexoki-red-600'],
    or_ = base_colors['flexoki-orange-400'],
    or_2 = base_colors['flexoki-orange-600'],
    ye = base_colors['flexoki-yellow-400'],
    ye_2 = base_colors['flexoki-yellow-600'],
    gr = base_colors['flexoki-green-400'],
    gr_2 = base_colors['flexoki-green-600'],
    cy = base_colors['flexoki-cyan-400'],
    cy_2 = base_colors['flexoki-cyan-600'],
    bl = base_colors['flexoki-blue-400'],
    bl_2 = base_colors['flexoki-blue-600'],
    pu = base_colors['flexoki-purple-400'],
    pu_2 = base_colors['flexoki-purple-600'],
    ma = base_colors['flexoki-magenta-400'],
    ma_2 = base_colors['flexoki-magenta-600'],
  },
  light = {
    bg = base_colors['flexoki-paper'],
    bg_2 = base_colors['flexoki-50'],
    ui = base_colors['flexoki-100'],
    ui_2 = base_colors['flexoki-150'],
    ui_3 = base_colors['flexoki-200'],
    tx_3 = base_colors['flexoki-300'],
    tx_2 = base_colors['flexoki-600'],
    tx = base_colors['flexoki-black'],
    re = base_colors['flexoki-red-600'],
    re_2 = base_colors['flexoki-red-400'],
    or_ = base_colors['flexoki-orange-600'],
    or_2 = base_colors['flexoki-orange-400'],
    ye = base_colors['flexoki-yellow-600'],
    ye_2 = base_colors['flexoki-yellow-400'],
    gr = base_colors['flexoki-green-600'],
    gr_2 = base_colors['flexoki-green-400'],
    cy = base_colors['flexoki-cyan-600'],
    cy_2 = base_colors['flexoki-cyan-400'],
    bl = base_colors['flexoki-blue-600'],
    bl_2 = base_colors['flexoki-blue-400'],
    pu = base_colors['flexoki-purple-600'],
    pu_2 = base_colors['flexoki-purple-400'],
    ma = base_colors['flexoki-magenta-600'],
    ma_2 = base_colors['flexoki-magenta-400'],
  },
}

local M = {}

M.dark = function()
  return variants.dark
end

M.light = function()
  return variants.light
end

M.get = function(variant)
  if variant == 'light' then
    return variants.light
  else
    return variants.dark
  end
end

return M
