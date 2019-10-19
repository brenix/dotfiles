if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "faded"
let s:faded_vim_version="0.0.1"
set background=dark

let s:faded0_gui = "#252933"
let s:faded1_gui = "#3B4252"
let s:faded2_gui = "#434C5E"
let s:faded3_gui = "#4C566A"
let s:faded4_gui = "#D8DEE9"
let s:faded5_gui = "#E5E9F0"
let s:faded6_gui = "#ECEFF4"
let s:faded7_gui = "#7daea9"
let s:faded8_gui = "#83a2be"
let s:faded9_gui = "#81A1C1"
let s:faded10_gui = "#5E81AC"
let s:faded11_gui = "#B77A76"
let s:faded12_gui = "#D08770"
let s:faded13_gui = "#CBB079"
let s:faded14_gui = "#B4BF86"
let s:faded15_gui = "#958090"
let s:faded16_gui = "#6D7585"

let s:faded1_term = "0"
let s:faded3_term = "8"
let s:faded5_term = "7"
let s:faded6_term = "15"
let s:faded7_term = "14"
let s:faded8_term = "6"
let s:faded9_term = "4"
let s:faded10_term = "12"
let s:faded11_term = "1"
let s:faded12_term = "11"
let s:faded13_term = "3"
let s:faded14_term = "2"
let s:faded15_term = "5"

if !exists("g:faded_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:faded_italic=1
  else
    let g:faded_italic=0
  endif
endif

let s:italic = "italic,"
if g:faded_italic == 0
  let s:italic = ""
endif

let s:italicize_comments = ""
if exists("g:faded_italic_comments")
  if g:faded_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:faded_uniform_status_lines')
  let g:faded_uniform_status_lines = 0
endif

if !exists("g:faded_comment_brightness")
  let g:faded_comment_brightness = 0
endif

if !exists("g:faded_uniform_diff_background")
  let g:faded_uniform_diff_background = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", "bold", "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", "underline", "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:faded1_gui, "NONE", s:faded1_term, "", "")
call s:hi("Cursor", s:faded0_gui, s:faded4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:faded1_gui, "NONE", s:faded1_term, "NONE", "")
call s:hi("Error", s:faded0_gui, s:faded11_gui, "", s:faded11_term, "", "")
call s:hi("iCursor", s:faded0_gui, s:faded4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:faded3_gui, s:faded0_gui, 234, s:faded1_term, "", "")
call s:hi("MatchParen", s:faded8_gui, s:faded3_gui, s:faded8_term, s:faded3_term, "", "")
call s:hi("NonText", s:faded2_gui, "", s:faded3_term, "", "", "")
call s:hi("Normal", s:faded4_gui, s:faded0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:faded4_gui, s:faded2_gui, "NONE", s:faded1_term, "NONE", "")
call s:hi("PmenuSbar", s:faded4_gui, s:faded2_gui, "NONE", s:faded1_term, "", "")
call s:hi("PMenuSel", s:faded8_gui, s:faded3_gui, s:faded8_term, s:faded3_term, "", "")
call s:hi("PmenuThumb", s:faded8_gui, s:faded3_gui, "NONE", s:faded3_term, "", "")
call s:hi("SpecialKey", s:faded3_gui, "", s:faded3_term, "", "", "")
call s:hi("SpellBad", "", s:faded0_gui, "", "NONE", "undercurl", s:faded11_gui)
call s:hi("SpellCap", "", s:faded0_gui, "", "NONE", "undercurl", s:faded13_gui)
call s:hi("SpellLocal", "", s:faded0_gui, "", "NONE", "undercurl", s:faded5_gui)
call s:hi("SpellRare", "", s:faded0_gui, "", "NONE", "undercurl", s:faded6_gui)
call s:hi("Visual", "", s:faded2_gui, "", s:faded1_term, "", "")
call s:hi("VisualNOS", "", s:faded2_gui, "", s:faded1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:faded11_gui, s:faded1_gui, s:faded11_term, s:faded1_term, "", "")
call s:hi("healthSuccess", s:faded14_gui, s:faded1_gui, s:faded14_term, s:faded1_term, "", "")
call s:hi("healthWarning", s:faded13_gui, s:faded1_gui, s:faded13_term, s:faded1_term, "", "")

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:faded1_gui
  let g:terminal_color_1 = s:faded11_gui
  let g:terminal_color_2 = s:faded14_gui
  let g:terminal_color_3 = s:faded13_gui
  let g:terminal_color_4 = s:faded9_gui
  let g:terminal_color_5 = s:faded15_gui
  let g:terminal_color_6 = s:faded8_gui
  let g:terminal_color_7 = s:faded5_gui
  let g:terminal_color_8 = s:faded3_gui
  let g:terminal_color_9 = s:faded11_gui
  let g:terminal_color_10 = s:faded14_gui
  let g:terminal_color_11 = s:faded13_gui
  let g:terminal_color_12 = s:faded9_gui
  let g:terminal_color_13 = s:faded15_gui
  let g:terminal_color_14 = s:faded7_gui
  let g:terminal_color_15 = s:faded6_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:faded1_gui, "NONE", s:faded1_term, "", "")
call s:hi("CursorLineNr", s:faded3_gui, s:faded0_gui, 3, s:faded1_term, "", "")
call s:hi("Folded", s:faded3_gui, s:faded0_gui, s:faded3_term, s:faded1_term, "bold", "")
call s:hi("FoldColumn", s:faded3_gui, s:faded0_gui, s:faded3_term, s:faded1_term, "", "")
call s:hi("SignColumn", s:faded1_gui, s:faded0_gui, s:faded3_term, s:faded1_term, "", "")

"+--- Navigation ---+
call s:hi("Directory", s:faded8_gui, "", s:faded8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:faded1_gui, "", s:faded1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:faded4_gui, s:faded11_gui, "NONE", s:faded11_term, "", "")
call s:hi("ModeMsg", s:faded4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:faded4_gui, "", "", "", "", "")
call s:hi("Question", s:faded4_gui, "", "NONE", "", "", "")
if g:faded_uniform_status_lines == 0
  call s:hi("StatusLine", s:faded8_gui, s:faded3_gui, s:faded8_term, s:faded3_term, "NONE", "")
  call s:hi("StatusLineNC", s:faded4_gui, s:faded1_gui, "NONE", s:faded1_term, "NONE", "")
else
  call s:hi("StatusLine", s:faded8_gui, s:faded3_gui, s:faded8_term, s:faded3_term, "NONE", "")
  call s:hi("StatusLineNC", s:faded4_gui, s:faded3_gui, "NONE", s:faded3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:faded0_gui, s:faded13_gui, s:faded1_term, s:faded13_term, "", "")
call s:hi("WildMenu", s:faded8_gui, s:faded1_gui, s:faded8_term, s:faded1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:faded1_gui, s:faded8_gui, s:faded1_term, s:faded8_term, "underline", "")
call s:hi("Search", s:faded1_gui, s:faded8_gui, s:faded1_term, s:faded8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:faded4_gui, s:faded1_gui, "NONE", s:faded1_term, "NONE", "")
call s:hi("TabLineFill", s:faded4_gui, s:faded1_gui, "NONE", s:faded1_term, "NONE", "")
call s:hi("TabLineSel", s:faded8_gui, s:faded3_gui, s:faded8_term, s:faded3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:faded4_gui, "", "NONE", "", "NONE", "")
call s:hi("VertSplit", s:faded2_gui, s:faded1_gui, s:faded3_term, s:faded1_term, "NONE", "")

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("Character", s:faded14_gui, "", s:faded14_term, "", "", "")
call s:hi("Comment", s:faded16_gui, "", "NONE", "", s:italicize_comments, "")
call s:hi("Conditional", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("Constant", s:faded4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("Delimiter", s:faded6_gui, "", s:faded6_term, "", "", "")
call s:hi("Exception", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("Float", s:faded15_gui, "", s:faded15_term, "", "", "")
call s:hi("Function", s:faded8_gui, "", s:faded8_term, "", "", "")
call s:hi("Identifier", s:faded4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("Keyword", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("Label", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("Number", s:faded15_gui, "", s:faded15_term, "", "", "")
call s:hi("Operator", s:faded9_gui, "", s:faded9_term, "", "NONE", "")
call s:hi("PreProc", s:faded9_gui, "", s:faded9_term, "", "NONE", "")
call s:hi("Repeat", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("Special", s:faded4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:faded13_gui, "", s:faded13_term, "", "", "")
call s:hi("SpecialComment", s:faded8_gui, "", s:faded8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("StorageClass", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("String", s:faded14_gui, "", s:faded14_term, "", "", "")
call s:hi("Structure", s:faded9_gui, "", s:faded9_term, "", "", "")
call s:hi("Tag", s:faded4_gui, "", "", "", "", "")
call s:hi("Todo", s:faded13_gui, "NONE", s:faded13_term, "NONE", "", "")
call s:hi("Type", s:faded9_gui, "", s:faded9_term, "", "NONE", "")
call s:hi("Typedef", s:faded9_gui, "", s:faded9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("awkCharClass", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("awkPatterns", s:faded9_gui, "", s:faded9_term, "", "bold", "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:faded7_gui, "", s:faded7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("cssDefinition", s:faded7_gui, "", s:faded7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:faded7_gui, "", s:faded7_term, "", "underline", "")
call s:hi("cssStringQ", s:faded7_gui, "", s:faded7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:faded8_gui, "", s:faded8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("dtExecKey", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("dtLocaleKey", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("dtNumericKey", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("dtTypeKey", s:faded7_gui, "", s:faded7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:faded_uniform_diff_background == 0
  call s:hi("DiffAdd", s:faded14_gui, s:faded0_gui, s:faded14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:faded13_gui, s:faded0_gui, s:faded13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:faded11_gui, s:faded0_gui, s:faded11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:faded13_gui, s:faded0_gui, s:faded13_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:faded14_gui, s:faded1_gui, s:faded14_term, s:faded1_term, "", "")
  call s:hi("DiffChange", s:faded13_gui, s:faded1_gui, s:faded13_term, s:faded1_term, "", "")
  call s:hi("DiffDelete", s:faded11_gui, s:faded1_gui, s:faded11_term, s:faded1_term, "", "")
  call s:hi("DiffText", s:faded13_gui, s:faded1_gui, s:faded13_term, s:faded1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:faded7_gui, "", s:faded7_term, "", "", "")

call s:hi("goBuiltins", s:faded7_gui, "", s:faded7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:faded3_gui, "", s:faded3_term, "", "", "")
call s:hi("helpHyperTextJump", s:faded8_gui, "", s:faded8_term, "", "underline", "")

call s:hi("htmlArg", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("htmlLink", s:faded4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:faded7_gui, "", s:faded7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:faded7_gui, "", s:faded7_term, "", "", "")

call s:hi("lessClass", s:faded7_gui, "", s:faded7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("markdownCode", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("markdownFootnote", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("markdownId", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("markdownH1", s:faded8_gui, "", s:faded8_term, "", "", "")
call s:hi("markdownLinkText", s:faded8_gui, "", s:faded8_term, "", "", "")
call s:hi("markdownUrl", s:faded4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:faded7_gui, "", s:faded7_term, "", "", "")

call s:hi("phpClasses", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("phpDocTags", s:faded7_gui, "", s:faded7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("podVerbatimLine", s:faded4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("rubySymbol", s:faded6_gui, "", s:faded6_term, "", "bold", "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("sassClass", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("sassId", s:faded7_gui, "", s:faded7_term, "", "underline", "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("vimMapRhs", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("vimNotation", s:faded7_gui, "", s:faded7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("xmlCdataStart", s:faded3_gui, "", s:faded3_term, "", "bold", "")
call s:hi("xmlNamespace", s:faded7_gui, "", s:faded7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:faded7_gui, "", s:faded7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:faded13_gui, "", s:faded13_term, "", "", "")
call s:hi("ALEErrorSign" , s:faded11_gui, "", s:faded11_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:faded14_gui, "", s:faded14_term, "", "", "")
call s:hi("GitGutterChange", s:faded13_gui, "", s:faded13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:faded11_gui, "", s:faded11_term, "", "", "")
call s:hi("GitGutterDelete", s:faded11_gui, "", s:faded11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:faded14_gui, "", s:faded14_term, "", "", "")
call s:hi("SignifySignChange", s:faded13_gui, "", s:faded13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:faded11_gui, "", s:faded11_term, "", "", "")
call s:hi("SignifySignDelete", s:faded11_gui, "", s:faded11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:faded11_gui, "", s:faded11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:faded11_gui, "", s:faded11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:faded14_gui, "", s:faded14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:faded4_gui, s:faded3_gui, "", s:faded3_term, "", "")
call s:hi("jediFat", s:faded8_gui, s:faded3_gui, s:faded8_term, s:faded3_term, "bold,underline", "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:faded8_gui, "", s:faded8_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:faded11_gui, "", "", s:faded11_term, "", "")

"+--- Languages ---+
" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:faded8_gui, "", s:faded8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:faded7_gui, "", s:faded7_term, "", "", "")
call s:hi("mkdFootnote", s:faded8_gui, "", s:faded8_term, "", "", "")
call s:hi("mkdRule", s:faded10_gui, "", s:faded10_term, "", "", "")
call s:hi("mkdLineBreak", s:faded9_gui, "", s:faded9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" Coc
hi! CocErrorVirtualText guifg=#e45454
hi! CocErrorLine guibg=#3d2e37

hi! CocWarningVirtualText guifg=#ff9430
hi! CocWarningLine guibg=#403733
