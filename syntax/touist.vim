" Vim syntax file
" Language: touist
" Maintainer: Maël Valais
" Latest Revision: 12 June 2017

if exists("b:current_syntax")
  finish
endif

syn sync fromstart

" Keywords
syn keyword touistKeyword if then else end bigand bigor diff inter union mod in
syn keyword touistKeyword exists forall and or not
syn keyword touistType let nextgroup=touistLabel skipwhite

syn match touistArithmeticSetOperator "\.\."

" Integer with - + or nothing in front
syn match touistNumber '\d\+'
syn match touistNumber '[-+]\d\+'

" Floating point touistNumber with decimal no E or e (+,-)
syn match touistNumber '\d*\.\d\+'
syn match touistNumber '[-+]\d*\.\d\+'

" Floating point like touistNumber with E and no decimal point (+,-)
syn match touistNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match touistNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like touistNumber with E and decimal point (+,-)
syn match touistNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match touistNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match touistVariable /\$[a-zA-Z0-9_]+/
syn match touistIndex   /\<\%(in\>\)\@!\w*/ contained contains=touistKeyword,touistNumber
syn match touistLabel  '[a-zA-Z][a-zA-Z0-9_]*()'
syn match touistArithmeticOperator	"[-+]"
syn match touistArithmeticOperator	"\.\=[*/\\^]"
syn match touistRelationalOperator	"[=~]="
syn match touistRelationalOperator	"[<>]=\="
syn match touistLogicalOperator		"[&|~]"

" match indeces

" comments
syn match touistComment ';;.\{-}$'

" strings
syn region touistString start=/[a-zA-Z_]+(/ end=")" transparent
syn region touistString start="\'" end="\'" contains=touistStringToken
syn match touistStringToken '\%[a-z]' contained


" Regions
"syn region touistBigOp start="big\(and\|or\)" end="end" transparent contains=touist,touistBigOp
syn match touistBigand 'bigand'
syn region touistIndexGroup start="\[" end="\]" transparent contains=touistIndex
" syn region touistParen start="(" end=")"

"" catch errors caused by wrong parenthesis
syn match   touistParensError    ")\|}\|\]"
syn match   touistParensErrA     contained "\]"
syn match   touistParensErrC     contained "}"


hi level1c  ctermfg=brown       guifg=brown              
hi level2c  ctermfg=darkgreen   guifg=darkgreen   gui=bold
hi level3c  ctermfg=Darkblue    guifg=Darkblue            
hi level4c  ctermfg=darkmagenta guifg=darkmagenta gui=bold
hi level5c  ctermfg=darkcyan    guifg=darkcyan            
hi level6c  ctermfg=white       guifg=white       gui=bold
hi level7c  ctermfg=darkred     guifg=darkred
hi level8c  ctermfg=blue        guifg=blue        gui=bold 
hi level9c  ctermfg=darkgray    guifg=darkgray                 
hi level10c ctermfg=brown       guifg=brown       gui=bold 
hi level11c ctermfg=darkgreen   guifg=darkgreen         
hi level12c ctermfg=Darkblue    guifg=Darkblue    gui=bold 
hi level13c ctermfg=darkmagenta guifg=darkmagenta            
hi level14c ctermfg=darkcyan    guifg=darkcyan    gui=bold 
hi level15c ctermfg=gray       guifg=gray          

" These are the regions for each pair.
" This could be improved, perhaps, by makeing them match [ and { also,
" but I'm not going to take the time to figure out haw to make the
" end pattern match only the proper type.
syn region level1 matchgroup=level1c start=/(/ end=/)/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, NoInParens
syn region level2 matchgroup=level2c start=/(/ end=/)/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, NoInParens
syn region level3 matchgroup=level3c start=/(/ end=/)/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, NoInParens
syn region level4 matchgroup=level4c start=/(/ end=/)/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, NoInParens
syn region level5 matchgroup=level5c start=/(/ end=/)/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, NoInParens
syn region level6 matchgroup=level6c start=/(/ end=/)/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, NoInParens
syn region level7 matchgroup=level7c start=/(/ end=/)/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15, NoInParens
syn region level8 matchgroup=level8c start=/(/ end=/)/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15, NoInParens
syn region level9 matchgroup=level9c start=/(/ end=/)/ contains=TOP,level9,level10,level11,level12,level13,level14,level15, NoInParens
syn region level10 matchgroup=level10c start=/(/ end=/)/ contains=TOP,level10,level11,level12,level13,level14,level15, NoInParens
syn region level11 matchgroup=level11c start=/(/ end=/)/ contains=TOP,level11,level12,level13,level14,level15, NoInParens
syn region level12 matchgroup=level12c start=/(/ end=/)/ contains=TOP,level12,level13,level14,level15, NoInParens
syn region level13 matchgroup=level13c start=/(/ end=/)/ contains=TOP,level13,level14,level15, NoInParens
syn region level14 matchgroup=level14c start=/(/ end=/)/ contains=TOP,level14,level15, NoInParens
syn region level15 matchgroup=level15c start=/(/ end=/)/ contains=TOP,level15, NoInParens

let b:current_syntax = "touist"

hi def link touistKeyword Keyword
hi def link touistParensError Error
hi def link touistParensErrA Error
hi def link touistParensErrB Error
hi def link touistParensErrC Error
" hi def link touistBigOp Label
" hi def link touistParen Label
" hi def link touistIndexGroup Label
hi def link touistVariable Identifier
hi def link touistNumber Number
hi def link touistComment Comment
hi def link touistType Type
hi def link touistLabel Keyword
hi def link touistString String
hi def link touistStringToken Special 
