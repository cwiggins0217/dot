" Dark Charcoal
" Quiet syntax highlighting for extended reading.

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'hard-charcoal'

hi Normal       guifg=#C6C8C0 guibg=#292C2E
hi Comment      guifg=#89928E gui=NONE
hi Constant     guifg=#C9ACA5
hi String       guifg=#B6C4A0
hi Character    guifg=#B6C4A0
hi Number       guifg=#C9ACA5
hi Boolean      guifg=#C9ACA5

hi Identifier   guifg=#C6C8C0 gui=NONE
hi Function     guifg=#C4B6A3 gui=NONE
hi Statement    guifg=#A4B9CB gui=NONE
hi Keyword      guifg=#A4B9CB gui=NONE
hi Conditional  guifg=#A4B9CB gui=NONE
hi Repeat       guifg=#A4B9CB gui=NONE
hi Type         guifg=#96B9B5 gui=NONE
hi PreProc      guifg=#BAAFC5 gui=NONE
hi Special      guifg=#C4B6A3 gui=NONE

hi LineNr       guifg=#89928E guibg=#292C2E
hi CursorLineNr guifg=#C6C8C0 gui=NONE
hi CursorLine   guibg=#303437
hi Visual       guibg=#45535B
hi Search       guifg=#292C2E guibg=#B6C4A0
hi IncSearch    guifg=#292C2E guibg=#A4B9CB

hi StatusLine   guifg=#C6C8C0 guibg=#353E44 gui=NONE
hi StatusLineNC guifg=#89928E guibg=#292C2E gui=NONE
hi VertSplit    guifg=#353E44 guibg=#292C2E
hi ColorColumn  guibg=#303437

hi Error        guifg=#D5B8B0 gui=NONE
hi WarningMsg   guifg=#C4B6A3 gui=NONE
hi Pmenu        guifg=#C6C8C0 guibg=#353E44
hi PmenuSel     guifg=#E0E1D9 guibg=#45535B
