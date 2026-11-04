" soft-charcoal.vim - Vim true-color color scheme
set background=dark
hi clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = 'soft-charcoal'
if has('termguicolors') | set termguicolors | endif
hi Normal guifg=#D8DAD7 guibg=#303235
hi CursorLine guibg=#34373A
hi CursorLineNr guifg=#D8DAD7 guibg=#34373A gui=bold
hi LineNr guifg=#ACB5AD guibg=#303235
hi Visual guibg=#41464A
hi Search guifg=#303235 guibg=#D1BE91
hi IncSearch guifg=#303235 guibg=#D1BE91
hi StatusLine guifg=#D8DAD7 guibg=#41464A gui=NONE
hi StatusLineNC guifg=#ACB5AD guibg=#34373A gui=NONE
hi VertSplit guifg=#41464A guibg=#303235
hi Comment guifg=#ACB5AD
hi Constant guifg=#BCAACB
hi String guifg=#DEB09B
hi Character guifg=#DEB09B
hi Number guifg=#BCAACB
hi Identifier guifg=#D8DAD7
hi Function guifg=#A8BFCE
hi Statement guifg=#A8BFCE
hi PreProc guifg=#BCAACB
hi Type guifg=#A6BFA6
hi Special guifg=#A3C4C5
hi Todo guifg=#D1BE91 guibg=#34373A
hi Error guifg=#D5A0A0 guibg=#303235
hi WarningMsg guifg=#D1BE91
hi Directory guifg=#A8BFCE
hi Pmenu guifg=#D8DAD7 guibg=#34373A
hi PmenuSel guifg=#D8DAD7 guibg=#41464A
