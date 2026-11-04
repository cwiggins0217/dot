vim.opt.runtimepath:prepend(vim.env.HOME .. '/.vim')
vim.opt.runtimepath:append(vim.env.HOME  .. '/.vim/after')
vim.opt.packpath = vim.opt.runtimepath:get()

-- read vimrc for main config
vim.cmd('source ~/.vimrc')

vim.opt.modeline = false
vim.opt.modelines = 0
vim.opt.laststatus = 0

vim.fn.sign_define('DiagnosticSignError', { text = '🔥', texthl = 'DiagnosticError' })
vim.fn.sign_define('DiagnosticSignWarn',  { text = '❗️', texthl = 'DiagnosticWarn' })
vim.fn.sign_define('DiagnosticSignInfo',  { text = '✨', texthl = 'DiagnosticInfo' })
vim.fn.sign_define('DiagnosticSignHint',  { text = '💡', texthl = 'DiagnosticHint' })
