if !has('gui_running') && &t_Co < 256
  finish
endif

set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'niceberg'


hi! ColorColumn cterm=NONE ctermbg=235 guibg=#20252d
hi! CursorColumn cterm=NONE ctermbg=235 guibg=#20252d
hi! CursorLine cterm=NONE ctermbg=235 guibg=#20252d
hi! Comment ctermfg=242 guifg=#555863
hi! Constant ctermfg=140 guifg=#978fb2
hi! Cursor ctermbg=252 ctermfg=234 guibg=#c6c8d1 guifg=#161821
hi! CursorLineNr ctermbg=237 ctermfg=253 guibg=#252833 guifg=#c3ccdb
hi! Delimiter ctermfg=252 guifg=#c6c8d1
hi! DiffAdd ctermbg=29 ctermfg=158 guibg=#45493e guifg=#c0c5b9
hi! DiffChange ctermbg=23 ctermfg=159 guibg=#384851 guifg=#b3c3cc
hi! DiffDelete ctermbg=95 ctermfg=224 guibg=#53343b guifg=#ceb0b6
hi! DiffText cterm=NONE ctermbg=30 ctermfg=195 gui=NONE guibg=#5b7881 guifg=#c6c8d1
hi! Directory ctermfg=109 guifg=#89b8c2
hi! Error ctermbg=234 ctermfg=203 guibg=#161821 guifg=#e27878
hi! ErrorMsg ctermbg=234 ctermfg=203 guibg=#161821 guifg=#e27878
hi! WarningMsg ctermbg=234 ctermfg=203 guibg=#161821 guifg=#e27878
hi! EndOfBuffer ctermbg=234 ctermfg=236 guibg=#161821 guifg=#242940
hi! NonText ctermbg=234 ctermfg=236 guibg=#161821 guifg=#242940
hi! SpecialKey ctermbg=234 ctermfg=236 guibg=#161821 guifg=#242940
hi! Folded ctermbg=235 ctermfg=245 guibg=#1a1e25 guifg=#55596d
hi! FoldColumn ctermbg=235 ctermfg=239 guibg=#1a1e25 guifg=#55596D
hi! Function ctermfg=110 guifg=#84a0c6
hi! Identifier cterm=NONE ctermfg=109 guifg=#89b8c2
hi! Include ctermfg=110 guifg=#84a0c6
hi! LineNr ctermbg=235 ctermfg=239 guibg=#1a1e25 guifg=#55596D
hi! MatchParen ctermbg=237 ctermfg=255 guibg=#3e445e guifg=#ffffff
hi! MoreMsg ctermfg=150 guifg=#b4be82
hi! Normal ctermbg=234 ctermfg=252 guibg=#161821 guifg=#c6c8d1
hi! Operator ctermfg=110 guifg=#84a0c6
hi! Pmenu ctermbg=236 ctermfg=251 guibg=#3d425b guifg=#c6c8d1
hi! PmenuSbar ctermbg=236 guibg=#3d425b
hi! PmenuSel ctermbg=240 ctermfg=255 guibg=#5b6389 guifg=#eff0f4
hi! PmenuThumb ctermbg=251 guibg=#c6c8d1
hi! PreProc ctermfg=150 guifg=#b4be82
hi! Question ctermfg=150 guifg=#b4be82
hi! QuickFixLine ctermbg=236 ctermfg=252 guibg=#394250 guifg=#c6c8d1
hi! Search ctermbg=216 ctermfg=234 guibg=#e4aa80 guifg=#392313
hi! SignColumn ctermbg=235 ctermfg=239 guibg=#1a1e25 guifg=#55596D
hi! Special ctermfg=150 guifg=#b4be82
hi! SpellBad ctermbg=95 ctermfg=252 gui=undercurl guisp=#e27878
hi! SpellCap ctermbg=24 ctermfg=252 gui=undercurl guisp=#84a0c6
hi! SpellLocal ctermbg=23 ctermfg=252 gui=undercurl guisp=#89b8c2
hi! SpellRare ctermbg=97 ctermfg=252 gui=undercurl guisp=#978fb2
hi! Statement ctermfg=110 gui=NONE guifg=#84a0c6
hi! StatusLine cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#17171b guifg=#818596 term=reverse
hi! StatusLineTerm cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#17171b guifg=#818596 term=reverse
hi! StatusLineNC cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#20252d
hi! StatusLineTermNC cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#20252d
hi! StorageClass ctermfg=110 guifg=#84a0c6
hi! String ctermfg=109 guifg=#89b8c2
hi! Structure ctermfg=110 guifg=#84a0c6
hi! TabLine cterm=NONE ctermbg=233 ctermfg=238 gui=NONE guibg=#20252d guifg=#3e445e
hi! TabLineFill cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#20252d
hi! TabLineSel cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#161821 guifg=#9a9ca5
hi! Title ctermfg=216 gui=NONE guifg=#cbb079
hi! Todo ctermbg=234 ctermfg=150 guibg=#45493e guifg=#b4be82
hi! Type ctermfg=110 gui=NONE guifg=#84a0c6
hi! Underlined cterm=underline ctermfg=110 gui=underline guifg=#84a0c6 term=underline
hi! VertSplit cterm=NONE ctermbg=233 ctermfg=233 gui=NONE guibg=#20252d guifg=#20252d
hi! Visual ctermbg=236 guibg=#394250
hi! WildMenu ctermbg=255 ctermfg=234 guibg=#d4d5db guifg=#17171b
hi! diffAdded ctermfg=150 guifg=#b4be82
hi! diffRemoved ctermfg=203 guifg=#e27878
hi! ALEErrorSign ctermbg=235 ctermfg=203 guibg=#1a1e25 guifg=#e27878
hi! ALEWarningSign ctermbg=235 ctermfg=216 guibg=#1a1e25 guifg=#cbb079
hi! ALEVirtualTextError ctermfg=203 guifg=#e27878
hi! ALEVirtualTextWarning ctermfg=216 guifg=#cbb079
hi! CtrlPMode1 ctermbg=241 ctermfg=234 guibg=#5a5f72 guifg=#17171b
hi! EasyMotionShade ctermfg=239 guifg=#3d425b
hi! EasyMotionTarget ctermfg=150 guifg=#b4be82
hi! EasyMotionTarget2First ctermfg=216 guifg=#cbb079
hi! EasyMotionTarget2Second ctermfg=216 guifg=#cbb079
hi! GitGutterAdd ctermbg=235 ctermfg=150 guibg=#1a1e25 guifg=#b4be82
hi! GitGutterChange ctermbg=235 ctermfg=109 guibg=#1a1e25 guifg=#89b8c2
hi! GitGutterChangeDelete ctermbg=235 ctermfg=109 guibg=#1a1e25 guifg=#89b8c2
hi! GitGutterDelete ctermbg=235 ctermfg=203 guibg=#1a1e25 guifg=#e27878
hi! gitmessengerEndOfBuffer ctermbg=235 ctermfg=239 guibg=#1a1e25 guifg=#55596D
hi! gitmessengerPopupNormal ctermbg=235 ctermfg=252 guibg=#1a1e25 guifg=#c6c8d1
hi! Sneak ctermbg=140 ctermfg=234 guibg=#978fb2 guifg=#161821
hi! SneakScope ctermbg=236 ctermfg=242 guibg=#394250 guifg=#555863
hi! SyntasticErrorSign ctermbg=235 ctermfg=203 guibg=#1a1e25 guifg=#e27878
hi! SyntasticStyleErrorSign ctermbg=235 ctermfg=203 guibg=#1a1e25 guifg=#e27878
hi! SyntasticStyleWarningSign ctermbg=235 ctermfg=216 guibg=#1a1e25 guifg=#cbb079
hi! SyntasticWarningSign ctermbg=235 ctermfg=216 guibg=#1a1e25 guifg=#cbb079
hi! ZenSpace ctermbg=203 guibg=#e27878
hi! nicebergALAccentRed ctermfg=203 guifg=#e27878

hi! link cssBraces Delimiter
hi! link cssClassName Special
hi! link cssClassNameDot Normal
hi! link cssPseudoClassId Special
hi! link cssTagName Statement
hi! link helpHyperTextJump Constant
hi! link htmlArg Constant
hi! link htmlEndTag Statement
hi! link htmlTag Statement
hi! link jsonQuote Normal
hi! link phpVarSelector Identifier
hi! link pythonFunction Title
hi! link rubyDefine Statement
hi! link rubyFunction Title
hi! link rubyInterpolationDelimiter String
hi! link rubySharpBang Comment
hi! link rubyStringDelimiter String
hi! link sassClass Special
hi! link shFunction Normal
hi! link vimContinue Comment
hi! link vimFuncSID vimFunction
hi! link vimFuncVar Normal
hi! link vimFunction Title
hi! link vimGroup Statement
hi! link vimHiGroup Statement
hi! link vimHiTerm Identifier
hi! link vimMapModKey Special
hi! link vimOption Identifier
hi! link vimVar Normal
hi! link xmlAttrib Constant
hi! link xmlAttribPunct Statement
hi! link xmlEndTag Statement
hi! link xmlNamespace Statement
hi! link xmlTag Statement
hi! link xmlTagName Statement
hi! link yamlKeyValueDelimiter Delimiter
hi! link CtrlPPrtCursor Cursor
hi! link CtrlPMatch Title
hi! link CtrlPMode2 StatusLine
hi! link deniteMatched Normal
hi! link deniteMatchedChar Title
hi! link elixirBlockDefinition Statement
hi! link elixirDefine Statement
hi! link elixirDocSigilDelimiter String
hi! link elixirDocTest String
hi! link elixirExUnitMacro Statement
hi! link elixirExceptionDefine Statement
hi! link elixirFunctionDeclaration Title
hi! link elixirKeyword Statement
hi! link elixirModuleDeclaration Normal
hi! link elixirModuleDefine Statement
hi! link elixirPrivateDefine Statement
hi! link elixirStringDelimiter String
hi! link jsFlowMaybe Normal
hi! link jsFlowObject Normal
hi! link jsFlowType PreProc
hi! link graphqlName Normal
hi! link graphqlOperator Normal
hi! link gitmessengerHash Comment
hi! link gitmessengerHeader Statement
hi! link gitmessengerHistory Constant
hi! link jsArrowFunction Operator
hi! link jsClassDefinition Normal
hi! link jsClassFuncName Title
hi! link jsExport Statement
hi! link jsFuncName Title
hi! link jsFutureKeys Statement
hi! link jsFuncCall Normal
hi! link jsGlobalObjects Statement
hi! link jsModuleKeywords Statement
hi! link jsModuleOperators Statement
hi! link jsNull Constant
hi! link jsObjectFuncName Title
hi! link jsObjectKey Identifier
hi! link jsSuper Statement
hi! link jsTemplateBraces Special
hi! link jsUndefined Constant
hi! link markdownBold Special
hi! link markdownCode String
hi! link markdownCodeDelimiter String
hi! link markdownHeadingDelimiter Comment
hi! link markdownRule Comment
hi! link ngxDirective Statement
hi! link plug1 Normal
hi! link plug2 Identifier
hi! link plugDash Comment
hi! link plugMessage Special
hi! link SignifySignAdd GitGutterAdd
hi! link SignifySignChange GitGutterChange
hi! link SignifySignChangeDelete GitGutterChangeDelete
hi! link SignifySignDelete GitGutterDelete
hi! link SignifySignDeleteFirstLine SignifySignDelete
hi! link StartifyBracket Comment
hi! link StartifyFile Identifier
hi! link StartifyFooter Constant
hi! link StartifyHeader Constant
hi! link StartifyNumber Special
hi! link StartifyPath Comment
hi! link StartifySection Statement
hi! link StartifySlash Comment
hi! link StartifySpecial Normal
hi! link svssBraces Delimiter
hi! link swiftIdentifier Normal
hi! link typescriptAjaxMethods Normal
hi! link typescriptBraces Normal
hi! link typescriptEndColons Normal
hi! link typescriptFuncKeyword Statement
hi! link typescriptGlobalObjects Statement
hi! link typescriptHtmlElemProperties Normal
hi! link typescriptIdentifier Statement
hi! link typescriptMessage Normal
hi! link typescriptNull Constant
hi! link typescriptParens Normal

if has('nvim')
  let g:terminal_color_0 = '#20252d'
  let g:terminal_color_1 = '#e27878'
  let g:terminal_color_2 = '#b4be82'
  let g:terminal_color_3 = '#cbb079'
  let g:terminal_color_4 = '#84a0c6'
  let g:terminal_color_5 = '#978fb2'
  let g:terminal_color_6 = '#89b8c2'
  let g:terminal_color_7 = '#c6c8d1'
  let g:terminal_color_8 = '#555863'
  let g:terminal_color_9 = '#e98989'
  let g:terminal_color_10 = '#c0ca8e'
  let g:terminal_color_11 = '#d9bc81'
  let g:terminal_color_12 = '#91acd1'
  let g:terminal_color_13 = '#a59dc3'
  let g:terminal_color_14 = '#95c4ce'
  let g:terminal_color_15 = '#d2d4de'
else
  let g:terminal_ansi_colors = ['#20252d', '#e27878', '#b4be82', '#cbb079', '#84a0c6', '#978fb2', '#89b8c2', '#c6c8d1', '#555863', '#e98989', '#c0ca8e', '#d9bc81', '#91acd1', '#a59dc3', '#95c4ce', '#d2d4de']
endif