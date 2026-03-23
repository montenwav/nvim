-- transparent
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

-- auto format
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function() vim.lsp.buf.format({ { async = true } }) end,
})

-- spellcheck in md
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  command = 'setlocal spell wrap',
})

-- disable automatic comment on newline
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function() vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' }) end,
})

-- highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function() vim.highlight.on_yank({ timeout = 300 }) end,
})

-- restore cursor pos on file open
-- vim.api.nvim_create_autocmd('BufReadPost', {
--   pattern = '*',
--   callback = function()
--     local line = vim.fn.line('\'"')
--     if line > 1 and line <= vim.fn.line('$') then
--       vim.cmd('normal! g\'"')
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('VimEnter', {
--   callback = function()
--     local startuptime = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
--     vim.g.startup_time_ms = string.format('%.2f ms', startuptime * 1000)
--   end,
-- })
--
-- vim.api.nvim_create_augroup('alpha_on_empty', { clear = true })
-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'BDeletePre *',
--   group = 'alpha_on_empty',
--   callback = function()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local name = vim.api.nvim_buf_get_name(bufnr)
--     if name == '' then
--       vim.cmd([[:Alpha | bd#]])
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
--   pattern = '*',
--   group = augroup,
--   callback = function()
--     if vim.o.nu and vim.api.nvim_get_mode().mode ~= 'i' then
--       vim.opt.relativenumber = true
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
--   pattern = '*',
--   group = augroup,
--   callback = function()
--     if vim.o.nu then
--       vim.opt.relativenumber = false
--       if not vim.tbl_contains({ '@', '-' }, vim.v.event.cmdtype) then
--         vim.cmd('redraw')
--       end
--     end
--   end,
-- })
