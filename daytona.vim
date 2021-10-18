" This Source Code Form is subject to the terms of the Mozilla Public
" License, v. 2.0. If a copy of the MPL was not distributed with this
" file, You can obtain one at https://mozilla.org/MPL/2.0/.
"
" <leader>co

if exists("g:daytona")
  finish
endif
let g:daytona = 1
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name='daytona'

let s:p={
    \ 'null': ['NONE', 'NONE'],
    \ 'bg': ['#111111', 235],
    \ 'fg': ['#AAAAAA', 145],
    \ 'cursor': ['#CCCCCC', 250],
    \ 'identifierUnderCaret': ['#344134', 237],
    \ 'identifierUnderCaretWrite': ['#40332B', 58],
    \ 'selection': ['#214283', 24],
    \ 'cursorLine': ['#2F2F2F', 236],
    \ 'gutter': ['#1F1F1F', 236],
    \ 'cursorLineNr': ['#A4A3A3', 248],
    \ 'errorMsg': ['#CC666E', 174],
    \ 'error': ['#BC3F3C', 131],
    \ 'warnng': ['#A9B7C6', 145],
    \ 'muted': ['#606060', 241],
    \ 'link': ['#287BDE', 32],
    \ 'stdOutput': ['#BBBBBB', 250],
    \ 'lineNumber': ['#505050', 241],
    \ 'matchBraceFg': ['#FFEF28', 220],
    \ 'matchBraceBg': ['#3B514D', 59],
    \ 'todo': ['#A8C023', 142],
    \ 'search': ['#32593D', 23],
    \ 'incSearch': ['#155221', 22],
    \ 'foldedFg': ['#AAAAAA', 245],
    \ 'foldedBg': ['#111111', 237],
    \ 'constant': ['#9876AA', 103],
    \ 'keyword': ['#CC7832', 172],
    \ 'comment': ['#6897BB', 103],
    \ 'docComment': ['#629755', 65],
    \ 'string': ['#6A8759', 101],
    \ 'number': ['#6897BB', 103],
    \ 'delimiter': ['#CC7832', 172],
    \ 'specialComment': ['#8A653B', 95],
    \ 'function': ['#FFC66D', 216],
    \ 'diffAdd': ['#294436', 23],
    \ 'diffText': ['#385570', 60],
    \ 'diffDelete': ['#484A4A', 239],
    \ 'diffChange': ['#303C47', 23],
    \ 'addStripe': ['#384C38', 66],
    \ 'stripeWhiteSpace': ['#4C4638', 59],
    \ 'changeStripe': ['#374752', 60],
    \ 'deleteStripe': ['#656E76', 242],
    \ 'typo': ['#659C6B', 72],
    \ 'metaData': ['#BBB529', 142],
    \ 'macroName': ['#908B25', 100],
    \ 'cDataStructure': ['#B5B6E3', 146],
    \ 'cStructField': ['#9373A5', 103],
    \ 'debug': ['#666D75', 102],
    \ 'codeError': ['#532B2E', 52],
    \ 'codeWarning': ['#52503A', 59],
    \ 'errorStripe': ['#9E2927', 124],
    \ 'warnStripe': ['#BE9117', 136],
    \ 'infoStripe': ['#756D56', 101],
    \ 'typeDef': ['#B9BCD1', 146],
    \ 'menu': ['#46484A', 238],
    \ 'menuFg': ['#BBBBBB', 250],
    \ 'menuSel': ['#113A5C', 23],
    \ 'menuSBar': ['#616263', 241],
    \ 'tag': ['#E8BF6A', 180],
    \ 'entity': ['#6D9CBE', 109],
    \ 'htmlAttribute': ['#BABABA', 250],
    \ 'htmlString': ['#77dd77', 143],
    \ 'tsObject': ['#507874', 66],
    \ 'statusLine': ['#3C3F41', 237],
    \ 'statusLineFg': ['#BBBBBB', 250],
    \ 'statusLineNC': ['#787878', 243],
    \ 'tabLineSel': ['#113A5C', 239],
    \ 'shCommand': ['#C57633', 137],
    \ 'templateLanguage': ['#232525', 235],
    \ 'rustMacro': ['#4EADE5', 74],
    \ 'rustLifetime': ['#20999D', 37],
    \ 'duplicateFromServer': ['#5E5339', 59],
    \ 'hintBg': ['#3B3B3B', 237],
    \ 'hintFg': ['#787878', 243],
    \ 'wrapGuide': ['#2F2F2F', 236],
    \ 'ANSIBlack': ['#FFFFFF', 231],
    \ 'ANSIRed': ['#FF6B68', 210],
    \ 'ANSIGreen': ['#A8C023', 142],
    \ 'ANSIYellow': ['#D6BF55', 179],
    \ 'ANSIBlue': ['#5394EC', 68],
    \ 'ANSIMagenta': ['#AE8ABE', 139],
    \ 'ANSICyan': ['#299999', 37],
    \ 'ANSIGray': ['#999999', 247],
    \ 'ANSIDarkGray': ['#555555', 240],
    \ 'ANSIBrightRed': ['#FF8785', 210],
    \ 'ANSIBrightGreen': ['#A8C023', 142],
    \ 'ANSIBrightYellow': ['#FFFF00', 226],
    \ 'ANSIBrightBlue': ['#7EAEF1', 110],
    \ 'ANSIBrightMagenta': ['#FF99FF', 219],
    \ 'ANSIBrightCyan': ['#6CDADA', 116],
    \ 'ANSIWhite': ['#1F1F1F', 234],
    \ 'UIBlue': ['#3592C4', 67],
    \ 'UIGreen': ['#499C54', 71],
    \ 'UIRed': ['#C75450', 131],
    \ 'UIBrown': ['#93896C', 102]
    \ }

" expose the palette
let daytona#palette=s:p

" helper function
function s:Hi(group, fg, ...)
  " arguments: group, fg, bg, style
  if a:0 >= 1
    let bg=a:1
  else
    let bg=s:p.null
  endif
  if a:0 >= 2 && strlen(a:2)
    let style=a:2
  else
    let style='NONE'
  endif
  let hiList = [
        \ 'hi', a:group,
        \ 'ctermfg=' . a:fg[1],
        \ 'guifg=' . a:fg[0],
        \ 'ctermbg=' . bg[1],
        \ 'guibg=' . bg[0],
        \ 'cterm=' . style,
        \ 'gui=' . style
        \ ]
  execute join(hiList)
endfunction

" expose that function
function daytona#Hi(group, fg, ...)
  if a:0 >= 2
    call s:Hi(a:group, a:fg, a:1, a:2)
  elseif a:0 == 1
    call s:Hi(a:group, a:fg, a:1)
  else
    call s:Hi(a:group, a:fg)
  endif
endfunction

call s:Hi('Normal', s:p.fg, s:p.bg)
call s:Hi('ColorColumn', s:p.null, s:p.wrapGuide)
call s:Hi('Conceal', s:p.muted, s:p.bg)
call s:Hi('Cursor', s:p.cursor)
hi! link lCursor Cursor
hi! link CursorIM Cursor
hi! link CursorColumn CursorLine
call s:Hi('CursorLine', s:p.null, s:p.cursorLine, 'NONE')
call s:Hi('DiffAdd', s:p.null, s:p.diffAdd)
call s:Hi('DiffChange', s:p.null, s:p.diffChange)
call s:Hi('DiffDelete', s:p.null, s:p.diffDelete)
call s:Hi('DiffText', s:p.null, s:p.diffText)
hi! link Directory NormalFg
hi! link EndOfBuffer NonText
call s:Hi('ErrorMsg', s:p.errorMsg)
call s:Hi('Error', s:p.error)
call s:Hi('VertSplit', s:p.muted)
call s:Hi('Folded', s:p.foldedFg, s:p.foldedBg)
hi! link FoldColumn Folded
call s:Hi('SignColumn', s:p.null, s:p.gutter)
call s:Hi('LineNr', s:p.lineNumber, s:p.gutter)
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
call s:Hi('CursorLineNr', s:p.cursorLineNr, s:p.cursorLine)
call s:Hi('MatchParen', s:p.matchBraceFg, s:p.matchBraceBg, 'bold')
call s:Hi('ModeMsg', s:p.stdOutput)
hi! link MoreMsg NormalFg
call s:Hi('NonText', s:p.muted)
call s:Hi('Pmenu', s:p.menuFg, s:p.menu)
call s:Hi('PmenuSel', s:p.menuFg, s:p.menuSel)
call s:Hi('PmenuSbar', s:p.menu, s:p.menu)
call s:Hi('PmenuThumb', s:p.menuSBar, s:p.menuSBar)
hi! link Question NormalFg
hi! link QuickFixLine NormalFg
call s:Hi('Search', s:p.null, s:p.search)
call s:Hi('IncSearch', s:p.null, s:p.incSearch)
hi! link SpecialKey NonText
call s:Hi('SpellBad', s:p.typo, s:p.null, 'underline')
hi! link SpellCap SpellBad
hi! link SpellLocal SpellBad
hi! link SpellRare SpellBad
call s:Hi('StatusLine', s:p.statusLineFg, s:p.statusLine)
call s:Hi('StatusLineNC', s:p.statusLineNC, s:p.statusLine)
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
call s:Hi('TabLine', s:p.statusLineFg, s:p.gutter)
call s:Hi('TabLineFill', s:p.statusLine, s:p.gutter)
call s:Hi('TabLineSel', s:p.fg, s:p.tabLineSel)
call s:Hi('Terminal', s:p.stdOutput, s:p.bg)
hi! link Title Special
call s:Hi('Visual', s:p.null, s:p.selection)
hi! link VisualNOS Visual
" call s:Hi('WarningMsg', s:p.warning)
hi! link WildMenu PmenuSel
call s:Hi('Comment', s:p.comment)
hi! link Identifier NormalFg
hi! link Type Keyword
call s:Hi('Typedef', s:p.typeDef)
call s:Hi('Todo', s:p.todo, s:p.null, 'italic')
hi! link Special PreProc
call s:Hi('Constant', s:p.constant, s:p.null, 'italic')
call s:Hi('String', s:p.string)
hi! link Character String
call s:Hi('Number', s:p.number)
call s:Hi('Delimiter', s:p.delimiter)
call s:Hi('SpecialComment', s:p.specialComment, s:p.null, 'italic')
hi! link Statement Keyword
call s:Hi('Keyword', s:p.keyword)
call s:Hi('Underlined', s:p.fg, s:p.null, 'underline')
call s:Hi('PreProc', s:p.metaData)
hi! link Tag Keyword
call s:Hi('Debug', s:p.debug, s:p.null, 'italic')
call s:Hi('Function', s:p.function)

" neovim
if has('nvim')
  " the following code snippet fix an issue with CursorLine hi group
  " see https://github.com/neovim/neovim/issues/9019
  if has('termguicolors') && &termguicolors
    hi CursorLine ctermfg=white
  else
    hi CursorLine guifg=white
  endif
  hi! link NormalFloat Pmenu
  hi! link NormalNC NormalFg
  hi! link MsgArea NormalFg
  hi! link MsgSeparator StatusLine
  hi! link QuickFixLine NormalFg
  hi! link Substitute Search
  " TermCursor
  " TermCursorNC
  hi! link Whitespace NonText
  hi! link healthSuccess IncSearch
  call s:Hi('NvimInternalError', s:p.error, s:p.error)
  call s:Hi('RedrawDebugClear', s:p.fg, s:p.duplicateFromServer)
  call s:Hi('RedrawDebugComposed', s:p.fg, s:p.search)
  call s:Hi('RedrawDebugRecompose', s:p.fg, s:p.codeError)
  " Terminal colors
  let g:terminal_color_0 = s:p.ANSIBlack[0]
  let g:terminal_color_1 = s:p.ANSIRed[0]
  let g:terminal_color_2 = s:p.ANSIGreen[0]
  let g:terminal_color_3 = s:p.ANSIYellow[0]
  let g:terminal_color_4 = s:p.ANSIBlue[0]
  let g:terminal_color_5 = s:p.ANSIMagenta[0]
  let g:terminal_color_6 = s:p.ANSICyan[0]
  let g:terminal_color_7 = s:p.ANSIGray[0]
  let g:terminal_color_8 = s:p.ANSIDarkGray[0]
  let g:terminal_color_9 = s:p.ANSIBrightRed[0]
  let g:terminal_color_10 = s:p.ANSIBrightGreen[0]
  let g:terminal_color_11 = s:p.ANSIBrightYellow[0]
  let g:terminal_color_12 = s:p.ANSIBrightBlue[0]
  let g:terminal_color_13 = s:p.ANSIBrightMagenta[0]
  let g:terminal_color_14 = s:p.ANSIBrightCyan[0]
  let g:terminal_color_15 = s:p.ANSIWhite[0]
endif

" helper groups
call s:Hi('docComment', s:p.docComment, s:p.null, 'italic')
call s:Hi('NormalFg', s:p.fg)
call s:Hi('GitAddStripe', s:p.addStripe, s:p.addStripe)
call s:Hi('GitChangeStripe', s:p.changeStripe, s:p.changeStripe)
call s:Hi('GitDeleteStripe', s:p.deleteStripe, s:p.gutter)
call s:Hi('CodeError', s:p.null, s:p.codeError)
call s:Hi('CodeWarning', s:p.null, s:p.codeWarning)
call s:Hi('CodeInfo', s:p.null, s:p.infoStripe)
call s:Hi('CodeHint', s:p.hintFg, s:p.hintBg)
call s:Hi('ErrorSign', s:p.errorStripe, s:p.gutter)
call s:Hi('WarningSign', s:p.warnStripe, s:p.gutter)
call s:Hi('InfoSign', s:p.infoStripe, s:p.gutter)
call s:Hi('IdentifierUnderCaret', s:p.null, s:p.identifierUnderCaret)
call s:Hi('IdentifierUnderCaretWrite', s:p.null, s:p.identifierUnderCaretWrite)
call s:Hi('InstanceField', s:p.constant)

" Vim terminal colors (for :terminal)
if !has('nvim')
  let g:terminal_ansi_colors=[
        \ s:p.ANSIBlack[0],
        \ s:p.ANSIRed[0],
        \ s:p.ANSIGreen[0],
        \ s:p.ANSIYellow[0],
        \ s:p.ANSIBlue[0],
        \ s:p.ANSIMagenta[0],
        \ s:p.ANSICyan[0],
        \ s:p.ANSIGray[0],
        \ s:p.ANSIDarkGray[0],
        \ s:p.ANSIBrightRed[0],
        \ s:p.ANSIBrightGreen[0],
        \ s:p.ANSIBrightYellow[0],
        \ s:p.ANSIBrightBlue[0],
        \ s:p.ANSIBrightMagenta[0],
        \ s:p.ANSIBrightCyan[0],
        \ s:p.ANSIWhite[0]
        \ ]
endif

" Tree-sitter
hi! link TSAnnotation Normal
hi! link TSAttribute Normal
hi! link TSBoolean Keyword
hi! link TSCharacter Character
hi! link TSComment Comment
hi! link TSConstructor Function
hi! link TSConditional Keyword
hi! link TSConstant Constant
hi! link TSConstBuiltin Keyword
hi! link TSConstMacro cMacroName
hi! link TSError codeError
hi! link TSException codeError
hi! link TSField InstanceField
hi! link TSFloat Number
hi! link TSFunction Function
hi! link TSFuncBuiltin Normal
hi! link TSFuncMacro cMacroName
hi! link TSInclude PreProc
hi! link TSKeyword Keyword
hi! link TSKeywordFunction Keyword
hi! link TSLabel Normal
hi! link TSMethod Function
hi! link TSNamespace cDataStructure
hi! link TSNone Keyword
hi! link TSNumber Number
hi! link TSOperator Normal
hi! link TSParameter Normal
hi! link TSParameterReference Normal
hi! link TSProperty TSField
hi! link TSPunctDelimiter Normal
hi! link TSPunctBracket Normal
hi! link TSPunctSpecial Keyword
hi! link TSRepeat Keyword
hi! link TSString String
hi! link TSStringRegex Number
hi! link TSStringEscape Keyword
hi! link TSTag htmlTag
hi! link TSTagDelimiter htmlTag
hi! link TSText Normal
call s:Hi('TSEmphasis', s:p.fg, s:p.null, 'bold')
call s:Hi('TSUnderline', s:p.fg, s:p.null, 'underline')
call s:Hi('TSStrike', s:p.fg, s:p.null, 'strikethrough')
call s:Hi('TSTitle', s:p.fg, s:p.null, 'bold,underline')
hi! link TSLiteral Normal
hi! link TSURI markdownLinkText
hi! link TSType Normal
hi! link TSTypeBuiltin Keyword
hi! link TSVariable Normal
hi! link TSVariableBuiltin Keyword

" C/C++
call s:Hi('cMacroName', s:p.macroName)
hi! link cConstant cMacroName
hi! link cPreInclude String
hi! link cPreProcRegion NormalFg
hi! link cUserLabel NormalFg
hi! link cDataStructureKeyword Keyword
call s:Hi('cDataStructure', s:p.cDataStructure)
hi! link cFunction Function
hi! link cppDestructor cFunction
hi! link cSemicolon Keyword
hi! link cComma Keyword
call s:Hi('cppAfterColon', s:p.cStructField)
hi! link cppBeforeColon cDataStructure
call s:Hi('cStructField', s:p.cStructField)
hi! link cppNullptr Keyword
hi! link cppTemplate Keyword
hi! link cTypedef Keyword
hi! link cppTypeName Keyword
hi! link cSpecial Keyword
hi! link cEnum Keyword
call s:Hi('cSomeMacro', s:p.macroName)

" Rust
call s:Hi('rustDeriveTrait', s:p.metaData)
hi! link rustQuestionMark Keyword
hi! link rustComma Keyword
hi! link rustSemicolon Keyword
hi! link rustOperator NormalFg
call s:Hi('rustCommentLineDoc', s:p.docComment, s:p.null, 'italic')
call s:Hi('rustMacro', s:p.rustMacro)
hi! link rustAssert rustMacro
hi! link rustPanic rustMacro
hi! link rustEscape Keyword
hi! link rustSigil NormalFg
hi! link rustSelf Keyword
call s:Hi('rustLifetime', s:p.rustLifetime, s:p.null, 'italic')
call s:Hi('rustTypeParameter', s:p.rustLifetime)
hi! link rustEnumVariant Constant
hi! link rustModPath NormalFg
hi! link rustModPathSep NormalFg
hi! link rustAs Keyword
hi! link rustConst Constant
hi! link rustVarField InstanceField

" Vim
hi! link vimOption Constant
hi! link vimFunction Function
hi! link vimContinue NonText
hi! link vimParenSep NormalFg
hi! link vimBracket PreProc
hi! link vimOper NormalFg
hi! link vimSep NormalFg
hi! link vimCommentString Comment

" JavaScript
hi! link jsNoise Keyword
hi! link JsImport Keyword
hi! link JsFrom Keyword
hi! link JsOperator NormalFg
hi! link jsArrowFunction NormalFg
hi! link jsFuncArgCommas Delimiter
hi! link jsObjectKey InstanceField
hi! link jsTernaryIfOperator NormalFg
hi! link jsObjectSeparator Keyword
hi! link jsSpreadOperator NormalFg
hi! link jsModuleComma Keyword
hi! link jsClassDefinition NormalFg
hi! link jsSuper Keyword
hi! link jsThis Keyword
hi! link jsObjectProp InstanceField
hi! link jsDestructuringNoise Keyword
hi! link jsClassProperty Function
hi! link jsBooleanTrue Keyword
hi! link jsBooleanFalse Keyword
hi! link jsObjectShorthandProp NormalFg
hi! link jsObjectColon NormalFg
hi! link jsExport Keyword
hi! link jsModuleAs Keyword

" TypeScript
hi! link typescriptBraces NormalFg
hi! link typescriptDocComment docComment
hi! link typescriptDocParam docComment
hi! link typescriptParens NormalFg
hi! link typescriptOpSymbols InstanceField
hi! link typescriptRegexpString Number
hi! link typescriptSpecial Keyword
hi! link typescriptLogicSymbols InstanceField
hi! link typescriptExceptions Keyword
call s:Hi('typescriptDocTags', s:p.docComment, s:p.null, 'bold,italic,underline')
call s:Hi('typescriptGlobalObjects', s:p.tsObject)

" JSON
hi! link jsonBraces NormalFg
hi! link jsonKeyword InstanceField
hi! link jsonNoise Keyword
hi! link jsonKeywordMatch Keyword
hi! link jsonBoolean Keyword
hi! link jsonNull Keyword
hi! link jsonEscape Keyword
hi! link jsonStringMatch String

" XML
call s:Hi('xmlTagName', s:p.tag)
hi! link xmlEndTag xmlTagName
hi! link xmlAttrib NormalFg
hi! link xmlProcessingDelim xmlTagName
hi! link xmlDocTypeKeyword xmlTagName
hi! link xmlComment Comment
hi! link xmlCommentStart xmlComment
hi! link xmlCommentPart xmlComment
call s:Hi('xmlEntity', s:p.entity)
hi! link xmlEntityPunct xmlEntity
hi! link xmlCdata NormalFg
hi! link xmlCdataCdata xmlCdata
hi! link xmlCdataStart xmlCdata
hi! link xmlCdataEnd xmlCdata
hi! link xmlNamespace InstanceField
hi! link xmlAttribPunct NormalFg
hi! link xmlEqual xmlString

" GraphQL
hi! link graphqlTaggedTemplate NormalFg

" YAML
hi! link yamlDocumentStart NormalFg
hi! link yamlDocumentEnd NormalFg
hi! link yamlComment docComment
hi! link yamlBlockMappingKey Keyword
hi! link yamlKeyValueDelimiter NormalFg
hi! link yamlInteger NormalFg
hi! link yamlFloat NormalFg
hi! link yamlBlockCollectionItemStart NormalFg
call s:Hi('yamlAnchor', s:p.tag)
hi! link yamlAlias yamlAnchor
hi! link yamlBool NormalFg
hi! link yamlNodeTag NormalFg
hi! link yamlNull NormalFg


" HTML
let html_no_rendering=1
call s:Hi('htmlTag', s:p.tag)
hi! link htmlTagName htmlTag
hi! link htmlEndTag htmlTag
call s:Hi('htmlArg', s:p.htmlAttribute)
call s:Hi('htmlString', s:p.htmlString)
hi! link htmlValue htmlString
hi! link htmlComment Comment
hi! link htmlCommentError Comment
hi! link htmlCommentPart Comment
call s:Hi('htmlSpecialChar', s:p.fg)
hi! link htmlSpecialTagName htmlTag
hi! link htmlArg htmlTag


" Shell Script
call s:Hi('sheBang', s:p.fg, s:p.null, 'bold')
hi! link shRange NormalFg
hi! link shFunctionKey Keyword
call s:Hi('shStatement', s:p.shCommand)
hi! link bashStatement shStatement
hi! link shDerefVar NormalFg
hi! link shQuote String
call s:Hi('shHereDoc', s:p.null, s:p.templateLanguage)
call s:Hi('shRedir', s:p.fg, s:p.null, 'bold')
hi! link shDerefSimple NormalFg
hi! link shCommandSubBQ InstanceField
hi! link shOption NormalFg
hi! link shCmdSubRegion shStatement
hi! link shCommandSub NormalFg
hi! link shLoop Keyword
hi! link shCommandSub Keyword
hi! link shSet shStatement
hi! link shFunctionTwo shStatement
hi! link shCtrlSeq String
hi! link shSpecial String
hi! link shCommandSub NormalFg
hi! link shDerefSpecial NormalFg
hi! link shOperator NormalFg

" help
hi! link helpHyperTextJump Number

" My PHP
"hi! link phpFunctions link
call s:Hi('phpFunctions', s:p.fg)

" My SCSS
call s:Hi('scssSelectorName', s:p.htmlString)
call s:Hi('cssPositioningAttr', s:p.htmlString) " sets up the color
hi! link cssBackgroundAttr cssPositioningAttr
hi! link cssFlexibleBoxAttr cssPositioningAttr
hi! link cssBoxAttr cssPositioningAttr
hi! link cssTextAttr cssPositioningAttr
hi! link cssUIAttr cssPositioningAttr
hi! link cssAnimationAttr cssPositioningAttr
hi! link scssVariable cssPositioningAttr
hi! link cssBorderAttr cssPositioningAttr

hi! link scssAttribute scssSemiColon
hi! link cssBraces scssSemiColon
hi! link scssSelectorChar scssSemiColon

hi! link cssFontAttr cssPositioningAttr
hi! link cssStringQ cssPositioningAttr
hi! link cssCommonAttr cssPositioningAttr
hi! link cssTagName scssSelectorName

" My Markdown ================================
" Make these Red
call s:Hi('htmlH1', s:p.error)
hi! link htmlH2 htmlH1

" Make these Yellow
call s:Hi('htmlH3', s:p.warnStripe)

" Make these Purple
call s:Hi('htmlH4', s:p.constant)

" My CSS ======================================
" Make these Red
call s:Hi('cssDefinition', s:p.UIRed)
hi! link cssFontProp cssDefinition
hi! link cssFontDescriptorProp cssDefinition
hi! link cssBackgroundProp cssDefinition
hi! link cssBorderProp cssDefinition
hi! link cssTextProp cssDefinition
hi! link cssTransitionProp cssDefinition
hi! link cssMediaProp cssDefinition
hi! link cssPositioningProp cssDefinition
hi! link cssUIProp cssDefinition
hi! link cssPageProp cssDefinition
hi! link cssBoxProp cssDefinition
hi! link cssListProp cssDefinition
hi! link cssTableProp cssDefinition
hi! link cssColorProp cssDefinition
hi! link cssFlexibleBoxProp cssDefinition
hi! link cssMultiColumnAttr cssDefinition
hi! link cssCascadeAttr cssDefinition
hi! link cssVendor cssDefinition
hi! link cssGridProp cssDefinition
" Make these White
call s:Hi('cssStringQQ', s:p.fg)
hi! link cssURL cssStringQQ
hi! link cssValueNumber cssStringQQ
hi! link cssFontAttr cssStringQQ
hi! link cssFontAttr cssStringQQ
hi! link cssColor cssStringQQ
hi! link cssUnitDecorators cssStringQQ
hi! link cssAttrRegion cssStringQQ
hi! link cssCommonAttr cssStringQQ
hi! link cssValueLength cssStringQQ
hi! link cssValueTime cssStringQQ
hi! link cssTransitionAttr cssStringQQ
hi! link cssTableAttr cssStringQQ
hi! link cssAttrRegion cssStringQQ
hi! link cssUIAttr cssStringQQ
hi! link cssTextAttr cssStringQQ
hi! link cssCascadeProp cssStringQQ
hi! link cssPositioningAttr cssStringQQ
hi! link cssFunction cssStringQQ
hi! link cssValueAngle cssStringQQ
hi! link cssMultiColumnAttr cssStringQQ
" Make These Orange
hi! link cssNoise Keyword
hi! link cssBraces Keyword
hi! link cssClassNameDot Keyword
hi! link cssAttrComa Keyword
" Make These Green
hi! link cssClassName cssTagName
hi! link cssPseudoClassId cssTagName
hi! link cssPseudoClass cssTagName
