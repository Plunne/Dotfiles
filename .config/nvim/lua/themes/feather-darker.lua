--[[--------------------------------------------------
     FEATHER DARKER (TreeSitter Version)
     By : Lena SAVY-LARIGALDIE (alias Plunne)	
--]]--------------------------------------------------

local cmd = vim.cmd

cmd("colorscheme default")

local colors = {
        ['main'] = '#9783b1',
        ['red'] = '#ff6c6b',
        ['wine'] = '#af0000',
        ['green'] = '#008700',
        ['olive'] = '#98be65',
        ['orange'] = '#da8548',
        ['yellow'] = '#ecbe7b',
        ['gold'] = '#af875f',
        ['blue'] = '#51afef',
        ['ocean'] = '#5699af',
        ['marine'] = "#2257a0",
        ['cherry'] = '#d70087',
        ['purple'] = '#7a619a',
        ['cyan'] = '#7dcfff',
        ['teal'] = '#1abc9c',
        ['dark'] = '#342942',
        ['dark-grey'] = '#503f65',
        ['mid-grey'] = '#6c5689',
        ['light-grey'] = '#8871a6',
        ['light'] = '#c4b8d3',
        [''] = 'NONE'
}

local italic = 'italic'
local bold = 'bold'
local reverse = 'reverse'
local underline = 'underline'
local none = 'none'

local function hi(key, fg, bg, style)
    cmd("hi ".. key .. " guifg=" .. colors[fg])
    cmd("hi ".. key .. " guibg=" .. colors[bg])
    cmd("hi ".. key .. " gui=" .. style)
end

-- General
hi('Normal', 'light', '', none)
hi('Comment', 'mid-grey', '', italic)
hi('Visual', 'dark', 'main', none)

-- Ponctuation
hi('TSPunctDelimiter', 'light-grey', '', none)
hi('TSPunctBracket', 'light-grey', '', none)

-- Search
hi('Search', 'dark', 'yellow', none)
hi('IncSearch', 'dark', 'cyan', none)

-- Line Numbers
hi('LineNr', 'mid-grey', '', none)
hi('EndOfBuffer', 'dark-grey', '', none)
hi('SignColumn', 'mid-grey', '', none)
hi('VertSplit', 'dark-grey', '', none)
hi('CursorLine', '', '', none)
hi('CursorLineNr', 'main', '', bold)

-- Status Line
hi('StatusLine', '', '', none)
hi('StatusLineNC', '', '', none)

--  General Coding
local General = 'light'
hi('TSIdentifier', General, '', none)
hi('TSVariable', General, '', none)
hi('TSField', General, '', none)
hi('TSParameter', General, '', none)
hi('TSProperty', General, '', none)

local Function = 'blue'
hi('TSFunction', Function, '', none)
hi('TSFuncBuiltin', Function, '', none)
hi('TSMethod', Function, '', none)
hi('TSConstructor', 'cyan', '', none)

local Value = 'orange'
hi('TSCharacter', 'olive', '', none)
hi('TSString', 'olive', '', none)
hi('TSStringEscape', 'marine', '', none)
hi('TSNumber', Value, '', none)
hi('TSBoolean', Value, '', italic)
hi('TSConstant', 'purple', '', none)
hi('TSConstBuiltin', Value, '', none)

local Statement = 'yellow'
hi('TSStatement', Statement, '', none)
hi('TSConditional', 'teal', '', bold)
hi('TSRepeat', 'teal', '', bold)
hi('TSLabel', Statement, '', bold)
hi('TSOperator', 'teal', '', none)
hi('TSKeyword', Statement, '', italic)
hi('TSKeywordFunction', Statement, '', bold)
hi('TSKeywordReturn', Statement, '', bold)
hi('TSException', Statement, '', bold)

local Preproc = 'purple'
hi('TSPreproc', Preproc, '', none)
hi('TSInclude', Preproc, '', none)
hi('TSMacro', Preproc, '', none)
hi('TSConstMacro', Preproc, '', none)
hi('TSFuncMacro', Preproc, '', none)
hi('TSPreCondit', Preproc, '', none)

local Type = 'teal'
hi('TSType', Type, '', italic)
hi('TSStorageClass', Type, '', bold)
hi('TSStructure', Type, '', italic)
hi('TSTypedef', Type, '', bold)
hi('TSVariableBuiltin', Type, '', italic)
hi('TSNamespace', Type, '', italic)

local Special = 'blue'
hi('TSSpecial', Special, '', none)
hi('TSSpecialChar', Special, '', none)
hi('TSTag', Special, '', none)
hi('TSDelimiter', Special, '', none)
hi('TSSpecialComment', 'mid-grey', '', none)
hi('TSDebug', Special, '', none)

-- Miscs
hi('Underlined', 'marine', '', underline)

hi('Ignore', 'light', '', bold)
hi('Error', 'red', '', bold)
hi('Todo', 'orange', '', bold)

hi('Title', 'light', '', bold)
hi('Global', 'light', '', bold)

-- Git
hi('DiffAdd', 'green', '', none)
hi('DiffDelete', 'red', '', none)
hi('DiffChange', 'blue', '', none)
hi('DiffModified', 'blue', '', none)

-- Pmenu
hi('Pmenu', 'light', 'dark-grey', none)
hi('PmenuSel', 'dark', 'main', bold)
hi('PmenuSbar', '', 'mid-grey', none)
hi('PmenuThumb', '', 'main', none)

---------------------
--     Plugins     --
---------------------

-- Indent Blankline
hi('IndentBlanklineChar', 'dark-grey', '', none)

-- NVim Tree
hi('NvimTreeNormal', 'main', '', none)
hi('NvimTreeIndentMarker', 'dark-grey', '', none)
hi('NvimTreeRootFolder', 'mid-grey', '' , none)
hi('NvimTreeFolderIcon', 'mid-grey', '', none)
hi('NvimTreeFolderName', 'mid-grey', '', none)
hi('NvimTreeOpenedFolderName','mid-grey','', bold)
hi('NvimTreeStatusLine', '', '', none)
hi('NvimTreeStatusLineNC', '', '', none)
hi('NvimTreeExecFile', 'main', '', none)
hi('NvimTreeSpecialFile', 'orange', '', underline)

-----------------------
--     Languages     --
-----------------------

-- Bash/Shell/Zsh
hi('bashTSPunctSpecial', 'cherry', '', none)
hi('bashTSConstant', 'cherry', '', bold)
hi('bashTSVariable', 'cherry', '', none)
hi('bashTSFunction', 'light', '', none)
hi('bashTSFuncBuiltin', 'light', '', none)
hi('bashTSParameter', 'light', '', none)
hi('bashTSBoolean', 'orange', '', none)
hi('bashTSConditional', 'blue', '', bold)

-- CSS
hi('cssTSProperty', 'purple', '', none)
hi('cssTSString', 'orange', '', none)

-- HTML
hi('htmlTSTagDelimiter', 'mid-grey', '', none)
hi('htmlTSTag', 'purple', '', none)
hi('htmlTSTagAttribute', 'cherry', '', none)

-- Ini
hi('dosiniHeader', 'cherry', '', bold)
hi('dosiniLabel', 'light-grey', '', none)
hi('dosiniValue', 'olive', '', none)

-- Json
hi('jsonKeyword', 'blue', '', none)
hi('jsonBraces', 'main', '', none)
hi('jsoncKeywordMatch', 'blue', '', none)
hi('jsoncBraces', 'cherry', '', none)

-- Lua
hi('luaTSKeyword', 'teal', '', italic)
hi('luaTSFuncBuiltin', 'purple', '', none)
hi('luaTSProperty', 'purple', '', none)
hi('luaTSConstructor', 'light-grey', '', none)

-- Makefile
hi('makeIdent', 'cherry', '', bold)
hi('makeSpecTarget', 'olive', '', none)
hi('makeTarget', 'blue', '', none)
hi('makeStatement', 'purple', '', none)
hi('makeCommands', 'orange','', none)
hi('makeSpecial', 'orange', '', none)

-- Markdown
hi('htmlTag', 'mid-grey', '', none)
hi('htmlTagName', 'purple', '', none)
hi('htmlEndTag', 'mid-grey', '', none)
hi('htmlArg', 'cherry', '', none)
hi('htmlString', 'olive', '', none)
hi('markdownHeadingDelimiter', 'cherry', '', bold)
hi('markdownHeadingRule', 'cherry', '', bold)
hi('markdownH1', 'cherry', '', bold)
hi('markdownH2', 'cherry', '', bold)
hi('markdownH3', 'cherry', '', bold)
hi('markdownH4', 'cherry', '', bold)
hi('markdownH5', 'cherry', '', bold)
hi('markdownH6', 'cherry', '', bold)
hi('markdownRule', 'light', '', none)
hi('markdownBold', 'light-grey', '', bold)
hi('markdownBoldDelimiter', 'light-grey', '', bold)
hi('markdownItalic', 'light-grey', '', italic)
hi('markdownItalicDelimiter', 'light-grey', '', italic)
hi('markdownListMarker', 'cherry', '', none)
hi('markdownOrderedListMarker', 'cherry', '', none)
hi('markdownLinkDelimiter', 'marine', '', none)
hi('markdownLinkText', 'light-grey', '', none)
hi('markdownLinkTextDelimiter', 'light-grey', '', none)
hi('markdownUrl', 'marine', '', underline)
hi('markdownId', 'yellow', '', bold)
hi('markdownIdDeclaration', 'yellow', '', bold)
hi('markdownIdDelimiter', 'yellow', '', bold)
hi('markdownCode', 'orange', '', none)
hi('markdownCodeBlock', 'orange', '', none)
hi('markdownCodeDelimiter', 'light-grey', '', none)

-- Php
hi('phpTSVariable', 'cherry', '', bold)
hi('phpTSKeyword', 'cherry', '', italic)
hi('phpTSKeywordFunction', 'purple', '', bold)

-- Python
hi('pythonTSInclude', 'orange', '', bold)
hi('pythonTSKeywordFunction', 'purple', '', bold)
hi('pythonTSField', 'blue', '', none)

-- Yaml
hi('yamlTSField', 'purple', '', none)
hi('yamlTSPunctDelimiter', 'cherry', '', none)

-- Zsh
hi('zshPreProc', Preproc, '', none)
hi('zshCommands', Function, '', none)
hi('zshConditional', 'teal', '', bold)
hi('zshString', 'olive', '', none)
hi('zshSubst', Preproc, '', bold)
hi('zshVariableDef', Type, '', bold)
hi('zshDeref', Type, '', bold)
hi('zshRedir', 'cherry', '', none)
hi('zshOptStart', Function, '', none)
hi('zshOption', 'orange', '', none)
hi('zshQuoted', 'marine', '', none)
hi('zshTypes', 'yellow', '', italic)
hi('zshNumber', 'orange', '', none)
hi('zshKeyword', 'yellow', '', bold)
