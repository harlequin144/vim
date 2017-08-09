" Vim syntax file
" Language: Model 204
" Maintainer: Dylan Thompson

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword conditionalKeywords IF ELSE THEN IS LEN AT
syn keyword typeKeywords STRING FLOAT
syn match conditionalMatch 'END IF' 

syn keyword controlKeywords SUBROUTINE RETURN JUMP TO FOR 
syn keyword operatorKeywords GT LT WITH =
syn keyword keywordKeywords CALL PRINT
syn keyword imageKeywords IMAGE 
syn match endImageMatch 'END IMAGE'

syn match commentMatch '^\s*\*.*$'

" Matches
syn match numberMatch '\s\d\+' 
syn match stringMatch "\'[^']*'" 
syn match labelMatch '^\s*\S\+:'
syn match identifierMatch '%[A-Za-z0-9.]\+'

" Regions
" syn keyword endIfKeyword END contained
" syn region ifRegion start='IF' end='END IF' transparent contains=endIfKeyword
"
let b:current_syntax = "m204"

hi def link controlKeywords         Statement 

hi def link conditionalKeywords     Conditional
hi def link conditionalMatch        Conditional
hi def link syntaxElementRegion     Conditional


hi def link numberMatch             Number 
hi def link stringMatch             String 
hi def link labelMatch              Label
hi def link operatorKeywords        Operator      
hi def link keywordKeywords         Keyword      
hi def link identifierMatch         Identifier      
hi def link typeKeywords            Type      

hi def link imageKeywords           Structure      
hi def link endImageMatch           Structure      

hi def link commentMatch            Comment      
