" Dark Charcoal
" Quiet syntax highlighting for extended reading.

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'soft-charcoal'

hi Normal       guifg=#B9BCB5 guibg=#343738
hi Comment      guifg=#969F9C gui=NONE
hi Constant     guifg=#C1A6A0 gui=NONE
hi String       guifg=#AEBC9F gui=NONE
hi Character    guifg=#B6C4A0
hi Number       guifg=#C9ACA5
hi Boolean      guifg=#C9ACA5

hi Identifier   guifg=#C6C8C0 gui=NONE
hi Function     guifg=#C0B3A4 gui=NONE
hi Statement    guifg=#9FAFBA gui=NONE
hi Keyword      guifg=#9FAFBA gui=NONE
hi Conditional  guifg=#A4B9CB gui=NONE
hi Repeat       guifg=#A4B9CB gui=NONE
hi Type         guifg=#96B9B5 gui=NONE
hi PreProc      guifg=#BAAFC5 gui=NONE
hi Special      guifg=#C4B6A3 gui=NONE

hi LineNr       guifg=#969F9C guibg=#343738
hi CursorLineNr guifg=#C6C8C0 gui=NONE
hi CursorLine   guibg=#3C4041
hi Visual       guibg=#505D61
hi Search       guifg=#343738 guibg=#AEBC9F
hi IncSearch    guifg=#292C2E guibg=#A4B9CB

hi StatusLine   guifg=#B9BCB5 guibg=#40484B gui=NONE
hi StatusLineNC guifg=#969F9C guibg=#343738 gui=NONE
hi VertSplit    guifg=#353E44 guibg=#292C2E
hi ColorColumn  guibg=#303437

hi Error        guifg=#D5B8B0 gui=NONE
hi WarningMsg   guifg=#C4B6A3 gui=NONE
hi Pmenu        guifg=#C6C8C0 guibg=#353E44
hi PmenuSel     guifg=#E0E1D9 guibg=#45535B
