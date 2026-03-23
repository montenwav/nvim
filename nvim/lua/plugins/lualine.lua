local lualine = require('lualine')

local diff = {
  'diff',
  colored = true,
  symbols = { added = ' ', modified = ' ', removed = ' ' },
}

local mode = {
  'mode',
  fmt = function(str) return '-- ' .. str .. ' --' end,
}

local branch = {
  'branch',
  icon = '',
}

local progress = function()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  -- local chars = { "", "", "" } --adding more chars will still work
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index] .. ' ' .. math.floor(line_ratio * 100) .. '%%'
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'auto', --auto allows for theme switching
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'alpha', 'dashboard' },
    always_divide_middle = true,
  },

  sections = {
    lualine_a = { branch },
    lualine_b = { mode },
    lualine_c = { diagnostics },
    lualine_x = { diff, 'filetype' },
    lualine_y = { 'location' },
    lualine_z = { progress },
  },
  extensions = { 'nvim-tree' },
})

-- transparency override if using old pywal, shouldn't be needed with 16
-- vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })
-- vim.api.nvim_set_hl(0, "lualine_x_normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "lualine_x_inactive", { bg = "none" })
