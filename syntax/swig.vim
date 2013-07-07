" Swig syntax
" Language:    Swig
" Maintainer:  Brett
" Last Change: Jul 6th, 2013
" Version:	   0.1
" URL:         https://github.com/brettof86/vim-swigjs

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'html'
endif

ru! syntax/html.vim
unlet b:current_syntax


syn keyword swgTodo             TODO FIXME XXX contained

syn cluster htmlSwgContainer   add=htmlHead,htmlTitle,htmlString,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6
syn region  swgInside          start=/{%/ end=/%}/  keepend transparent containedin=@htmlSwgContainer

syn match   swgBrackets      "{%\|%}"                                 containedin=swgInside

syn region  swgPartial         start=/{%(\s+)?include/lc=2 end=/%}/me=e-2        containedin=swgInside

syn match   swgConditionals    "if\|else\|endif"                        containedin=swgInside
syn match   swgHelpers         "for\|endfor"                              containedin=swgInside


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_lisp_syntax_inits")
  if version < 508
    let did_lisp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink swgTodo          Todo

  HiLink swgBrackets    Identifier

  HiLink swgConditionals  Conditional
  HiLink swgHelpers       Repeat

  HiLink swgPartial       Include

  delcommand HiLink
endif


let b:current_syntax = 'swigjs'
