vim.opt.runtimepath:prepend(vim.env.HOME .. '/.vim')
vim.opt.runtimepath:append(vim.env.HOME  .. '/.vim/after')
vim.opt.packpath = vim.opt.runtimepath:get()

vim.cmd('source ~/.vimrc')

vim.cmd [[
        highlight Normal guibg=NONE
        highlight NonText guibg=NONE
]]

vim.fn.sign_define('DiagnosticSignError', { text = '🔥', texthl = 'DiagnosticError' })
vim.fn.sign_define('DiagnosticSignWarn',  { text = '❗️', texthl = 'DiagnosticWarn' })
vim.fn.sign_define('DiagnosticSignInfo',  { text = '✨', texthl = 'DiagnosticInfo' })
vim.fn.sign_define('DiagnosticSignHint',  { text = '💡', texthl = 'DiagnosticHint' })

vim.cmd("highlight Cursor guibg=#928374 guifg=NONE")
