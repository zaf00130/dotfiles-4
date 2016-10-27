" --------------------------------------------------------------------
"  terryma/vim-multiple-cursors
" --------------------------------------------------------------------

if dein#is_sourced('vim-multiple-cursors')
  function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
    echo 'Disabled autocomplete'
  endfunction
  
  function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
    echo 'Enabled autocomplete'
  endfunction
endif
