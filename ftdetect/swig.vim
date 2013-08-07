if has("autocmd")
  au BufNewFile,BufRead *.swig set ft=html syntax=swig | runtime! ftplugin/swig.vim ftplugin/swig*.vim ftplugin/swig/*.vim
endif
