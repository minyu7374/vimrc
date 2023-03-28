augroup filetypedetect
au BufNewFile,BufRead go.mod  setf gomod
au BufNewFile,BufRead *.mod  setf ampl
au BufNewFile,BufRead *.dat  setf ampl
au BufNewFile,BufRead *.ampl setf ampl
augroup END
